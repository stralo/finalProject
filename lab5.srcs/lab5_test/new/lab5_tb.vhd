----------------------------------------------------------------------------------
-- Engineer: Richard Addo & George Boateng
-- Create Date: 04/24/2015 11:45:32 PM
-- Module Name: lab5_tb - Behavioral
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.math_real.all;

entity lab5_tb is
end lab5_tb;

architecture Behavioral of lab5_tb is

COMPONENT ModemTx is
    Port ( clk : in STD_LOGIC;
        modemTx_in_spiClk : in std_logic; 
        RsRx  : in  STD_LOGIC;
        seg : out STD_LOGIC_VECTOR(0 to 6);
        an : out STD_LOGIC_VECTOR(3 downto 0);
        modemTx_in_rotate : in std_logic_vector(1 downto 0);
        modemTx_in_symbolClk : in std_logic;
        modemTx_out_sampleClk : out std_logic;
        modemTx_out_syncForDAC : out std_logic; 
        modemTx_out_serialClkForDAC : out std_logic; 
        modemTx_out_serialForDAC : out std_logic;
        modemTx_out_dacConversionDone : out std_logic;
        modemTx_out_rawQPSKSignal : out std_logic_vector(11 downto 0);
         modemTx_in_mode : in std_logic
    );
end COMPONENT;


COMPONENT ModemRx is
    Port ( clk : in STD_LOGIC;
        modemRx_in_spiClk : in std_logic; 
        modemRx_out_tx : out std_logic;
        modemRx_in_symbolClk : in std_logic;
        modemRx_in_sampleClk : in std_logic; 
        modemRx_out_syncForADC : out std_logic; 
        modemRx_out_serialClkForADC : out std_logic; 
        modemRx_in_serialFromADC: in std_logic;
        modemRx_in_dacConversionDone : in std_logic;
        
        modemRx_out_syncForDebugDAC : out std_logic; 
        modemRx_out_serialForDebugDAC: out std_logic; 
        modemRx_out_serialClkForDebugDAC: out std_logic;
        modemRx_in_rawQPSKSignal : in std_logic_vector(11 downto 0);
        modemRx_in_mode : in std_logic
     
    );
end COMPONENT;

    -- shared inputs
    signal spiClk : std_logic := '0';
    signal modeSwitch :std_logic := '0';
    
    --Transmitter Inputs
           
     --Transmitter Outputs
    signal RsTx: std_logic;
    signal seg: STD_LOGIC_VECTOR(0 to 6);
    signal an: STD_LOGIC_VECTOR(3 downto 0);
    
    SIGNAL sampleClk, syncForDAC, serialClkForDAC, serialForDAC, dacConversionDone : STD_LOGIC := '0';
    SIGNAL rawQPSKSignal : STD_LOGIC_VECTOR(11 DOWNTO 0);
    
    
    -- Receiver Inputs
    -- Receiver outputs
    signal RsRx : std_logic := '1';




    -- Data definitions
	constant bit_time : time := 8.68us;		-- 115,200 baud
	constant TxData : std_logic_vector(31 downto 0) := x"4142430d";
    
    -- SIGNALS
        
    constant CLOCK_FREQUENCY : integer := 100000000;        
    constant SYMBOL_RATE : integer := 40000;
    constant RATE : integer := integer (    real(CLOCK_FREQUENCY / SYMBOL_RATE) );
    constant TICK_CTR_WIDTH : integer := integer(CEIL(LOG2(real(RATE))));
    signal tx_trig_cnt:        unsigned(TICK_CTR_WIDTH-1 downto 0) := (others=>'0');
    signal symbolClk : std_logic;


     signal masterClk: std_logic := '0';
     
    
    
     -- Clock period definitions
      constant clk_period : time := 10ns;        -- 100 MHz
      constant spiClkPeriod : time := 50ns; 
       
    
begin


    -- Clock process definitions
   clk_process :process
   begin
		masterClk <= '0';
		wait for clk_period/2;
		masterClk <= '1';
		wait for clk_period/2;
   end process;
   
   
    -- Clock process definitions
     spiclk_process :process
     begin
          spiClk <= '0';
          wait for spiClkPeriod/2;
          spiClk <= '1';
          wait for spiClkPeriod/2;
     end process;
   
    
Transmitter: ModemTx 
Port Map ( 
    clk => masterClk,
    modemTx_in_spiClk => spiClk,
    RsRx => RsRx,
    seg => seg,
    an  => an,
    modemTx_in_rotate => "00",
    modemTx_in_symbolClk => symbolClk,
    modemTx_out_sampleClk => sampleClk,
    modemTx_out_syncForDAC => syncForDAC,
    modemTx_out_serialClkForDAC => serialClkForDAC,
    modemTx_out_serialForDAC => serialForDAC,
    modemTx_out_dacConversionDone => dacConversionDone,
    modemTx_out_rawQPSKSignal => rawQPSKSignal,
    modemTx_in_mode => modeSwitch
);

Receiver: ModemRx 
Port Map( 
    clk => masterClk,
    modemRx_in_spiClk => spiClk,
    modemRx_out_tx => RsTx,
    modemRx_in_symbolClk => symbolClk,
    modemRx_in_sampleClk => sampleClk,
    modemRx_out_syncForADC => open,
    modemRx_out_serialClkForADC => open,
    modemRx_in_serialFromADC => serialForDAC,-- serialFromADC,
    modemRx_in_dacConversionDone => dacConversionDone,
    
    modemRx_out_syncForDebugDAC => open,
    modemRx_out_serialForDebugDAC => open,
    modemRx_out_serialClkForDebugDAC => open,
    
    modemRx_in_rawQPSKSignal => rawQPSKSignal,
    modemRx_in_mode => modeSwitch
);


-- Stimulus process
   stim_proc: process
   begin		
		wait for 100 us;
		wait for 10.25*clk_period;		

        -- Send the character stream from left to right	
        -- but send the bits within each char from right to left	
		for charcount in (TxData'length / 8)-1 downto 0 loop
		  RsRx <= '0';		-- Start bit
		  wait for bit_time;
		
		  for bitcount in 0 to 7 loop
            RsRx <= TxData(charcount*8 + bitcount);
            wait for bit_time;
		  end loop;
		
		  RsRx <= '1';		-- Stop bit
		  wait for 200 us;  -- Intercharacter spacing
		end loop;
		
		-- Repeat every millisecond
		wait for 1 ms;
        
   end process;

SymbolClkGenerator:
process(masterClk)
   begin
       if rising_edge(masterClk) then
           if tx_trig_cnt = RATE - 1 then 
               tx_trig_cnt <= (others => '0'); 
               symbolClk <= '1'; 
           else
               tx_trig_cnt <= tx_trig_cnt + 1; 
               symbolClk <= '0';
           end if;
       end if;
end process;



end Behavioral;
