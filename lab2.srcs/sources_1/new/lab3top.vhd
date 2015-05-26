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
           an : out STD_LOGIC_VECTOR(3 downto 0)
    );
end lab3top;

architecture Behavioral of lab3top is

COMPONENT ModemTx is
    Port ( clk : in STD_LOGIC;
        RsRx  : in  STD_LOGIC;
        seg : out STD_LOGIC_VECTOR(0 to 6);
        an : out STD_LOGIC_VECTOR(3 downto 0);
        modemTx_in_rotate : in std_logic_vector(1 downto 0);
        modemTx_in_symbolClk : in std_logic;
        modemTx_out_iSample : out std_logic_vector(15 downto 0);
        modemTx_out_qSample : out std_logic_vector(15 downto 0);
        modemTx_out_sampleClk : out std_logic
    );
end COMPONENT;


COMPONENT ModemRx is
    Port ( clk : in STD_LOGIC;
        modemRx_in_iSample : in std_logic_vector(15 downto 0);
        modemRx_in_qSample : in std_logic_vector(15 downto 0);
        modemRx_out_tx : out std_logic;
        modemRx_in_symbolClk : in std_logic;
        modemRx_in_sampleClk : in std_logic
    );
end COMPONENT;
    
    -- SIGNALS
    signal serialI, serialQ : std_logic;
    signal rotate : std_logic_vector(1 downto 0);
        
    constant CLOCK_FREQUENCY : integer := 100000000;        
    constant SYMBOL_RATE : integer := 40000;
    constant RATE : integer := integer (    real(CLOCK_FREQUENCY / SYMBOL_RATE) );
    constant TICK_CTR_WIDTH : integer := integer(CEIL(LOG2(real(RATE))));
    signal tx_trig_cnt:        unsigned(TICK_CTR_WIDTH-1 downto 0) := (others=>'0');
    signal symbolClk, sampleClk : std_logic;
    signal iSample, qSample : std_logic_vector(15 downto 0):= (others=>'0');


begin
    rotate <= "00"; 
    
    
Transmitter:
ModemTx 
Port Map ( 
    clk => clk,
    RsRx => RsRx,
    seg => seg,
    an  => an,
    modemTx_in_rotate => rotate,
    modemTx_in_symbolClk => symbolClk,
    modemTx_out_iSample => iSample,
    modemTx_out_qSample => qSample,
    modemTx_out_sampleClk => sampleClk
);

Receiver:
ModemRx 
Port Map( 
    clk => clk,
    modemRx_in_iSample => iSample,
    modemRx_in_qSample => qSample,
    modemRx_out_tx => RsTx,
    modemRx_in_symbolClk => symbolClk,
    modemRx_in_sampleClk => sampleClk
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

end Behavioral;
