----------------------------------------------------------------------------------
-- Engineer: Richard Addo & George Boateng
-- Create Date: 04/20/2015 12:18:10 AM
-- Module Name: MatchedFilter - Behavioral 
-- Description:  
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.math_real.all; 


entity MatchedFilter is
    Port (  
            clk : in STD_LOGIC;
           mf_in_sample : in STD_LOGIC_vector( 15 downto 0); -- modulated input
           mf_in_sampleClk : in std_logic; 
           mf_in_symbolClk : in std_logic; 
           mf_out_val : out std_logic_vector(15 downto 0)
           
           );
end MatchedFilter;

architecture Behavioral of MatchedFilter is

COMPONENT BlockROM is
    Port(
        clka : in std_logic;
        addra : in std_logic_vector(7 downto 0);
        douta : out std_logic_vector(15 downto 0)
        );
END COMPONENT; 

    -- REGISTER SIZING
    constant NUM_GUARD_BITS : integer :=  9;
    constant ACCUMULATOR_NUM_BITS : integer := 32 + integer(NUM_GUARD_BITS);
    constant BINARY_POINT_IDX : integer := 32;
    
    -- DSP
    signal  prod : signed(31 downto 0) := (others => '0'); 
    signal  accum : signed(ACCUMULATOR_NUM_BITS-1 downto 0) := (others => '0');
    signal resetMAC : std_logic := '0';
    signal yOut : std_logic_vector(15 downto 0) := (others => '0');  -- y(n)
    signal multiplierEn, accumulatorEn, outputRegEn : std_logic := '0';
    signal dspEn : std_logic := '0';

    -- GENERICS & constants
    constant SAMPLE_NUM_BITS : integer := 16;  -- I and Q mapped as 1 -> x"7fff", 0 -> x"8000" 
    constant MAPPED_ZERO : std_logic_vector(SAMPLE_NUM_BITS-1 downto 0) :=  x"8000";
    constant MAPPED_ONE : std_logic_vector(SAMPLE_NUM_BITS-1 downto 0) := x"7fff";
    constant X_BUFFER_DEPTH : integer := 129;  -- hold 129 samples
    constant X_DATA_WIDTH : integer := 16;
    
    -- INTERCOMPONENT SIGNALS
    signal romRdAddr : std_logic_vector(7 downto 0) := (others => '0');
    signal romDataOut : std_logic_vector(15 downto 0);
    signal xBufIn, xBufOut : std_logic_vector(X_DATA_WIDTH-1 downto 0);
    signal dspOut : std_logic_vector(47 downto 0);
    signal sampleClk : std_logic;
    
    signal x : signed(X_DATA_WIDTH-1 downto 0) := (others => '0');  -- current sample value
    signal h : signed(X_DATA_WIDTH-1 downto 0) := (others => '0');  -- current coefficient
    
        -- counter
    signal incrementCounter, resetCounter : std_logic := '0'; 
    constant TOTAL_MULTIPLICATIONS : integer := 129; 
    constant NUM_BITS_FOR_MULTIPLICATION_COUNT : integer := integer( CEIL( LOG2(real(TOTAL_MULTIPLICATIONS)))  ); 
    signal numMultiplications : integer range 0 to 130 := 0;    
    
    type regfile_type is array(129-1  downto 0) of signed(SAMPLE_NUM_BITS-1 downto 0); 
    signal shiftRegister : regfile_type :=  (others => (others => '0'));
    
    -- FSM
    type state_type is (idle, doingCalculations, computingLastProduct, addingLastProduct, resettingDSP, writingOutput, preparingOutput );
    signal curr_state, next_state : state_type := idle;
 
begin
    sampleClk <= mf_in_sampleClk;

ControllerComb: process(curr_state, sampleClk, numMultiplications, romDataOut, accum)
begin
	-- defaults
	next_state <= curr_state;
	resetCounter <= '0';
	incrementCounter <= '0';
	resetMAC <= '0';
	multiplierEn <= '0'; 
	accumulatorEn <= '0';
	outputRegEn <= '0';
	dspEn <= '0';
	
	case curr_state is
		when idle =>      -- waiting for sample
		  if (sampleClk = '1') then  
		      next_state <= doingCalculations; 
		  end if;

        when doingCalculations =>
            if numMultiplications < TOTAL_MULTIPLICATIONS-1 then 
                romRdAddr <= std_logic_vector(to_unsigned(numMultiplications+1, romRdAddr'length));
            end if; 
            dspEn <= '1';
            if  (numMultiplications = TOTAL_MULTIPLICATIONS-1) then 
                next_state <= computingLastProduct;
            else 
                incrementCounter <= '1';
            end if; 
            
        when computingLastProduct =>
            dspEn <= '1'; 
            next_state <= addingLastProduct; 
            
 
        when addingLastProduct => 
            dspEn <= '1'; 
            next_state <= preparingOutput;
        
        when preparingOutput =>
            if sampleClk = '1' then 
                outputRegEn <= '1'; 
                next_state <= writingOutput;
            end if; 
       
        when writingOutput =>
            next_state <= resettingDSP; 
                        
        when resettingDSP =>
            resetMAC <= '1';
            resetCounter <= '1'; 
            next_state <= doingCalculations;
      
        when others =>
            next_state <= curr_state; 	
	end case;
end process ControllerComb;


DSP_MAC: process(clk)
begin
    if rising_edge(clk) then 
        if resetMAC = '1' then 
            accum <= (others => '0');
            prod <= (others => '0');
        elsif dspEN = '1' THEN 
            h <= signed(romDataOut); 
             x <= shiftRegister(numMultiplications);
            prod <= h * x; 
            accum <= accum + prod;
            
        end if; 
    end if; 
end process;



MACCounter: -- counts the number of products that have been computed. This value is used for indexing into the buffer and rom
process(clk,resetCounter, incrementCounter)   begin
    if rising_edge(clk) then
        if (resetCounter = '1') then 
            numMultiplications <= 0; 
        elsif (incrementCounter = '1') then 
            numMultiplications <= numMultiplications + 1; 
        end if;
    end if;
end process;


-- On each tick of the sampleClk, a new value of the upsampled stream is shifted into this buffer and the oldest value
XBuffer:   process (clk)
begin
    if rising_edge(clk) then
        if sampleClk  = '1' then
            shiftRegister(128 downto 1) <= shiftRegister(127 downto 0); 
            shiftRegister(0) <= signed(mf_in_sample); 
        end if;
    end if;
end process;


DSP_OutputRegister:
process(clk)
begin
    if rising_edge(clk) then 
        if outputRegEn = '1' then 
            yOut <= accum(BINARY_POINT_IDX+1) & std_logic_vector(   accum(BINARY_POINT_IDX-1 downto BINARY_POINT_IDX-1 - 15 + 1)       );
        end if; 
    end if; 
end process; 

mf_out_val <= std_logic_vector(yOut); 

ROM:
BlockROM
Port Map(
    clka => clk,
    addra => romRdAddr,
    douta => romDataOut
);
    
    
ControllerReg:
process(clk)
begin
	if rising_edge(clk) then
		curr_state <= next_state;
	end if;
end process ControllerReg;


end Behavioral;
