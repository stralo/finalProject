----------------------------------------------------------------------------------
-- Engineer: Richard Addo & George Boateng
-- 
-- Create Date: 04/05/2015 12:16:56 AM
-- Module Name: BufferAddrCounter - Behavioral
-- Project Name: ENGS 128 LAB 1
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;
use IEEE.math_real.all; 

entity BufferAddrCounter is
    generic(BUF_LEN : integer;
            ADDR_MSB : integer;
            FOR_READING : std_logic   -- does this counter point to the write addr or read addr? write = '0', read = '1'
    );
    Port ( clk : in STD_LOGIC;
           ctr_in_en : in STD_LOGIC;    
           reset : in STD_LOGIC;
           ctr_out_addr : out STD_LOGIC_VECTOR (ADDR_MSB downto 0); 
           ctr_out_max_reached : out std_logic 
    );
end BufferAddrCounter;

architecture Behavioral of BufferAddrCounter is
    constant MAX_COUNT : integer := BUF_LEN;
    signal count : unsigned(ADDR_MSB downto 0) := (others => '0');
    
        

begin
    Counter: 
    process(clk)
    begin
        if rising_edge(clk) then 
            if (ctr_in_en = '1') then 
                -- IF OUR POINTER IS CURRENTLY AT 6, CAN'T WRITE ANYMORE COS WE WANT A(7) TO MAINTAIN THE NULL WE PLACED THERE AT THE TIME WE WROTE AT 6
                if (FOR_READING = '0') and ( (to_integer(count) + 1) = (BUF_LEN - 1)) then 
                    ctr_out_max_reached <= '1';   
                -- but if we're reading, then we actually want to read the null, and hence we can't increase if POINTER IS CURRENTLY AT 7 (not 6)
                elsif (FOR_READING = '1') and ( to_integer(count) = (BUF_LEN - 1)) then  
                    ctr_out_max_reached <= '1';       
                else
                    count <= count + 1; 
                    ctr_out_max_reached <= '0';
                end if; 
            elsif reset = '1' then 
                if FOR_READING = '1' then 
                    count <= (others => '0');
                    ctr_out_max_reached <= '0';
                else -- if this is a write addr pointer
                    count <= (0 => '1', others => '0'); -- NOTE that first positin is 1 cos pos 0 always contains STX
                    ctr_out_max_reached <= '0';
               end if;
                
            end if; 
        end if;
    end process Counter;
    ctr_out_addr <= std_logic_vector(count); 
    
    
end Behavioral;
