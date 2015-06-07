

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity FIFO_tb is
end FIFO_tb;

architecture tb of FIFO_tb is



COMPONENT fifo_generator_0
      PORT (
        clk : IN STD_LOGIC;
        srst : IN STD_LOGIC;
        din : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
        wr_en : IN STD_LOGIC;
        rd_en : IN STD_LOGIC;
        dout : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
        full : OUT STD_LOGIC;
        almost_full : OUT STD_LOGIC;
        empty : OUT STD_LOGIC;
        almost_empty : OUT STD_LOGIC
      );
    END COMPONENT;
    
    
       constant clk_period : time := 100 ns;
        constant TxData : std_logic_vector(143 downto 0) := x"4142434445464748494A4B4C4D4E4F50510d";
        
        
        
        
        -- Inputs
        signal clk, resetCharFifo, wr_en, rd_en, bufferFull, bufferAlmostFull, bufferEmpty, bufferAlmostEmpty : std_logic := '0';
        signal bufferInput, bufferOutput : std_logic_vector(7 downto 0) := (others => '0');
        
        
        


begin

  uut:
  fifo_generator_0
        PORT MAP (
        clk => clk,
          srst => resetCharFifo,
          din => bufferInput,
          wr_en => wr_en,
          rd_en => rd_en,
          dout => bufferOutput,
          full => bufferFull,
          almost_full => bufferAlmostFull,
          empty => bufferEmpty,
          almost_empty => bufferAlmostEmpty
        ); 
  
  -----------------------------------------------------------------------
  -- Generate clock
  -----------------------------------------------------------------------

  clock_gen : process
  begin
    clk <= '0';
    wait for clk_period;
    loop
      clk <= '0';
      wait for clk_period/2;
      clk <= '1';
      wait for clk_period/2;
    end loop;
  end process clock_gen;



-- Stimulus process
   stim_proc: process
   begin		
		wait for 10.25*clk_period;		

        -- Send enough characters to fill the buffer
		for charcount in (TxData'length / 8)-1 downto 0 loop
		  bufferInput <= TxData(charcount*8+7 downto charcount*8); 
		  wr_en <= '1'; 
		  wait for 1*clk_period; 
		  wr_en <= '0';
		  wait for 1*clk_period; 
		end loop;
		
		wait for 2 * clk_period;
		-- now read from the buffer
		for i in (TxData'length /8)-1 downto 0 loop
		  rd_en <= '1'; 
		  wait for 1*clk_period; 
		  rd_en <= '0';
		  wait for 1*clk_period;
        end loop; 
         
		wait for 200 us;
        
   end process;

end tb;
