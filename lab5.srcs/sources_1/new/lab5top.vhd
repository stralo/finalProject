----------------------------------------------------------------------------------
-- Engineer: Richard Addo & George Boateng
-- Create Date: 04/24/2015 11:45:32 PM
-- Module Name: lab5top - Behavioral
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.math_real.all;

entity lab5top is
    Port ( clk : in STD_LOGIC;
           RsRx : in STD_LOGIC;
           RsTx : out STD_LOGIC;
           seg : out STD_LOGIC_VECTOR(0 to 6);
           an : out STD_LOGIC_VECTOR(3 downto 0); 
           serialForDAC : out std_logic; 
           serialClkForDAC : out std_logic; 
           serialClkForADC : out std_logic; 
           syncForDAC : out std_logic;
           syncForADC : out std_logic; 
           serialFromADC: in std_logic
    );
end lab5top;

architecture Behavioral of lab5top is

COMPONENT ModemTx is
    Port ( clk : in STD_LOGIC;
        modemTx_in_spiClk : in std_logic; 
        RsRx  : in  STD_LOGIC;
        seg : out STD_LOGIC_VECTOR(0 to 6);
        an : out STD_LOGIC_VECTOR(3 downto 0);
        modemTx_in_rotate : in std_logic_vector(1 downto 0);
        modemTx_in_symbolClk : in std_logic;
        modemTx_out_sampleClk : out std_logic;
        modemTx_out_pmodSync : out std_logic; 
        modemTx_out_pmodSerialClk : out std_logic; 
        modemTx_out_pmodAnalogQPSK : out std_logic
    );
end COMPONENT;


COMPONENT ModemRx is
    Port ( clk : in STD_LOGIC;
        modemRx_in_spiClk : in std_logic; 
        modemRx_out_tx : out std_logic;
        modemRx_in_symbolClk : in std_logic;
        modemRx_in_sampleClk : in std_logic; 
        modemRx_out_pmodSync : out std_logic; 
        modemRx_out_pmodSerialClk : out std_logic; 
        modemRx_in_serialFromADC: in std_logic
     
    );
end COMPONENT;

component MMCM
port(
  clk_in1           : in     std_logic;
  clk_out1          : out    std_logic
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
    signal symbolClk, sampleClk, spiClk : std_logic;


begin
    rotate <= "00"; 
    
    
Transmitter:
ModemTx 
Port Map ( 
    clk => clk,
    modemTx_in_spiClk => spiClk,
    RsRx => RsRx,
    seg => seg,
    an  => an,
    modemTx_in_rotate => rotate,
    modemTx_in_symbolClk => symbolClk,
    modemTx_out_sampleClk => sampleClk,
    modemTx_out_pmodSync => syncForDAC,
    modemTx_out_pmodSerialClk => serialClkForDAC,
    modemTx_out_pmodAnalogQPSK => serialForDAC
);

Receiver:
ModemRx 
Port Map( 
    clk => clk,
    modemRx_in_spiClk => spiClk,
    modemRx_out_tx => RsTx,
    modemRx_in_symbolClk => symbolClk,
    modemRx_in_sampleClk => sampleClk,
    modemRx_out_pmodSync => syncForADC,
    modemRx_out_pmodSerialClk => serialClkForADC,
    modemRx_in_serialFromADC => serialFromADC
);


ClockDivider:
process(Clk)
   begin
       if rising_edge(Clk) then
           if tx_trig_cnt = RATE - 1 then 
               tx_trig_cnt <= (others => '0'); 
               symbolClk <= '1'; 
           else
               tx_trig_cnt <= tx_trig_cnt + 1; 
               symbolClk <= '0';
           end if;
       end if;
end process;

SPIClkGenerator : MMCM
port map ( 
   clk_in1 => clk,
   clk_out1 => spiClk
             
 );

end Behavioral;
