----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/20/2015 02:59:23 AM
-- Design Name: 
-- Module Name: XBuffer - Behavioral
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
use IEEE.NUMERIC_STD.all;
use IEEE.math_real.all;

entity XBuffer is
    Generic(BUF_WIDTH : integer;
            BUF_DEPTH : integer
    );
    Port ( clk : in STD_LOGIC;
           xBuf_in_data : in STD_LOGIC_VECTOR (BUF_WIDTH-1 downto 0);
           xBuf_out_data : out STD_LOGIC_VECTOR (BUF_WIDTH-1 downto 0));
end XBuffer;

architecture Behavioral of XBuffer is

    signal shiftRegister: std_logic_vector ( (BUF_DEPTH * BUF_WIDTH)-1 downto 0);
begin


XValBuffer:   -- at any point in time, this holds the last 4 symbols received
process (clk)
begin
    if rising_edge(clk) then
        if deser_in_symbolClk  = '1' then
            shiftRegister <= std_logic_vector(unsigned(shiftRegister) sll 2);
            shiftRegister(1 downto 0) <= decodedSymbol; 
        end if;
    end if;
end process;


end Behavioral;
