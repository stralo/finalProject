--------------------------------------------------------------------------------
-- Company: 		Engs 128 15S
-- Engineer:		Richard Addo & George Boateng
-- Create Date:     4/10/15
-- Module Name:     Serializer_tb.vhd
-- Project Name:    Lab2
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.all;
 
ENTITY Serializer_tb IS
END Serializer_tb;
 
ARCHITECTURE behavior OF Serializer_tb IS 
   
    COMPONENT IQSerializer is
        generic( 
                DATA_NUM_BITS : integer := 8
        );
        Port ( clk : in STD_LOGIC;
               ser_in_char : in std_logic_vector (DATA_NUM_BITS-1 downto 0); -- the character to be encoded
               ser_in_start : in std_logic;
               ser_out_serialI : out std_logic; 
               ser_out_serialQ : out std_logic
               );
    end COMPONENT;

    
   --Inputs
   signal clk : std_logic := '0';
   signal char_input : std_logic_vector (7 downto 0);
   signal startEncode : std_logic := '0';
   


 	--Outputs
    signal i_channel : std_logic; 
    signal q_channel : std_logic;


   -- Clock period definitions
   constant clk_period : time := 10ns;		-- 100 MHz
   
   -- Data definitions
   constant testChar : std_logic_vector(7 downto 0) := x"01"; -- A
	

BEGIN 
	-- Instantiate the Unit Under Test (UUT)
   uut: IQSerializer 
   Generic map(
        DATA_NUM_BITS => 8
   )
   PORT MAP (
          clk => clk,
          ser_in_char => char_input,
          ser_in_start => startEncode,
          ser_out_serialI => i_channel,
          ser_out_serialQ => q_channel
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
		wait for 50 us;

        char_input <= testChar;
        startEncode <= '1';
       
		wait for 5 * clk_period;
		
		-- wait for 1ms
--		wait for 1 ms;
        wait;
   end process;
END;
