LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.all;
use IEEE.math_real.all;
 
ENTITY PulseShaper_tb IS
END PulseShaper_tb;
 
ARCHITECTURE behavior OF PulseShaper_tb IS 
 
COMPONENT PulseShaper is
    Port ( clk : in STD_LOGIC;
        ps_in_newDataAvailable : in std_logic; -- drive by symbolClk 
        ps_in_data: in std_logic_vector( 15 downto 0);
        ps_out_readyForData : out std_logic; 
        ps_out_sampleAvailable : out std_logic; -- this is sampleClk
        ps_out_sample : out std_logic_vector(15 downto 0)  -- sample for the matched filter 
   );
        
end COMPONENT;   
    
   --Inputs
       signal clk, dataAvailable : std_logic := '0';
       signal inData : std_logic_vector( 15 downto 0);
       
    
     --Outputs
    signal sample : std_logic_vector(15 downto 0); 
    signal sampleClk, readyforData : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10ns;		-- 100 MHz
	
	-- Data definitions
	constant bit_time : time := 1.56us;		-- 115,200 baud
	
	
	constant CLOCK_FREQUENCY : integer := 100000000;        
    constant SYMBOL_RATE : integer := 40000;
    constant RATE : integer := integer (    real(CLOCK_FREQUENCY / SYMBOL_RATE) );
    constant TICK_CTR_WIDTH : integer := integer(CEIL(LOG2(real(RATE))));
    signal tx_trig_cnt:        unsigned(TICK_CTR_WIDTH-1 downto 0) := (others=>'0');
    signal symbolClk : std_logic;
	

BEGIN 
	-- Instantiate the Unit Under Test (UUT)
	uut:
	PulseShaper
	Port Map(
	    clk => clk,
	    ps_in_newDataAvailable => dataAvailable,
        ps_in_data => inData, 
        ps_out_readyForData => readyForData,
        ps_out_sampleAvailable => sampleClk,
        ps_out_sample => sample
        
    );
   
   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
   
   
   
   ClockDivider:
   process(Clk)
      begin
          if rising_edge(Clk) then
              if tx_trig_cnt = RATE - 1 then 
                  tx_trig_cnt <= (others => '0'); 
                  symbolClk <= '1'; 
              else
                  tx_trig_cnt <= tx_trig_cnt + 1; 
                  symbolClk <= '0';
              end if;
          end if;
   end process;
   
   
 
   -- Stimulus process
   stim_proc: process
   begin		
        wait for 100 * clk_period; 
        inData <= x"7fff"; 
        dataAvailable <= '1'; 
	   
	   wait for 1 * clk_period;
	   dataAvailable <= '0';
	   
	   for i in 0 to 100000000 loop
           inData <= x"0000"; 
           dataAvailable <= '1' ;
        end loop; 
	          
	           

        wait;
   end process;
END;
