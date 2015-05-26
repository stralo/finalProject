----------------------------------------------------------------------------------
-- Engineer: Richard Addo & George Boateng
-- Create Date: 04/24/2015 11:45:32 PM
-- Module Name: lab3top - Behavioral
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.math_real.all;

entity lab3top is
    Port ( clk : in STD_LOGIC;
           RsRx : in STD_LOGIC;
           RsTx : out STD_LOGIC;
           seg : out STD_LOGIC_VECTOR(0 to 6);
           an : out STD_LOGIC_VECTOR(3 downto 0); 
           
           syncForDAC : out std_logic;
           serialForDAC : out std_logic; 
           serialClkForDAC : out std_logic; 
           
           syncForADC : out std_logic;
           serialFromADC: in std_logic;
           serialClkForADC : out std_logic;
           
           -- passthrough
           syncForDebugDAC : out std_logic; 
           serialForDebugDAC : out std_logic; 
           serialClkForDebugDAC: out std_logic ;
           
           modeSwitch : in std_logic
           
    );
end lab3top;

architecture Behavioral of lab3top is

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

component MMCM
port(
  clk_in1           : in     std_logic;
  clk_out1          : out    std_logic;
  clk_out2          : out std_logic
 );
end component;



    
    -- SIGNALS
    signal serialI, serialQ : std_logic;
    signal rotate : std_logic_vector(1 downto 0);
    signal analogQPSK : std_logic_vector(11 downto 0) := (others => '0');
        
    constant CLOCK_FREQUENCY : integer := 100000000;        
    constant SYMBOL_RATE : integer := 40000;
    constant RATE : integer := integer (    real(CLOCK_FREQUENCY / SYMBOL_RATE) );
    constant TICK_CTR_WIDTH : integer := integer(CEIL(LOG2(real(RATE))));
    signal tx_trig_cnt:        unsigned(TICK_CTR_WIDTH-1 downto 0) := (others=>'0');
    signal symbolClk, sampleClk : std_logic;


     signal spiClk, masterClk: std_logic := '0';
     signal clk100, clk20 : std_logic := '0';
     
     signal dacConversionDone : std_logic := '0';
    signal rawQPSKSignal : std_logic_vector(11 downto 0); 
    
begin
    rotate <= "00"; 
    masterClk <= clk100;
    spiClk <= clk20;
    
SPIClkGenerator: MMCM 
    Port Map(
        clk_in1 => clk,
        clk_out1 => clk100,
        clk_out2 => clk20
    );
    
Transmitter: ModemTx 
Port Map ( 
    clk => masterClk,
    modemTx_in_spiClk => spiClk,
    RsRx => RsRx,
    seg => seg,
    an  => an,
    modemTx_in_rotate => rotate,
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
    modemRx_out_syncForADC => syncForADC,
    modemRx_out_serialClkForADC => serialClkForADC,
    modemRx_in_serialFromADC => serialFromADC,
    modemRx_in_dacConversionDone => dacConversionDone,
    
    modemRx_out_syncForDebugDAC => syncForDebugDAC,
    modemRx_out_serialForDebugDAC => serialForDebugDAC,
    modemRx_out_serialClkForDebugDAC => serialClkForDebugDAC,
    
    modemRx_in_rawQPSKSignal => rawQPSKSignal,
    modemRx_in_mode => modeSwitch
);



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
