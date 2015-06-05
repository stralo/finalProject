----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Richard Addo & George Boateng
-- Create Date: 04/12/2015 07:56:13 PM
-- Module Name: CharToIQ - Behavioral

----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all; 
use IEEE.math_real.all;

entity CharToIQ is
    Port ( clk : in STD_LOGIC;
    charToIQ_in_rxDone : in std_logic;
    charToIQ_in_rxData : in std_logic_vector;
    charToIQ_out_serialI : out std_logic;
    charToIQ_out_serialQ : out std_logic;
    charToIQ_in_rotate : in std_logic_vector(1 downto 0);
    charToIQ_in_symbolClk : in std_logic);
    
end CharToIQ;

architecture Behavioral of CharToIQ is
    constant NUM_DATA_BITS : integer := 8;

COMPONENT CharBufferModule is
    Port ( buf_mod_in_clk : in STD_LOGIC;
           buf_mod_in_rx_data : in STD_LOGIC_VECTOR (7 downto 0);
           buf_mod_in_rx_done_tick : in STD_LOGIC;
           buf_mod_in_rd_en : in std_logic; 
           buf_mod_in_flushDone : in std_logic; 
           buf_mod_out_data : out STD_LOGIC_VECTOR (7 downto 0);   -- character read by the serializer
           buf_mod_out_startClearing : out STD_LOGIC   -- informs serializer it's time to pop out and serialize chars
    );
end COMPONENT;


COMPONENT IQSerializer is
    generic(
            DATA_NUM_BITS : integer := 8
    );
    Port ( clk : in STD_LOGIC;
            ser_in_start : in std_logic;   -- from buffer when it's time to flush
           ser_in_char : in std_logic_vector (DATA_NUM_BITS-1 downto 0); -- the character to be encoded
           ser_out_ram_rd_en : out std_logic;
           ser_out_serialI : out std_logic; 
           ser_out_flushDone : out std_logic; 
           ser_out_serialQ : out std_logic;
           ser_in_rotate : in std_logic_vector(1 downto 0);
           ser_in_symbolClk : in std_logic
           );
end COMPONENT;


    
    -- signals
    signal dataFromBuffer : std_logic_vector(NUM_DATA_BITS-1 downto 0);
    signal startClearingBuffer, maxRdAddrReached, enableRamRead, resetRdAddr, enableReadCounter, flushDone : std_logic; 

begin

CharBuffer:
CharBufferModule
Port Map(
    buf_mod_in_clk => clk,
    buf_mod_in_rx_data => charToIQ_in_rxData,
    buf_mod_in_rx_done_tick => charToIQ_in_rxDone,
    buf_mod_in_rd_en => enableRamRead,
    buf_mod_in_flushDone => flushDone,
    buf_mod_out_data => dataFromBuffer,
   buf_mod_out_startClearing => startClearingBuffer
);



Serializer:
IQSerializer
Generic Map(
    DATA_NUM_BITS => NUM_DATA_BITS
)
Port Map(
    clk => clk,
    ser_in_char => dataFromBuffer,
    ser_in_start => startClearingBuffer,
    ser_out_flushDone => flushDone,
    ser_out_ram_rd_en => enableRamRead,
    ser_out_serialI => charToIQ_out_serialI,
    ser_out_serialQ => charToIQ_out_serialQ,
    ser_in_rotate => charToIQ_in_rotate,
    ser_in_symbolClk => charToIQ_in_symbolClk
);


end Behavioral;