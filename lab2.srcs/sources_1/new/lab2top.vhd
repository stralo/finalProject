----------------------------------------------------------------------------------
-- Engineer: Richard Addo & George Boateng
-- Create Date: 04/12/2015 11:45:32 PM
-- Module Name: lab2top - Behavioral
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.math_real.all;



entity lab2top is
    Port ( clk : in STD_LOGIC;
           RsRx : in STD_LOGIC;
           RsTx : out STD_LOGIC;
           seg : out STD_LOGIC_VECTOR(0 to 6);
           an : out STD_LOGIC_VECTOR(3 downto 0)
    );
    
end lab2top;

architecture Behavioral of lab2top is

COMPONENT ModemTx is
    Port ( clk : in STD_LOGIC;
        RsRx  : in  STD_LOGIC;
        seg : out STD_LOGIC_VECTOR(0 to 6);
        an : out STD_LOGIC_VECTOR(3 downto 0);
        modemTx_out_serialI : out std_logic;
        modemTx_out_serialQ : out std_logic;
        modemTx_in_rotate : in std_logic_vector(1 downto 0);
        modemTx_in_symbolClk : in std_logic
    );
end COMPONENT;


COMPONENT ModemRx is
    Port ( clk : in STD_LOGIC;
        modemRx_in_serialI : in std_logic;
        modemRx_in_serialQ : in std_logic;
        modemRx_out_tx : out std_logic;
        modemRx_in_symbolClk : in std_logic
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
    signal symbolClk : std_logic;



begin
    rotate <=  "00"; 
    
Transmitter:
ModemTx 
Port Map ( 
    clk => clk,
    RsRx => RsRx,
    seg => seg,
    an  => an,
    modemTx_out_serialI => serialI,
    modemTx_out_serialQ => serialQ,
    modemTx_in_rotate => rotate,
    modemTx_in_symbolClk => symbolClk
);

Receiver:
ModemRx 
Port Map( 
    clk => clk,
    modemRx_in_serialI => serialI,
    modemRx_in_serialQ => serialQ,
    modemRx_out_tx => RsTx,
    modemRx_in_symbolClk => symbolClk
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
