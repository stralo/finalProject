----------------------------------------------------------------------------------
-- Engineers : Richard Addo & George Boateng
-- Create Date: 04/12/2015 07:55:16 PM
-- Module Name: ModemTx - Behavioral 
-- Description: ModemTx receives typed characters from Putty and transmits them to an external ModemRx
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;
use IEEE.math_real.all;

entity ModemTx is
    Port ( clk : in STD_LOGIC;
        RsRx  : in  STD_LOGIC;
        seg : out STD_LOGIC_VECTOR(0 to 6);
        an : out STD_LOGIC_VECTOR(3 downto 0);
        modemTx_in_rotate : in std_logic_vector(1 downto 0);
        modemTx_out_serialI : out std_logic;
        modemTx_out_serialQ : out std_logic;
        modemTx_in_symbolClk : in std_logic
    );
end ModemTx;

architecture Behavioral of ModemTx is

COMPONENT SerialRx is
    Port ( clk : in  STD_LOGIC;
           RsRx  : in  STD_LOGIC;								-- received bit stream
           rx_data : out  STD_LOGIC_VECTOR (7 downto 0);	-- data byte
           rx_done_tick : out  STD_LOGIC );					-- data ready tick
end COMPONENT;

COMPONENT mux7seg 
    PORT ( clk : in  STD_LOGIC;
        y0, y1, y2, y3 : in  STD_LOGIC_VECTOR (3 downto 0);    -- digits
        seg : out  STD_LOGIC_VECTOR(0 to 6);                   -- segments (a...g)
        an : out  STD_LOGIC_VECTOR (3 downto 0) );             -- anodes
END COMPONENT;


COMPONENT CharToIQ is
    Port ( clk : in STD_LOGIC;
    charToIQ_in_rxDone : in std_logic;
    charToIQ_in_rxData : in std_logic_vector;
    charToIQ_out_serialI : out std_logic;
    charToIQ_out_serialQ : out std_logic; 
    charToIQ_in_rotate : in std_logic_vector(1 downto 0);
    charToIQ_in_symbolClk : in std_logic);
end COMPONENT;
    
    
    -- SIGNALS
    signal rxDone : std_logic;
    signal rxData : std_logic_vector(7 downto 0);



begin

Receiver:
SerialRx
Port Map ( 
    clk => clk,
    RsRx => RsRx,						
    rx_data => rxData,
    rx_done_tick => rxDone
);	


Display: 
mux7seg 
PORT MAP( 
    clk => clk,
    y0 => rxData(3 downto 0),  
    y1 => rxData(7 downto 4),
    y2 => x"0",
    y3 => x"0",
    seg => seg,                   
    an => an 
);

CharacterToIQ:
CharToIQ 
Port Map( 
    clk => clk,
    charToIQ_in_rxDone => rxDone,
    charToIQ_in_rxData => rxData,
    charToIQ_out_serialI => modemTx_out_serialI,
    charToIQ_out_serialQ => modemTx_out_serialQ,
    charToIQ_in_rotate => modemTx_in_rotate,
    charToIQ_in_symbolClk => modemTx_in_symbolClk
);


end Behavioral;
