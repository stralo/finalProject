----------------------------------------------------------------------------------
-- Engineer: Richard Addo & George Boateng
-- 
-- Create Date: 04/05/2015 12:16:56 AM
-- Module Name: BufControllerEOLListener - Behavioral
-- Project Name: ENGS 128 LAB 1
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity BufControllerEOLListener is
    Port ( listener_in_rx_data : in STD_LOGIC_VECTOR (7 downto 0);
           listener_out_is_lf : out STD_LOGIC);
end BufControllerEOLListener;

architecture Behavioral of BufControllerEOLListener is
    constant LF : std_logic_vector(7 downto 0) := x"0d";
  

begin
    process(listener_in_rx_data)
    begin
        if (listener_in_rx_data = LF) then 
            listener_out_is_lf <= '1'; 
        else
            listener_out_is_lf <= '0'; 
        end if; 
    end process; 
end Behavioral;
