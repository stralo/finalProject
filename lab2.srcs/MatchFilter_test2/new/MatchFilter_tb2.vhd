LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.all;
use IEEE.math_real.all;
 
ENTITY MatchFilter_tb2 IS
END MatchFilter_tb2;
 
ARCHITECTURE behavior OF MatchFilter_tb2 IS 
 
 
COMPONENT MatchedFilter is
    Port (  
            clk : in STD_LOGIC;
           mf_in_sample : in STD_LOGIC_vector( 15 downto 0);
           mf_in_sampleClk : in std_logic; 
           mf_in_symbolClk : in std_logic;
           mf_out_serialBit : out std_logic -- either i or q
           );
end COMPONENT;   
    
   --Inputs
       signal clk : std_logic := '0';
       signal inSample : std_logic_vector( 15 downto 0);
       signal sampleClk, symbolClk : std_logic;
    
     --Outputs
    signal outBit : std_logic; 

   -- Clock period definitions
   constant clk_period : time := 10ns;		-- 100 MHz
	
	-- Data definitions
	constant bit_time : time := 1.56us;		-- 115,200 baud
	
	
	-- SAMPLE CLOCK
	constant CLOCK_FREQUENCY : integer := 100000000;        
    constant SAMPLE_RATE : integer := 640000; --40000 * 6;
    constant SAMPLE_COUNT_LIMIT : integer := integer (    real(CLOCK_FREQUENCY / SAMPLE_RATE) );
    constant SAMPLE_COUNT_WIDTH : integer := integer(CEIL(LOG2(real(SAMPLE_COUNT_LIMIT))));
    signal COUNT_FOR_SAMPLECLK:        unsigned(SAMPLE_COUNT_WIDTH-1 downto 0) := (others=>'0');
    
    
    -- SYMBOL CLOCK
    constant SYMBOL_RATE : integer := 40000;
    constant SYMBOL_COUNT_LIMIT : integer := integer (    real(CLOCK_FREQUENCY / SYMBOL_RATE) );
    constant SYMBOL_COUNT_WIDTH : integer := integer(CEIL(LOG2(real(SYMBOL_COUNT_LIMIT))));
    signal COUNT_FOR_SYMBOLCLK:        unsigned(SYMBOL_COUNT_WIDTH-1 downto 0) := (others=>'0');
    
    
    	
	
BEGIN 
	-- Instantiate the Unit Under Test (UUT)
	uut:
	MatchedFilter
	Port Map(
	    clk => clk,
        mf_in_sample => inSample,
        mf_in_sampleClk => sampleClk,
        mf_in_symbolClk => symbolClk,
        mf_out_serialBit => outBit
    );
   
   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
   
   
   ClockDivider_SAMPLECLK: -- FOR SAMPLE CLOCK
   process(Clk)
      begin
          if rising_edge(Clk) then
              if COUNT_FOR_SAMPLECLK = SAMPLE_COUNT_LIMIT - 1 then 
                  COUNT_FOR_SAMPLECLK <= (others => '0'); 
                  sampleClk <= '1'; 
              else
                  COUNT_FOR_SAMPLECLK <= COUNT_FOR_SAMPLECLK + 1; 
                  sampleClk <= '0';
              end if;
          end if;
   end process;
   
   
   
   ClockDivider_SYMBOLCLK:  -- FOR SYMBOL CLOCK
   process(Clk)
      begin
          if rising_edge(Clk) then
              if COUNT_FOR_SYMBOLCLK = SYMBOL_COUNT_LIMIT - 1 then 
                  COUNT_FOR_SYMBOLCLK <= (others => '0'); 
                  symbolClk <= '1'; 
              else
                  COUNT_FOR_SYMBOLCLK <= COUNT_FOR_SYMBOLCLK + 1; 
                  symbolClk <= '0';
              end if;
          end if;
   end process;
   
 
   -- Stimulus process
   stim_proc: process
   begin		
        wait for bit_time;
        inSample <= x"7fff"; 
        wait for bit_time; 
        
        for i in 0 to 15 loop
            inSample <= x"0000"; 
            wait for bit_time;
        end loop;
        
        inSample <= x"8000";
        wait for bit_time; 
        
        for i in 0 to 15 loop
            inSample <= x"0000"; 
            wait for bit_time;
        end loop;
        
        inSample <= x"7fff";
        wait for bit_time; 
        
        
        for i in 0 to 15 loop
            inSample <= x"0000"; 
            wait for bit_time;
        end loop;
        
        inSample <= x"7fff";
        wait for bit_time; 
        
        for i in 0 to 15 loop
            inSample <= x"0000"; 
            wait for bit_time;
        end loop;
        
        
        inSample <= x"8000";
        wait for bit_time; 
        
        for i in 0 to 15 loop
            inSample <= x"0000"; 
            wait for bit_time;
        end loop;
        
        
        
        
        
        
        
        for i in 0 to 128 loop
            insample <= x"0000"; 
            wait for bit_time; 
        end loop;
               
        wait;
   end process;
END;
