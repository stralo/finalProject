----------------------------------------------------------------------------------
-- Engineer: 
-- Create Date: 04/21/2015 07:43:26 PM
-- Module Name: MyMultiplyAccumulator - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.math_real.all; 

entity MyMultiplyAccumulator is
    Port ( clk : in STD_LOGIC;
           h : in STD_LOGIC_VECTOR (15 downto 0);
           x : in STD_LOGIC_VECTOR (15 downto 0);
           MAC_out : out STD_LOGIC_VECTOR (15 downto 0));
end MyMultiplyAccumulator;

architecture Behavioral of MyMultiplyAccumulator is

        constant COEFFICIENT_SUM : integer := 179132;
    constant NUM_GUARD_BITS : integer :=  integer(  CEIL(  LOG2(real(COEFFICIENT_SUM)) ) );
    constant ACCUMULATOR_NUM_BITS : integer := 32 + integer(NUM_GUARD_BITS);
    
    -- DSP
    signal  product, multiplierIn, multiplierOut, mult : std_logic_vector(31 downto 0); 
    signal sum, accumulatorIn, accumulatorOut, accum : std_logic_vector(ACCUMULATOR_NUM_BITS-1 downto 0);
    signal clearAccumulator, clearMultiplier, resetMAC : std_logic := '0';
    signal yOut : std_logic_vector(16 downto 0);  -- y(n)

begin

    process(clk)
    begin
        if rising_edge(clk) then
            if resetMAC = '1' then 
                accum <= (others => '0');
                mult <= (others => '0');
            else
                accum <= std_logic_vector( signed(accum)+ signed(mult) );
                mult <= std_logic_vector( signed(h) *signed(x) );
            end if; 
        end if; 
    end process;
    
--    MAC_OUT <= std_logic_vector(    resize( signed(accum), MAC_OUT'length )     );

end Behavioral;
