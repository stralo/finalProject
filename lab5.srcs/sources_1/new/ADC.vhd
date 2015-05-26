----------------------------------------------------------------------------------
-- Engineer: Richard Addo & George Boateng
-- Create Date: 05/09/2015 05:25:24 PM
-- Module Name: ADC - Behavioral
-- Description: 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.math_real.all; 

entity ADC is
    Generic(
        WORD_SIZE : integer := 16)
    );
    Port ( 
        clk : in STD_LOGIC;
        ADC_in_spiSClk : in std_logic;  -- SPI bus clock (from MMCM) 
        -- user interface to the system
        ADC_in_word : in std_logic_vector(WORD_SIZE-1 downto 0);    -- word (command + data) to be sent
        ADC_in_start : in std_logic;                                -- start conversion
        ADC_out_conversionDone : out std_logic;                                -- conversion in progress
        -- interface to the pmod-da2
        ADC_out_pmodSync : out std_logic;                                -- active-low sync signal
        ADC_out_pmodSerialClk : out std_logic;                                -- serial clock to ADC (spi_sck)
        ADC_out_pmodSerialData : out std_logic                                  -- serial data to the ADC (spi_MOSI)
    );
end ADC;

architecture Behavioral of ADC is

    constant NUM_BITS_FOR_SHIFT_COUNT : integer := integer( CEIL( LOG2(real(WORD_SIZE)))  );

    signal tempBuffer : std_logic_vector(WORD_SIZE-1 downto 0);
    signal shiftCount : unsigned (NUM_BITS_FOR_SHIFT_COUNT-1 downto 0) := (others => '0'); 
    signal shiftCounterEn, parallelLoadEn :  std_logic := '0';     

    signal fsmClk, ADCClk : std_logic := '0'; -- clk_out and clk_div respectively

    type StateType is (idle, shiftingOut, syncingData);  
    signal currentState, nextState : StateType := idle;

    constant control     : std_logic_vector(3 downto 0) := "0000";

begin

-- ----------------------
-- In the following process, the temporary register is loaded and shifted. 
-- When the parallelLoadEn signal is high, the tempbuffer is loaded with the 8 bits of control concatenated with the 8 bits of data
-- When the shiftCounterEn is on, the 16 bits of data are shifted
-- ----------------------
Counter: process(ADCClk, parallelLoadEn, shiftCounterEn)
begin
    if rising_edge(ADCClk) then 
        if  parallelLoadEn = '1' then 
            shiftCount <= (others => '0');
            tempBuffer <= control & ADC_in_word;  
        elsif shiftCounterEn = '1' then 
            tempBuffer <= tempBuffer(tempBuffer'length-2 downto 0) & tempBuffer(tempBuffer'length - 1);
            shiftCount <= shiftCount + 1;
        end if; 
    end if; 

end process;

ADCIn <= tempBuffer(15);


-- ----------------------
-- FSM
-- following 3 processes represent fsm that contains three states

-- In the idle state, tempBuffer is assigned the updated value of the input data
-- In the shiftingOut state, 16 bits of the temp register are shifted out from the msb

-- the SyncData state drives the output signal sync high for 2 clock signals telling the ADC TO LATCH THE 16 BIT DATA IT JUST RECEIVED IN THE PREVIOUS STATE
-- Notes: the data wil change on the uppser oedge of the clock signal. 

-- ----------------------


StateRegister: process(ADCClk)
begin
    if rising_edge(ADCClk) then 
        currentState <= nextState; 
    end if; 

end process; 

process(currentState)
begin 
    if currentState = idle then 
        shiftCounterEn = '0'; 
        ADC_out_conversionDone <= '1'; 
        ADC_out_pmodSync <= '1'; 
        parallelLoadEn <= '1';  
    elsif currentState = shiftingOut then 
        shiftCounterEn <= '1'; 
        ADC_out_conversionDone <= '0';
        ADC_out_pmodSync <= '0';
        parallelLoadEn <= '0';
    else -- syncingDAta
        shiftCounterEn <= '0';
        ADC_out_conversionDone <= '0';
        ADC_out_pmodSync <= '1';
        parallelLoadEn <= '0';
    end if; 

end process;


NextStateLogic: process(currentState, shiftCount, ADC_in_start) 
begin
    nextState <= currentState; 

    case (currentState) is
        when idle => 
            if ADC_in_start = '1' then 
                nextState <= shiftingOut; 
            end if; 

        when shiftingOut =>
            if (shiftCount = x"F") then 
                nextState <= syncingData; 
            end if; 

        when syncingData => 
            if ADC_in_start = '0' then 
                nextState <= idle; 
            end if; 

        when others => 
            nextState <= idle; 
    end case; 
end process;


    

end Behavioral;
