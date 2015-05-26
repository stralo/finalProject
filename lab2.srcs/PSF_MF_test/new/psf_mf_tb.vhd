LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.all;
use IEEE.math_real.all;
 
ENTITY psf_mf_tb IS
END psf_mf_tb;
 
ARCHITECTURE behavior OF psf_mf_tb IS 
 
 
COMPONENT PulseShapingFilter_MatchedFilter is 
    Port ( clk : in STD_LOGIC;
            tl_in_newDataAvailable: in std_logic;
            tl_in_newData: in std_logic_vector(15 downto 0);  
            tl_out_ps_sample : out std_logic_vector(15 downto 0);
            tl_out_mf_bit : out std_logic
        );
end COMPONENT;   
    
   --Inputs
       signal clk, dataAvailable : std_logic := '0';
       signal data : std_logic_vector( 15 downto 0);
       signal sampleClk : std_logic;
    
     --Outputs
    signal  psfOutputSample : std_logic_vector(15 downto 0); 
    signal mfBit : std_logic; 

   -- Clock period definitions
   constant clk_period : time := 10ns;		-- 100 MHz
	
	-- Data definitions
	constant bit_time : time := 1.56us;		-- 115,200 baud
	
	
	-- SAMPLE CLOCK
	constant CLOCK_FREQUENCY : integer := 100000000;        
    constant SAMPLE_RATE : integer := 640000; --40000 * 6;
    constant RATE : integer := integer (    real(CLOCK_FREQUENCY / SAMPLE_RATE) );
    constant TICK_CTR_WIDTH : integer := integer(CEIL(LOG2(real(RATE))));
    signal tx_trig_cnt:        unsigned(TICK_CTR_WIDTH-1 downto 0) := (others=>'0');
    
    
    signal unitSampleSent : std_logic := '0'; 
	
	
BEGIN 
	-- Instantiate the Unit Under Test (UUT)
	uut:
	PulseShapingFilter_MatchedFilter
	Port Map(
	    clk => clk,
         tl_in_newDataAvailable => dataAvailable,
        tl_in_newData => data,
        tl_out_ps_sample => psfOutputSample, 
        tl_out_mf_bit => mfBit
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
		wait for 100*clk_period;
		data <= x"7fff";	
        dataAvailable <= '1'; 
        
        
   
        wait for 1 * clk_period; 
        dataAvailable <= '0';
               
       for i in 0 to 100000000 loop
           data <= x"0000"; 
           dataAvailable <= '1' ;
        end loop; 
   end process;
END;
