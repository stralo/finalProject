library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity ADCInterface is
  Generic (
    WORD_SIZE : INTEGER := 16
  );
  Port    (    
  --General usage
    spiClk : in std_logic; 
    clk      : in std_logic;         
  --Pmod interface signals
    serialFromADCCh1   : in std_logic;
    serialFromADCCh2  :  in std_logic; 
    serialClkForADC     : out std_logic;
    syncForADC      : out std_logic;
    --User interface signals
    convertedValue    : out std_logic_vector(15 downto 0);
    START    : in std_logic; 
    conversionDone     : out std_logic
);
end ADCInterface ;

architecture Behavioral of ADCInterface is

type states is (Idle, ShiftIn, SyncData);  
signal currentState, nextState : states := idle;
           
signal temp1         : std_logic_vector(15 downto 0);
signal temp2         : std_logic_vector(15 downto 0);                
signal shiftCounter  : std_logic_vector(3 downto 0) := x"0"; 
signal enShiftCounter: std_logic;
signal enParalelLoad : std_logic;


signal startTrigger : std_logic := '0';
type startHoldState is (s0, s1, s2, s3, s4, s5, s6);  
signal startCurrentState , startNextState : startHoldState := s0;

begin
        
serialClkForADC <=  not spiClk; 

-- Main FSM for the interface
FSMStateRegister: process (spiClk)
begin
    if rising_edge(spiClk) then 
        currentState <= nextState;
    end if;              
end process;

NextStateLogic: process (currentState, startTrigger, shiftCounter)
begin
    nextState <= currentState;  
    case (currentState) is
        when Idle =>
            if startTrigger = '1' then
               nextState <= ShiftIn;
            end if;
        when ShiftIn =>
            if shiftCounter = x"F" then
               nextState <= SyncData;
            end if;
        when SyncData =>
            if startTrigger = '0' then
                nextState <= Idle;
            end if;
        when others =>
            nextState <= Idle;
        end case;      
    end process;
    
-- shifting
Shifter : process(spiClk, enParalelLoad, enShiftCounter)
begin
    if rising_edge(spiClk) then                
        if (enShiftCounter = '1') then 
--           temp1 <= temp1(14 downto 0) & serialFromADCCh1;
           temp1(15 downto 1) <= temp1(14 downto 0); 
           temp1(0) <= serialFromADCCh1;
            shiftCounter <= shiftCounter + '1';
        elsif (enParalelLoad = '1') then
           shiftCounter <= "0000";
           convertedValue <= temp1;
        end if;
    end if;
end process;
   
  
OUTPUT_DECODE: process (currentState)
begin
    if currentState = Idle then
        enShiftCounter <='0';
        conversionDone <='1';
        syncForADC <='1';
        enParalelLoad <= '0';
    elsif currentState = ShiftIn then
        enShiftCounter <='1';
        conversionDone <='0';
        syncForADC <='0';
        enParalelLoad <= '0';
    else --if currentState = SyncData then
        enShiftCounter <='0';
        conversionDone <='0';
        syncForADC <='1';
        enParalelLoad <= '1';
    end if;
end process;    
   

-- the following FSM holds the start signal high for an extended amount of time so the 
-- interface can function correcly using the SPI clock without missing the start signal (sampleClk)
process(clk)
begin
    if rising_edge(clk) then 
        startCurrentState <= startNextState; 
    end if;
end process;
process(startCurrentState, start)
begin
    
    startNextState <= startCurrentState; 
    startTrigger <= '0';
    
    case startCurrentState is 
        when s0 =>
            if (start = '1') then 
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
end Behavioral;




