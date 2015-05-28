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
     mf_in_iSample : in std_logic_vector(15 downto 0); 
     mf_in_qSample : in std_logic_vector(15 downto 0); 
     mf_in_sampleClk : in std_logic; 
     mf_in_symbolClk : in std_logic; 
     mf_out_Ival : out std_logic_vector(15 downto 0);
     mf_out_qVal : out std_logic_vector(15 downto 0)
             
              );
end NewMatchedFilter;

architecture Behavioral of NewMatchedFilter is


COMPONENT fir_compiler_3
  PORT (
    aclk : IN STD_LOGIC;
    s_axis_data_tvalid : IN STD_LOGIC;
    s_axis_data_tready : OUT STD_LOGIC;
    s_axis_data_tdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    m_axis_data_tvalid : OUT STD_LOGIC;
    m_axis_data_tdata : OUT STD_LOGIC_VECTOR(79 DOWNTO 0)
  );
END COMPONENT;


    signal compilerOutput : std_logic_vector(79 downto 0) := (others => '0');
    signal dataValid, dataReady, outputDataReady : std_logic := '0';
    signal compilerInput : stD_logic_vector(31 downto 0); 
begin

compilerInput <= mf_in_qSample & mf_in_iSample;

FIR: fir_compiler_3
  PORT MAP (
    aclk => clk,
    s_axis_data_tvalid => mf_in_sampleClk,
    s_axis_data_tready => open,
    s_axis_data_tdata => compilerInput,
    m_axis_data_tvalid => dataReady,
    m_axis_data_tdata => compilerOutput
  );
  
process(clk)
begin
  if rising_edge(clk) then 
      if dataReady = '1' then 
          mf_out_Ival <= compilerOutput(30 downto 15);
          mf_out_qVal <= compilerOutput(70 downto 55); 
      end if; 
  end if; 
end process;

end Behavioral;
