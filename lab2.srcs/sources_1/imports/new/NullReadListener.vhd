----------------------------------------------------------------------------------
-- Engineer: Richard Addo & George Boateng
-- 
-- Create Date: 04/05/2015 12:16:56 AM
-- Module Name: NullReadListener - Behavioral
-- Project Name: ENGS 128 LAB 1
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity NullReadListener is
    Port ( null_listener_in_data : in STD_LOGIC_VECTOR (7 downto 0);
           null_listener_out_null_read : out STD_LOGIC);
end NullReadListener;

architecture Behavioral of NullReadListener is
    constant BUF_WIDTH : integer := 8;
    constant MSB : integer := BUF_WIDTH - 1;
    constant NUL : std_logic_vector (MSB downto 0) := x"00";

begin
    process(null_listener_in_data)
    begin
        if (null_listener_in_data = NUL) then 
            null_listener_out_null_read <= '1'; 
        else
            null_listener_out_null_read <= '0'; 
        end if; 
    end process; 


end Behavioral;
