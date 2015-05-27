----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/27/2015 03:48:54 AM
-- Design Name: 
-- Module Name: CharFifoInputMux - Behavioral
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


entity CharFifoInputMux is
    Port ( sel : in STD_LOGIC;
           mux_in_rx_data : in STD_LOGIC_VECTOR (7 downto 0);
           mux_out_data : out std_logic_vector(7 downto 0)
    );
end CharFifoInputMux;

architecture Behavioral of CharFifoInputMux is

    constant STX : std_logic_vector (MSB downto 0) := x"02";
    constant NUL : std_logic_vector (MSB downto 0) := x"00";

begin

     
    

end Behavioral;
