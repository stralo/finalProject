----------------------------------------------------------------------------------
-- Engineer: Richard Addo & George Boateng
-- Create Date: 04/27/2015 04:13:50 AM
-- Design Name: 
-- Module Name: Modulator - Behavioral
-- Description:  
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.math_real.all; 


entity Modulator is
    Port ( 
        clk : in STD_LOGIC;
        mod_in_iPulse : in std_logic_vector(15 downto 0); 
        mod_in_qPulse : in std_logic_vector(15 downto 0); 
        mod_in_sampleClk : in std_logic;
        mod_out_qpskSignal : out std_logic_vector(11 downto 0)    
    );
end Modulator;

architecture Behavioral of Modulator is

COMPONENT dds_compiler_0 is 
Port (
    aclk : in STD_LOGIC;
    m_axis_data_tvalid : out STD_LOGIC;
    m_axis_data_tdata : out STD_LOGIC_VECTOR ( 31 downto 0 )
);
end COMPONENT;
    -- INTER COMPONENT SIGNALS
    signal dataReady : std_logic := '0';
    signal dds_data : std_logic_vector(31 downto 0) := (others=>'0');
    signal dds_cosine: std_logic_vector(13 downto 0) := (others => '0');
    signal dds_sine : std_logic_vector(13 downto 0) := (others => '0');
    
    signal qpskSignal: signed (29 downto 0) := (others => '0');
    
    signal iProduct, qProduct :signed(29 downto 0) := (others => '0');
    
begin

DDSModulator:
dds_compiler_0
Port Map(
    aclk => mod_in_sampleClk, 
    m_axis_data_tvalid => dataReady,
    m_axis_data_tdata => dds_data
);

    dds_cosine <= dds_data(13 downto 0) when dataReady = '1' else (others => '0'); 
    dds_sine <= dds_data(29 downto 16) when dataReady = '1' else (others => '0');

process(clk)
begin
    if rising_edge(clk) then 
        if mod_in_sampleClk = '1' then 
--            iProduct <= signed(signed(mod_in_iPulse) * signed(dds_cosine));
--            qProduct <= signed(signed(mod_in_qPulse) * signed(dds_sine));
--            qpskSignal <= iProduct - qProduct; 
            qpskSignal <= signed(signed(mod_in_iPulse) * signed(dds_cosine)) - signed(signed(mod_in_qPulse) * signed(dds_sine)); 
        end if; 
    end if; 
end process; 

mod_out_qpskSignal <= std_logic_vector(qpskSignal(28 downto 17));

end Behavioral;
