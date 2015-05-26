----------------------------------------------------------------------------------
-- Engineer: Richard Addo & George Boateng
-- Create Date: 04/23/2015 04:06:24 AM
-- Module Name: PulseShapingFilter_MatchedFilter - Behavioral
-- Description:  
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all; 
use IEEE.math_real.all; 

entity PulseShapingFilter_MatchedFilter is
    Port ( clk : in STD_LOGIC;
        tl_in_newDataAvailable: in std_logic;
        tl_in_newData: in std_logic_vector(15 downto 0);  
        tl_out_ps_sample : out std_logic_vector(15 downto 0);
        tl_out_mf_bit : out std_logic
    );
end PulseShapingFilter_MatchedFilter;

architecture Behavioral of PulseShapingFilter_MatchedFilter is
COMPONENT PulseShaper is
    Port ( clk : in STD_LOGIC;
        ps_in_newDataAvailable : in std_logic; -- drive by symbolClk 
        ps_in_data: in std_logic_vector( 15 downto 0);
        ps_out_readyForData : out std_logic; 
        ps_out_sampleAvailable : out std_logic; -- this is sampleClk
        ps_out_sample : out std_logic_vector(15 downto 0)  -- sample for the matched filter 
   );
        
end COMPONENT;

COMPONENT MatchedFilter is       
    Port (  
        clk : in STD_LOGIC;
        mf_in_sample : in STD_LOGIC_vector( 15 downto 0); -- modulated input
        mf_in_sampleClk : in std_logic; 
        mf_out_symbolClk : out std_logic; 
        mf_out_serialBit : out std_logic -- either i or q
        );
end COMPONENT;

    -- intercomponent signals
    signal sampleClk, newDataAvailable  : std_logic := '0'; 
    signal sample : std_logic_vector(15 downto 0) := (others => '0');



begin

    tl_out_ps_sample <= sample; 

PSF:
PulseShaper
Port Map(
    clk => clk,
    ps_in_newDataAvailable => tl_in_newDataAvailable,
    ps_in_data => tl_in_newData,
    ps_out_readyForData => open, 
    ps_out_sampleAvailable => sampleClk,
    ps_out_sample => sample
);


MF:
MatchedFilter
Port Map(
    clk => clk,
    mf_in_sample => sample,
    mf_in_sampleClk => sampleClk,
    mf_out_symbolClk => open, 
    mf_out_serialBit => tl_out_mf_bit
);



end Behavioral;
