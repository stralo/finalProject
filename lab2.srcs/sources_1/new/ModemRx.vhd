----------------------------------------------------------------------------------
-- Engineer: Richard Addo & George Boateng
-- Create Date: 04/12/2015 08:07:40 PM
-- Module Name: ModemRx - Behavioral
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ModemRx is
    Port ( clk : in STD_LOGIC;
        modemRx_in_serialI : in std_logic;
        modemRx_in_serialQ : in std_logic;
        modemRx_out_tx : out std_logic;
        modemRx_in_symbolClk : in std_logic
    );
end ModemRx;

architecture Behavioral of ModemRx is
    constant NUM_DATA_BITS : integer := 8;


COMPONENT IQDeserializer is
    Generic(
        DATA_NUM_BITS : integer
    );
    Port ( clk : in STD_LOGIC;
           deser_in_serialI : in STD_LOGIC;
           deser_in_serialQ : in STD_LOGIC;
           deser_out_txStart : out std_logic;
           deser_out_txData : out std_logic_vector (DATA_NUM_BITS-1 downto 0);
           deser_in_symbolClk : in std_logic
   );
end COMPONENT;

COMPONENT SerialTx is
    Port ( clk : in  STD_LOGIC;
           tx_data : in  STD_LOGIC_VECTOR (7 downto 0);
           tx_start : in  STD_LOGIC;
           tx : out  STD_LOGIC;					-- to Nexys 2 RS-232 port
           tx_done_tick : out  STD_LOGIC);
end COMPONENT;


    -- SIGNALS
    signal txStart : std_logic;
    signal txData : std_logic_vector(NUM_DATA_BITS-1 downto 0);



begin

IQToChar:
IQDeserializer
Generic Map(
    DATA_NUM_BITS => NUM_DATA_BITS
)
Port Map(
    clk => clk,
    deser_in_serialI => modemRx_in_serialI,
    deser_in_serialQ => modemRx_in_serialQ,
    deser_out_txStart => txStart,
    deser_out_txData => txData,
    deser_in_symbolClk => modemRx_in_symbolClk
);

Transmitter:
SerialTx
Port Map(
    clk => clk,
    tx_data => txData,
    tx_start => txStart,
    tx => modemRx_out_tx
);

end Behavioral;