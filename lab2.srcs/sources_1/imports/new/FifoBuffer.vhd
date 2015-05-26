----------------------------------------------------------------------------------
-- Engineer: Richard Addo & George Boateng
-- 
-- Create Date: 04/05/2015 12:16:56 AM
-- Module Name: FifoBuffer - Behavioral
-- Project Name: ENGS 128 LAB 1
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;


entity FifoBuffer is
    generic(BUF_LEN : integer;
            ADDR_MSB : integer
    );
    Port ( 
           buf_clk : in STD_LOGIC; 
           buf_in_data : in STD_LOGIC_VECTOR (7 downto 0);
           buf_in_wr_en : in STD_LOGIC;
           buf_in_rd_en : in STD_LOGIC; 
           buf_in_wr_addr : in STD_LOGIC_VECTOR (ADDR_MSB downto 0); -- comes from the counter
           buf_in_rd_addr : in std_logic_vector (ADDR_MSB downto 0);
           buf_out_data : out STD_LOGIC_VECTOR (7 downto 0);
           buf_in_reset : in STD_LOGIC := '1'
           );
            
end FifoBuffer;

architecture Behavioral of FifoBuffer is
--    constant BUF_LEN : integer := 8; 
    constant BUF_WIDTH : integer := 8;
    constant MSB : integer := BUF_WIDTH - 1;
    constant STX : std_logic_vector (MSB downto 0) := x"02";
    constant NUL : std_logic_vector (MSB downto 0) := x"00";
    constant MAX_ADDR : integer := BUF_LEN - 1; 
    
    type regfile_type is array(BUF_LEN -1  downto 0) of std_logic_vector(MSB downto 0); 
    signal buffer_array : regfile_type;

begin
    

    buffer_array(0) <= STX;
    
    BufferProcess:
    process(buf_clk)
    begin
        if rising_edge(buf_clk) then 
            if (buf_in_reset = '1') then 
                buffer_array <= (others => NUL); -- fill everything with NULL
                buffer_array(0) <= STX; 
            else 
                -- write only if there's room 
                if (buf_in_wr_en = '1') then 
                    buffer_array( to_integer(unsigned(buf_in_wr_addr)) ) <= buf_in_data;
                    -- ADD NULL after where we just wrote, just in case user
                    buffer_array(   to_integer(unsigned(buf_in_wr_addr)) + 1   ) <= NUL;
                elsif (buf_in_rd_en = '1')  then 
                    buf_out_data <= buffer_array( to_integer(unsigned(buf_in_rd_addr))); -- -1? 
                end if; 
            end if; 
        end if; 
    end process; 
   
end Behavioral;
