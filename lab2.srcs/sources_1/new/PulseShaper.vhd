----------------------------------------------------------------------------------
-- Engineer: Richard Addo & George Boateng
-- Create Date: 04/21/2015 06:32:27 PM
-- Module Name: PulseShaper - Behavioral
-- Description: 
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.MATH_REAL.ALL; 

entity PulseShaper is
    Port ( clk : in STD_LOGIC;
        ps_in_newDataAvailable : in std_logic; 
        ps_in_data: in std_logic_vector( 15 downto 0);
        ps_out_readyForData : out std_logic; 
        ps_out_sampleAvailable : out std_logic; -- sampleClk
        ps_out_sample : out std_logic_vector(15 downto 0)  -- sample for the matched filter 
   );
        
end PulseShaper;

architecture Behavioral of PulseShaper is
COMPONENT fir_compiler_0
  PORT (
    aclk : IN STD_LOGIC;
    s_axis_data_tvalid : IN STD_LOGIC;
    s_axis_data_tready : OUT STD_LOGIC; 
    s_axis_data_tdata : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    m_axis_data_tvalid : OUT STD_LOGIC;
    m_axis_data_tdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
  );
END COMPONENT;
    constant BINARY_POINT_IDX : integer := 29;
    signal sampleAvailable : std_logic := '0';
    signal rawSample : std_logic_vector(31 downto 0) := (others => '0'); 
begin
PulseFilter:
FIR_COMPILER_0
Port Map(
    aclk => clk,
    s_axis_data_tready => ps_out_readyForData,
    s_axis_data_tvalid => ps_in_newDataAvailable,
    s_axis_data_tdata => ps_in_data,
    m_axis_data_tvalid => sampleAvailable,
    m_axis_data_tdata =>  rawSample   
);

ps_out_sampleAvailable <= sampleAvailable;
ps_out_sample <= rawSample(BINARY_POINT_IDX+1) & rawSample(BINARY_POINT_IDX-1 downto BINARY_POINT_IDX-1 - 15 + 1) when sampleAvailable = '1';
end Behavioral;
