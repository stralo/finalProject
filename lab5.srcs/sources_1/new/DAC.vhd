----------------------------------------------------------------------------------
-- Engineer: Richard Addo & George Boateng
-- Create Date: 05/09/2015 05:25:24 PM
-- Module Name: DAC - Behavioral
-- Description: 
---------------------------------------------------------------------------------- 
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL; 
USE ieee.std_logic_unsigned.all; 

entity DAC is
    Generic(
        WORD_SIZE : integer := 16
    );
    Port ( 
        clk : in STD_LOGIC;
        dacInterface_in_spiClk : in std_logic;  -- SPI bus clock (from MMCM) 
        -- user interface to the system
        dacInterface_in_word : in std_logic_vector(WORD_SIZE-1 downto 0);    -- word (command + data) to be sent
        dacInterface_in_start : in std_logic;                                -- start conversion
        dacInterface_out_busy : out std_logic;                                -- conversion in progress
        -- interface to the pmod-da2
        dac_out_pmodSync : out std_logic;                                -- active-low sync signal
        dac_out_pmodSerialClk : out std_logic;                                -- serial clock to DAC (spi_sck)
        dac_out_serialDataCh1 : out std_logic                                  -- serial data to the DAC (spi_MOSI)
    );
end DAC;

architecture Behavioral of DAC is

    signal tempBuffer : std_logic_vector(15 downto 0);
    signal shiftCount : std_logic_vector(3 downto 0);
    signal shiftCounterEn, parallelLoadEn :  std_logic := '0';     

    type StateType is (idle, shiftingOut, syncingData);  
    signal currentState, nextState : StateType := idle;
    
    signal startTrigger : std_logic := '0';
    
    
    type startHoldState is (s0, s1, s2, s3, s4, s5, s6);  
    signal startCurrentState , startNextState : startHoldState := s0;

begin
    dac_out_pmodSerialClk <= dacInterface_in_spiClk; 

-- The following state machine holds the start signal high for an extended amount of time so the interface can operate 
-- correctly with the SPI clock
process(startCurrentState,dacInterface_in_start)
begin
    
    startNextState <= startCurrentState; 
    startTrigger <= '0';
    
    case startCurrentState is 
        when s0 =>
            if (dacInterface_in_start = '1') then 
                startNextState <= s1; 
            end if; 
            
        when s1 =>
            startTrigger <= '1';
            startNextState <= s2; 
        when s2 =>
            startTrigger <= '1';
            startNextState <= s3; 
            
        when s3 => 
            startTrigger <= '1';
            startNextState <= s4;
    
        when s4 => 
            startTrigger <= '1';
            startNextState <= s5;
                                        
        when s5 => 
            startTrigger <= '1';
            startNextState <= s6;                                
                    
        when s6 =>
            startTrigger <= '0';
            startNextState <= s0;
    end case; 
 end process;  


process(clk)
begin
    if rising_edge(clk) then 
        startCurrentState <= startNextState; 
    end if;

end process; 


-- Main FSM for the interface
NextStateLogic: process(currentState, shiftCount, startTrigger, dacInterface_in_start) 
begin
    nextState <= currentState; 

    case (currentState) is
        when idle => 
            if startTrigger = '1' then
                nextState <= shiftingOut; 
            end if; 
        when shiftingOut =>
            
            if (shiftCount = x"F") then 
                nextState <= syncingData; 
            end if; 

        when syncingData => 
            if dacInterface_in_start = '0' then 
                nextState <= idle; 
            end if; 

        when others => 
            nextState <= idle; 
    end case; 
end process;


StateRegister: process(dacInterface_in_spiClk)
begin
    if rising_edge(dacInterface_in_spiClk) then 
        currentState <= nextState; 
    end if; 
end process; 


-- Shifting
Shifter: process(dacInterface_in_spiClk, parallelLoadEn, shiftCounterEn)
begin
    if rising_edge(dacInterface_in_spiClk) then 
        if  parallelLoadEn = '1' then 
            shiftCount <= "0000";
            tempBuffer <= dacInterface_in_word;  
        elsif shiftCounterEn = '1' then 
            tempBuffer <= tempBuffer(14 downto 0) & '0';
            shiftCount <= shiftCount + '1';
        end if; 
    end if; 
end process;
-- the pmod is hooked to the MSB end of the buffer
dac_out_serialDataCh1 <= tempBuffer(15);


OutputLogic: process(currentState)
begin
    if currentState = idle then 
        shiftCounterEn <= '0'; 
        dacInterface_out_busy <= '0'; 
        dac_out_pmodSync <= '1'; 
        parallelLoadEn <= '1'; 

    elsif currentState = shiftingOut then 
        shiftCounterEn <= '1'; 
        parallelLoadEn <= '0';  
        dacInterface_out_busy <= '1';
        dac_out_pmodSync <= '0'; -- assert SYNC signal (low true) and shift 16-bits into serial input MOSI
        
    else
        parallelLoadEn <= '0';
        shiftCounterEn <= '0';
        dacInterface_out_busy <= '1';
        dac_out_pmodSync <= '1'; -- deassert SYNC
        
    end if; 
end process; 

end Behavioral;

          

