LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.all;
use IEEE.math_real.all;
 
ENTITY MatchedFilter_OutBit_tb IS
END MatchedFilter_OutBit_tb;
 
ARCHITECTURE behavior OF MatchedFilter_OutBit_tb IS 
 
 
COMPONENT MatchedFilter is
    Port (  
            clk : in STD_LOGIC;
           mf_in_sample : in STD_LOGIC_vector( 15 downto 0); -- modulated input
           mf_in_sampleClk : in std_logic; 
           mf_out_symbolClk : out std_logic; 
           mf_out_serialBit : out std_logic -- either i or q
           );
end COMPONENT;   
    
   --Inputs
       signal clk : std_logic := '0';
       signal inSample : std_logic_vector( 15 downto 0);
       signal sampleClk : std_logic;
    
     --Outputs
    signal outBit : std_logic_vector(15 downto 0); 
    signal bitVal, symbolClk :std_logic; 

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
	MatchedFilter
	Port Map(
	    clk => clk,
        mf_in_sample => inSample,
        mf_in_sampleClk => sampleClk,
        mf_out_symbolClk => symbolClk, 
        mf_out_serialBit => bitVal
    );
    
    
   
   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
   
   
   ClockDivider: -- FOR SAMPLE CLOCK
   process(Clk)
      begin
          if rising_edge(Clk) then
              if tx_trig_cnt = RATE - 1 then 
                  tx_trig_cnt <= (others => '0'); 
                  sampleClk <= '1'; 
              else
                  tx_trig_cnt <= tx_trig_cnt + 1; 
                  sampleClk <= '0';
              end if;
          end if;
   end process;
   
 
   -- Stimulus process
   stim_proc: process
   begin		
--        wait for bit_time;
--        inSample <= x"7fff"; 
        
--        for i in 0 to 128 loop
--            wait for bit_time; 
--            inSample <= x"0000"; 
--        end loop;
               
--		-- Repeat every millisecond
----		wait for 1 ms;
--        wait;
        
        
        
        wait for bit_time;
                
                -- send a +1
                inSample <= x"7fff";
                wait for bit_time; 
                
                -- send 15 0s
                for i in 0 to 15 loop
                    insample <= x"0000"; 
                    wait for bit_time; 
                end loop; 
                
                -- send a -1
                inSample <= x"8000";
                
                wait for bit_time; 
                
                
                for i in 0 to 128 loop
                    insample <= x"0000"; 
                    wait for bit_time; 
                end loop; 
                
                wait;
   end process;
END;
