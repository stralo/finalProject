----------------------------------------------------------------------------------
-- Engineer: Richard Addo & George Boateng
-- Create Date: 04/11/2015 10:11:32 AM
-- Module Name: IQDeserializer - Behavioral
-- Description: 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.math_real.all; 

entity IQDeserializer is
    Generic(
        DATA_NUM_BITS : integer
    );
    Port ( clk : in STD_LOGIC;
           deser_in_serialI : in STD_LOGIC;
           deser_in_serialQ : in STD_LOGIC;
           deser_out_txStart : out std_logic;
           deser_out_txData : out std_logic_vector (DATA_NUM_BITS-1 downto 0); 
           deser_in_symbolClk : in std_logic
   );
end IQDeserializer;

architecture Behavioral of IQDeserializer is
    type state_type is(idle, awaitingSymbol, checkingIfCharReady, savingChar);
    signal current_state, next_state : state_type := idle;
    
    -- SymbolCounter variables
    constant STX: std_logic_vector(DATA_NUM_BITS-1 downto 0) := x"02";
    constant NUL: std_logic_vector(DATA_NUM_BITS-1 downto 0) := x"00";
    constant MAX_SYMBOLS : integer := 4; 
    
    signal numSymbolsReceived : unsigned(2 downto 0) := (others => '0'); 
    signal resetSymbolCntr, incrementSymbolCntr: std_logic := '0';
    signal symb_dec_out : std_logic_vector(1 downto 0);   -- the decoded symbol BUT IN QI instead of IQ
    signal decodedSymbol : std_logic_vector(1 downto 0);   -- the decoded symbol IQ
    signal symb_dec_in : std_logic_vector(3 downto 0);
    signal serialQ, serialI : std_logic;
    signal receivedChar : std_logic_vector (DATA_NUM_BITS-1 downto 0);
    signal shiftRegister: std_logic_vector (DATA_NUM_BITS-1 downto 0);
       

begin
    decodedSymbol <= not(symb_dec_out(0)) & not(symb_dec_out(1));
    serialI <= deser_in_serialI; 
    serialQ <= deser_in_serialQ;
    receivedChar <= shiftRegister;

ControllerNextStateLogic:
process(current_state, decodedSymbol, deser_in_symbolClk, receivedChar, numSymbolsReceived )
begin
    -- defaults
    next_state <= current_state;
    resetSymbolCntr <= '0';
    deser_out_txStart <= '0';
    incrementSymbolCntr <= '0';

    case current_state is 
        when idle =>        -- waiting for STX            
            if (receivedChar = STX) then 
                next_state <= awaitingSymbol; 
                resetSymbolCntr <= '1';
            end if;

           when awaitingSymbol =>
                if (deser_in_symbolClk = '1') then 
                    incrementSymbolCntr <= '1'; 
                    next_state <= checkingIfCharReady;
                end if; 
            when checkingIfCharReady => 
                    if (numSymbolsReceived = MAX_SYMBOLS) then 
                        -- then a full character has been received
                        if (receivedChar = NUL) then   
                            -- a complete stream has been received
                            next_state <= idle;
                        else
                            next_state <= savingChar; 
                           
                        end if; 
                    else
                        -- then we haven't received a full character yet, so keep waiting
                        next_state <= awaitingSymbol;
                    end if; 
                    
            when savingChar =>
                 -- a complete character has been received, so send it
                   deser_out_txData <= receivedChar;
                   deser_out_txStart <= '1';
                   next_state <= awaitingSymbol; 
                   resetSymbolCntr <= '1';
    end case;
end process;



ControllerStateRegister:
process(clk)
begin
    if rising_edge(clk) then 
        current_state <= next_state;
    end if;
end process;


SymbolCounter: -- counts the number of symbols received
process(clk, resetSymbolCntr, incrementSymbolCntr)   begin
    if rising_edge(clk) then
        if (resetSymbolCntr = '1') then 
            numSymbolsReceived <= (others => '0'); 
        elsif (incrementSymbolCntr = '1') then 
            numSymbolsReceived <= numSymbolsReceived + 1; 
        end if;
    end if;
end process;


SymbolBuffer:   -- at any point in time, this holds the last 4 symbols received
process (clk)
begin
    if rising_edge(clk) then
        if deser_in_symbolClk  = '1' then
            shiftRegister <= std_logic_vector(unsigned(shiftRegister) sll 2);
            shiftRegister(1 downto 0) <= decodedSymbol; 
        end if;
    end if;
end process;

-- COPY AND PASTE THIS PART INTO YOUR DESERIALZER
-- Note symb_dec_out is QI not IQ
-- Swap and invert the symb_dec_out bits before shifting into frame buffer!
-- Differential decoder; see Rice, p. 404
DifferentialDecode: process(clk)
begin
    if rising_edge(clk) then
        if deser_in_symbolClk = '1' then  
            symb_dec_in <= symb_dec_in(1 downto 0) & serialQ & serialI;       
            case symb_dec_in is
                when x"0" | x"5" | x"a" | x"f"  => symb_dec_out <= "00";
                when x"1" | x"7" | x"8" | x"e"  => symb_dec_out <= "01";
                when x"2" | x"4" | x"b" | x"d"  => symb_dec_out <= "10";
                when x"3" | x"6" | x"9" | x"c"  => symb_dec_out <= "11";
                when others => symb_dec_out <= "00";
            end case;
        end if;
    end if;
end process;

end Behavioral;
