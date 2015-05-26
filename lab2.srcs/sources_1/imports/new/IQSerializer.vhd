----------------------------------------------------------------------------------
-- Engineer: Richard Addo & George Boateng
-- Create Date: 04/10/2015 02:58:45 AM
-- Module Name: IQSerializer - Behavioral
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;
use IEEE.math_real.all;


entity IQSerializer is
    generic(
            DATA_NUM_BITS : integer := 8
    );
    Port ( clk : in STD_LOGIC;
            ser_in_start : in std_logic;   -- from buffer when it's time to flush
           ser_in_char : in std_logic_vector (DATA_NUM_BITS-1 downto 0); -- the character to be encoded
           ser_out_reset_rd_addr : out std_logic; 
           ser_out_rd_cnt_en : out std_logic;
           ser_out_ram_rd_en : out std_logic;
           ser_out_serialI : out std_logic; 
           ser_out_flushDone : out std_logic; 
           ser_out_serialQ : out std_logic;
           ser_in_rotate : in std_logic_vector(1 downto 0);
           ser_in_symbolClk : in std_logic
           );
end IQSerializer;

architecture Behavioral of IQSerializer is
   
   type state_type is(idle, readingChar, sendingSymbol, checkingIfCanSendMoreSymbols, updatingReadPosition, checkingNUL, resettingEncoder);
   signal current_state, next_state : state_type := idle;
   signal canSendMoreSymbols, resetBitIdx, updateBitIdx : std_logic; 
   signal bitIdx : integer := 0;
    
        -- for the encoder
    constant NUM_SYMBOL_BITS : integer := 2;
    constant NULL_CHAR : std_logic_vector(DATA_NUM_BITS-1 downto 0) := x"00";
    signal  diff_encode_reset, serQ, serI, serialI, serialQ : std_logic;
    signal   serIQ, encodedIQ : std_logic_vector(NUM_SYMBOL_BITS-1 downto 0);
    signal diff_encode_in : std_logic_vector(3 downto 0);
    signal diff_encode_out : std_logic_vector(1 downto 0):= "01";
    
   
   
   
begin
VectorIterator: -- returns an integer representing the index of where to pick the first bit of the next symbol to be transmitted
process(clk, updateBitIdx, resetBitIdx) begin
    if (rising_edge(clk)) then 
        -- default
        canSendMoreSymbols <= '1';
        -- have a step size of 2 and traverse down from 7 5, 3, ..
        if (resetBitIdx = '1') then 
            bitIdx <= DATA_NUM_BITS - 1; 
        elsif (updateBitIdx = '1') then 
            if (bitIdx = 1) then  -- the last iChannel bit is at pos 1 with it's q at pos 0, hence can't send any more after this
                canSendMoreSymbols <= '0';
            else
                bitIdx <= bitIdx - 2;
            end if;
        end if;  
    end if;
end process;



ControllerNextStateLogic: 
process(current_state, ser_in_start, ser_in_char, bitIdx, ser_in_symbolClk,canSendMoreSymbols )

begin
    -- defaults
    resetBitidx <= '0';
    updateBitIdx <= '0';
    ser_out_reset_rd_addr <= '0';
    ser_out_rd_cnt_en <= '0';
    ser_out_ram_rd_en <= '0';
    ser_out_flushDone <= '0';
    diff_encode_reset <= '0';
    next_state <= current_state; 
    
    case current_state is   
    
        when idle =>
            if (ser_in_start = '1') then 
                -- reset read address to get eveyrthing ready
                ser_out_reset_rd_addr <= '1';
                -- since we were prompted to start, at least one char is in the buffer. so read it
                next_state <= readingChar;
            end if;
     
        when readingChar =>
            ser_out_ram_rd_en <= '1';
            -- since we just read a char, no symbol of this char has been sent yet, so start sending from MSB
            resetBitIdx <= '1';
            next_state <= sendingSymbol;
            
        -- BEGIN SEQUENCE THAT SENDS A CHARACTER AS SYMBOLS       
       when sendingSymbol =>
            if (ser_in_symbolClk = '1') then 
                serI <= ser_in_char(bitIdx);
                serQ <= ser_in_char(bitIdx - 1);
                -- having sent, attempt to move the bit pointer to a new position, we'll receive feedback in the next state
                updateBitIdx <= '1'; 
                next_state <= checkingIfCanSendMoreSymbols;
            end if;  
      
      when checkingIfCanSendMoreSymbols =>
            if (canSendMoreSymbols = '1') then  -- this means the last request to update the bit pointer was successful, so now the pointer is pointing to a new bit that can be sent
                next_state <= sendingSymbol; 
            else
                -- reset pointer for the next char that comes in
                resetBitIdx <= '1'; 
                -- also see if there are more characters to be read
                    -- if the last char to be processed was a null then there's nothing more in the buffer even if not all the space is filled
                if (ser_in_char = NULL_CHAR) then 
                    next_state <= resettingEncoder; 
                else
                    -- then there are more chars to read
                    ser_out_rd_cnt_en <= '1'; 
                    next_state <= readingChar;
                end if;
            end if;
        -- END SEQUENCE THAT SENDS A CHAR AS SYMBOLS
        
        when resettingEncoder =>
            ser_out_flushDone <= '1';
             diff_encode_reset <= '1';
                next_state <= idle;
            
        when others => 
            next_state <= idle;

    end case;
end process;

serIQ <= serI & serQ;  -- the original unencoded symbol
ser_out_serialI <= serialI; 
ser_out_serialQ <= serialQ;
encodedIQ <= serialI & serialQ;


ControllerStateRegister:
process(clk)
begin
    if rising_edge(clk) then 
        current_state <= next_state;
    end if;
end process;


-- COPY AND PASTE THIS PART INTO YOUR SERIALIZER
-- The differential encoder transforms the current symbol and previously encoded symbol 
-- into the next encoded symbol.  See Rice, p. 403
-- To maintain phase lock between packets, the idle lines must alternate phase with
-- every symbol.  Resetting the encoder output to 01 then feeding a stream of 11 will 
-- cause the output to toggle 01-10-01-10...  
-- Because the idle symbols are 00, we invert the symbols before presenting to the encoder
-- in order to get the idle 11 stream.  We reinvert the symbols when they come out of the 
-- decoder.
diff_encode_in <= not(serQ) & not(serI) & diff_encode_out;
differential_encoder: process(clk)
begin
    if rising_edge(clk) then
        if ser_in_symbolClk = '1' then
            if diff_encode_reset = '1' then
                diff_encode_out <= "01";
            else
                case diff_encode_in is
                    when x"0" | x"6" | x"9" | x"f" => diff_encode_out <= "00";
                    when x"1" | x"4" | x"b" | x"e" => diff_encode_out <= "01";
                    when x"2" | x"7" | x"8" | x"d" => diff_encode_out <= "10";
                    when x"3" | x"5" | x"a" | x"c" => diff_encode_out <= "11";
                    when others => null;
                end case;
            end if;
        end if;
    end if;
 end process;
 
with ser_in_rotate select serialI <=
    diff_encode_out(0) when "00",
    not(diff_encode_out(1)) when "01",
    not(diff_encode_out(0)) when "10",
    diff_encode_out(1) when "11";
    
with ser_in_rotate select serialQ <=
    diff_encode_out(1) when "00",
    diff_encode_out(0) when "01",
    not(diff_encode_out(1)) when "10",
    not(diff_encode_out(0)) when "11";
    
   

end Behavioral;
