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


COMPONENT PulseShaper is
    Port ( clk : in STD_LOGIC;
        ps_in_newDataAvailable : in std_logic; 
        ps_in_iData: in std_logic_vector( 15 downto 0);
        ps_in_qData: in std_logic_vector( 15 downto 0);
        ps_out_readyForData : out std_logic; 
        ps_out_sampleAvailable : out std_logic; -- sampleClk
        ps_out_iSample : out std_logic_vector(15 downto 0);
        ps_out_qSample : out std_logic_vector(15 downto 0)
          -- sample for the matched filter 
   );
        
end COMPONENT;


COMPONENT Modulator is
    Port ( 
        clk : in STD_LOGIC;
        mod_in_iPulse : in std_logic_vector(15 downto 0); 
        mod_in_qPulse : in std_logic_vector(15 downto 0); 
        mod_in_sampleClk : in std_logic;
        mod_out_qpskSignal : out std_logic_vector(11 downto 0)    
    );
end COMPONENT;


COMPONENT DAC is
Generic(
    WORD_SIZE : integer := 16
);
Port ( 
    clk : in STD_LOGIC;
    dacInterface_in_spiClk : in std_logic;  -- SPI bus clock (from MMCM) 
    -- user interface to the system
    dacInterface_in_word : in std_logic_vector(15 downto 0);    -- word (command + data) to be sent
    dacInterface_in_start : in std_logic;                                -- start conversion
    dacInterface_out_busy : out std_logic;                                -- conversion in progress
    -- interface to the pmod-da2
    dac_out_pmodSync : out std_logic;                                -- active-low sync signal
    dac_out_pmodSerialClk : out std_logic;                                -- serial clock to DAC (spi_sck)
    dac_out_serialDataCh1 : out std_logic                                  -- serial data to the DAC (spi_MOSI)
);
end component;
    
    -- SIGNALS
    signal rxDone : std_logic;
    signal rxData : std_logic_vector(7 downto 0);
    signal serialI, serialQ, sampleClk: std_logic:= '0';
    signal ps_in_iData, ps_in_qData : std_logic_vector(15 downto 0) := (others => '0');
    signal iSample, qSample : std_logic_vector(15 downto 0) := (others => '0');
    
    signal qpskSignal : std_logic_vector(11 downto 0) := (others => '0');
    signal sixteenBitsQPSK : std_logic_vector(15 downto 0) := (others => '0');
    signal dacStart, dacBusy : std_logic := '0';
    
    
    
    type StateType is (idle, awaitingBusySignal );  
    signal currentState, nextState : StateType := idle;
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
    charToIQ_out_serialI => serialI,
    charToIQ_out_serialQ => serialQ,
    charToIQ_in_rotate => modemTx_in_rotate,
    charToIQ_in_symbolClk => modemTx_in_symbolClk
);

ps_in_iData <= x"8000" when serialI = '0' else
               x"7fff" when serialI = '1';
ps_in_qData <= x"8000" when serialQ = '0' else
               x"7fff" when serialQ = '1';  
               
modemTx_out_sampleClk <= sampleClk ; 


PSF:
PulseShaper
Port Map(
    clk => clk,
    ps_in_newDataAvailable => modemTx_in_symbolClk,
    ps_in_idata => ps_in_iData,
    ps_in_qdata => ps_in_qData,
    ps_out_readyForData => open, 
    ps_out_sampleAvailable => sampleClk,
    ps_out_iSample => iSample,
    ps_out_qSample => qSample
);




QPSK_Modulator:
Modulator
Port Map( 
    clk => clk, 
    mod_in_iPulse => iSample,
    mod_in_qPulse  => qSample,
    mod_in_sampleClk => sampleClk,
    mod_out_qpskSignal => qpskSignal
    );
    
modemTx_out_rawQPSKSignal <= qpskSignal; 
sixteenBitsQPSK <= "0000" & not(qpskSignal(11)) & qpskSignal(10 downto 0); --std_logic_vector(signed(qpskSignal) + x"800"); --&  --)

modemTx_out_dacConversionDone <= not(dacBusy); 
DACInterface:
DAC
Port Map( 
    clk => clk,
    dacInterface_in_spiClk => modemTx_in_spiClk, 
    -- user interface to the system
    dacInterface_in_word => sixteenBitsQPSK,    
    dacInterface_in_start => sampleClk,                              -- start conversion
    dacInterface_out_busy => dacBusy,                               -- conversion in progress
    -- interface to the pmod-da2
    dac_out_pmodSync => modemTx_out_syncForDAC,                            -- active-low sync signal
    dac_out_pmodSerialClk  => modemTx_out_serialClkForDAC,                             -- serial clock to DAC (spi_sck)
    dac_out_serialDataCh1  => modemTx_out_serialForDAC                              -- serial data to the DAC (spi_MOSI)
);

end Behavioral;
