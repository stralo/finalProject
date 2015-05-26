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
        modemRx_in_qpskSignal: in std_logic_vector(11 downto 0);
        modemRx_out_tx : out std_logic;
        modemRx_in_symbolClk : in std_logic;
        modemRx_in_sampleClk : in std_logic
    );
end ModemRx;

architecture Behavioral of ModemRx is
    constant NUM_DATA_BITS : integer := 8;
    
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
           yI_out, yQ_out : out STD_LOGIC_VECTOR (WIDTH-1 downto 0) );  -- rotator output, to detectors
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


begin

QPSK_Demodulator:
Demodulator
Port Map(
    clk => clk, 
    demod_in_sampleClk => modemRx_in_sampleClk, 
    demod_in_qpskSignal => modemRx_in_qpskSignal,
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
     yQ_out => qPulse
      );  -- rotator output, to detectors


 
Sampler:
process(clk)
begin
    if rising_edge(clk) then 
        if modemRx_in_symbolClk = '1' then 
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

end Behavioral;