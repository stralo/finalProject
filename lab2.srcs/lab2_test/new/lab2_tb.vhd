LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.all;
use IEEE.math_real.all;
 
ENTITY lab2_tb IS
END lab2_tb;
 
ARCHITECTURE behavior OF lab2_tb IS 
 
    COMPONENT lab3top is
    Port ( clk : in STD_LOGIC;
           RsRx : in STD_LOGIC;
           RsTx : out STD_LOGIC;
           seg : out STD_LOGIC_VECTOR(0 to 6);
           an : out STD_LOGIC_VECTOR(3 downto 0)
    );
    end COMPONENT;
    
   --Inputs
       signal clk : std_logic := '0';
       signal RsRx : std_logic := '1';
       signal rotate_bit_0, rotate_bit_1 : std_logic := '0';
    
     --Outputs
    signal RsTx: std_logic;
    signal seg: STD_LOGIC_VECTOR(0 to 6);
    signal an: STD_LOGIC_VECTOR(3 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10ns;		-- 100 MHz
	
	-- Data definitions
	constant bit_time : time := 8.68us;		-- 115,200 baud
	constant TxData : std_logic_vector(31 downto 0) := x"4142430d";
	
	
BEGIN 
	-- Instantiate the Unit Under Test (UUT)
	uut:
	lab3top 
	Port Map( 
        clk => clk, 
        RsRx => RsRx,
        RsTx => RsTx,
        seg => seg,
        an => an
     );
   
   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
   
 
   -- Stimulus process
   stim_proc: process
   begin		
		wait for 100 us;
		wait for 10.25*clk_period;		

        -- Send the character stream from left to right	
        -- but send the bits within each char from right to left	
		for charcount in (TxData'length / 8)-1 downto 0 loop
		  RsRx <= '0';		-- Start bit
		  wait for bit_time;
		
		  for bitcount in 0 to 7 loop
            RsRx <= TxData(charcount*8 + bitcount);
            wait for bit_time;
		  end loop;
		
		  RsRx <= '1';		-- Stop bit
		  wait for 200 us;  -- Intercharacter spacing
		end loop;
		
		-- Repeat every millisecond
--		wait for 1 ms;
        wait;
   end process;
END;
