----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- Create Date: 05/26/2015 08:35:31 PM
-- Module Name: NewMatchedFilter - Behavioral
-- Description: 

-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;





entity NewMatchedFilter is
  Port (
    clk : in STD_LOGIC;
     mf_in_sample : in STD_LOGIC_vector( 15 downto 0); -- modulated input
     mf_in_sampleClk : in std_logic; 
     mf_in_symbolClk : in std_logic; 
     mf_out_val : out std_logic_vector(15 downto 0)
             
              );
end NewMatchedFilter;

architecture Behavioral of NewMatchedFilter is


COMPONENT fir_compiler_1
  PORT (
    aclk : IN STD_LOGIC;
    s_axis_data_tvalid : IN STD_LOGIC;
    s_axis_data_tready : OUT STD_LOGIC;
    s_axis_data_tdata : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    m_axis_data_tvalid : OUT STD_LOGIC;
    m_axis_data_tdata : OUT STD_LOGIC_VECTOR(39 DOWNTO 0)
  );
END COMPONENT;

    signal compilerOutput : std_logic_vector(39 downto 0) := (others => '0');
    signal compilerOutputData : std_logic_vector(33 downto 0) := (others => '0');
    signal dataValid, dataReady, outputDataReady : std_logic := '0';
begin

fircompiler : fir_compiler_1
  PORT MAP (
    aclk => clk,
    s_axis_data_tvalid => mf_in_sampleClk,
    s_axis_data_tready => open,
    s_axis_data_tdata => mf_in_sample,
    m_axis_data_tvalid => dataReady,
    m_axis_data_tdata => compilerOutput
  );
  
process(clk)
begin
    if rising_edge(clk) then 
        if dataReady = '1' then 
--            compilerOutputData <= compilerOutput(33 downto 0);
            mf_out_val <= compilerOutput(30 downto 15);
--            mf_out_val <= compilerOutput(28 downto 28-16+1);
        end if; 
    end if; 
end process; 

end Behavioral;
