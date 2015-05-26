----------------------------------------------------------------------------------
-- Engineer: Richard Addo & George Boateng
-- Create Date: 04/12/2015 08:07:40 PM
-- Module Name: ModemRx - Behavioral
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.MATH_REAL.ALL;  

entity ModemRx is
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
        modemRx_in_mode : in std_logic;
        modemRx_out_iPulse : out std_logic
    );
end ModemRx;

architecture Behavioral of ModemRx is
    constant NUM_DATA_BITS : integer := 8;
    
    
COMPONENT ADCInterface is
        Generic(
            WORD_SIZE : integer := 16
        );
        Port ( 
            clk : in STD_LOGIC;
            spiClk : in std_logic;  -- SPI bus clock (from MMCM) 
            -- user interface to the system
            start : in std_logic;                                -- start conversion
            conversionDone : out std_logic;                     -- conversion in progress
            convertedValue : out std_logic_vector(15 downto 0);
--                        convertedValue : out std_logic_vector(11 downto 0);

            -- interface to the pmod-da2
            syncForADC : out std_logic; 
            serialFromADCCh1 : in std_logic;
            serialFromADCCh2 : in std_logic;
            serialClkForADC : out std_logic
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



COMPONENT Demodulator is
        Port ( clk : in STD_LOGIC;
               demod_in_sampleClk : in std_logic; 
               demod_in_qpskSignal : in STD_LOGIC_VECTOR (11 downto 0);
               demod_out_iSample : out STD_LOGIC_VECTOR (15 downto 0);
               demod_out_qSample : out STD_LOGIC_VECTOR (15 downto 0));
    end COMPONENT;

COMPONENT MatchedFilter is       
    Port (  
        clk : in STD_LOGIC;
        mf_in_sample : in STD_LOGIC_vector( 15 downto 0); -- modulated input
        mf_in_sampleClk : in std_logic; 
        mf_in_symbolClk : in std_logic; 
        mf_out_val: out std_logic_vector(15 downto 0) -- either i or q
        );
end COMPONENT;


COMPONENT CRloop is
    generic( WIDTH : positive := 16 );
    Port ( clk : in STD_LOGIC;
           sample_clk : in STD_LOGIC;
--           strobe : in STD_LOGIC;                                     -- strobe is currently internal
           xI, xQ : in STD_LOGIC_VECTOR (WIDTH-1 downto 0);             -- from matched filters
           yI_out, yQ_out : out STD_LOGIC_VECTOR (WIDTH-1 downto 0); 
           outputStrobe : out std_logic);  -- rotator output, to detectors
end COMPONENT;


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
    signal serialI, serialQ : std_logic := '0';
    signal iSample, qSample : std_logic_vector(15 downto 0) := (others=>'0');
    signal mf_out_iPulse, mf_out_qPulse, iPulse, qPulse : std_logic_vector(15 downto 0) := (others=>'0');
    
    signal adcStart, ADCConversionDone : std_logic := '0';
    signal ADCConvertedValue : std_logic_vector(15 downto 0) := (others => '0');
--        signal ADCConvertedValue : std_logic_vector(11 downto 0) := (others => '0');

    
    
    signal valFromADC, qpskSignal: std_logic_vector(11 downto 0);
    
    type StateType is (idle, awaitingConversionDone);  
    signal currentState, nextState : StateType := idle;

    signal dummySigFromADCCh2 : std_logic := '0'; 
    signal sixteenBitsADCOut : std_logic_vector(15 downto 0); 
    signal rawQPSKSignal : std_logic_vector(11 downto 0);
    
    signal samplingStrobe, sampleNow : std_logic; 
    

    type startHoldState is (s0, s1);  --, s4, s5, s6
    signal startCurrentState , startNextState : startHoldState := s0;

begin

    rawQPSKSignal <= modemRx_in_rawQPSKSignal;

ADCInFace:
ADCInterface
Port Map( 
    clk => clk,
    spiClk => modemRx_in_spiClk,
    -- user interface to the system
    start =>  modemRx_in_sampleClk, --modemRx_in_dacConversionDone, --modemRx_in_sampleClk,                              -- start conversion
    conversionDone => ADCConversionDone,                    -- conversion in progress
    convertedValue => ADCConvertedValue,
    -- interface to the pmod-da2
    syncForADC => modemRx_out_syncForADC,
    serialFromADCCh1 => modemRx_in_serialFromADC,
    serialFromADCCh2 => dummySigFromADCCh2,
    serialClkForADC => modemRx_out_serialClkForADC
);

qpskSignal <= not(ADCConvertedValue(11)) &  ADCConvertedValue(10 downto 0)  when modemRx_in_mode = '0' else rawQPSKSignal; --
sixteenBitsADCOut <= "0000" & not(qpskSignal(11)) & qpskSignal(10 downto 0);

Debug_PassThroughDAC:
DAC
Port Map( 
    clk => clk,
    dacInterface_in_spiClk => modemRx_in_spiClk, 
    -- user interface to the system
    dacInterface_in_word => sixteenBitsADCOut,    
    dacInterface_in_start => ADCconversionDone,                              -- start conversion
    dacInterface_out_busy => open,                               -- conversion in progress
    -- interface to the pmod-da2
    dac_out_pmodSync => modemRx_out_syncForDebugDAC,                            -- active-low sync signal
    dac_out_pmodSerialClk  => modemRx_out_serialClkForDebugDAC,                             -- serial clock to DAC (spi_sck)
    dac_out_serialDataCh1  => modemRx_out_serialForDebugDAC                              -- serial data to the DAC (spi_MOSI)
);


QPSK_Demodulator:
Demodulator
Port Map(
    clk => clk, 
    demod_in_sampleClk => modemRx_in_sampleClk, 
    demod_in_qpskSignal => qpskSignal,
    demod_out_iSample => iSample,
    demod_out_qSample => qSample
);
MF_I:
MatchedFilter
Port Map(
    clk => clk,
    mf_in_sample => iSample,
    mf_in_sampleClk => modemRx_in_sampleClk,
    mf_in_symbolClk => modemRx_in_symbolClk, 
    mf_out_val =>  mf_out_iPulse
);

MF_Q:
MatchedFilter
Port Map(
    clk => clk,
    mf_in_sample => qSample,
    mf_in_sampleClk => modemRx_in_sampleClk,
    mf_in_symbolClk => modemRx_in_symbolClk, 
    mf_out_val => mf_out_qPulse
);


CarriageRecoveryLoop:
CRLoop
Port Map( 
    clk => clk, 
    sample_clk => modemRx_in_sampleClk,
    --           strobe : in STD_LOGIC;                                     -- strobe is currently internal
    xI => mf_out_iPulse,
    xQ => mf_out_qPulse,
    yI_out => iPulse,
     yQ_out => qPulse,
     outputStrobe => samplingStrobe
      );  


IQToChar:
IQDeserializer
Generic Map(
    DATA_NUM_BITS => NUM_DATA_BITS
)
Port Map(
    clk => clk,
    deser_in_serialI => serialI,
    deser_in_serialQ => serialQ,
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




process(startCurrentState, samplingStrobe)
begin
    
    startNextState <= startCurrentState; 
    sampleNow <= '0';
    
    case startCurrentState is 
        when s0 =>
            if (samplingStrobe = '1') then 
                startNextState <= s1; 
            end if; 
            
        when s1 =>
            sampleNow <= '1';
            startNextState <= s0; 
                                  
            
    end case; 
 end process;  

process(modemRx_in_sampleClk)
begin
    if rising_edge(modemRx_in_sampleClk) then 
        startCurrentState <= startNextState; 
    end if;
end process; 


Sampler:
process(clk)
begin
    if rising_edge(clk) then 
          if sampleNow = '1' then 
            if signed(iPulse) < 0 then 
                serialI <= '0';
            elsif signed(iPulse) > 0 then  
                serialI <= '1';
            end if;
            
            if signed(qPulse) < 0 then 
                serialQ <= '0';
            elsif signed(qPulse) > 0 then  
                serialQ <= '1';
            end if;  
        end if; 
    end if; 
end process;
end Behavioral;