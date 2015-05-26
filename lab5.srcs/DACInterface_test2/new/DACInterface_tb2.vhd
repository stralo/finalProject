LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.all;
use IEEE.math_real.all;
 
ENTITY DACInterface_tb2 IS
END DACInterface_tb2;
 
ARCHITECTURE behavior OF DACInterface_tb2 IS 

   
    COMPONENT DAC is
        Generic(
            WORD_SIZE : integer := 16
        );
        Port ( 
            clk : in STD_LOGIC;
            dacInterface_in_spiClk : in std_logic;  -- SPI bus clock (from MMCM) 
            -- user interface to the system
            dacInterface_in_word : in std_logic_vector(WORD_SIZE-1 downto 0);    -- word (command + data) to be sent
            dacInterface_in_start : in std_logic;                                -- start conversion
            dacInterface_out_busy : out std_logic;                                -- conversion in progress
            -- interface to the pmod-da2
            dac_out_pmodSync : out std_logic;                                -- active-low sync signal
            dac_out_pmodSerialClk : out std_logic;                                -- serial clock to DAC (spi_sck)
            dac_out_serialDataCh1 : out std_logic                                  -- serial data to the DAC (spi_MOSI)
        );
    end COMPONENT;

    
    
   --Inputs
       signal clk, spiClk, dacBusy : std_logic := '0';
    
     --Outputs
    signal dacStart : std_logic := '0';
    signal dacWord : std_logic_vector(15 downto 0) := (others => '0');

   -- Clock period definitions
   constant clk_period : time := 10ns;		-- 100 MHz
   constant spiClkPeriod : time := 50ns;    -- 20 MHz
	
	-- Data definitions
	constant bit_time : time := 8.68us;		-- 115,200 baud
	constant TxData : std_logic_vector(31 downto 0) := x"4142430d";
	
	
	-- Sine wave definitions : use values appropriate to yiour design
	constant FSAMP : real := 640000.0;   -- sampling rate (Hz)
	constant SIN_FREQ : real := 440.0; -- Hz
	constant SIN_AMPL : real := 2.0 **11 - 1.0;   -- 12 bit signed
	
	constant TSAMP : REAL := 1.0/FSAMP; -- SAMPLING PERIOD
	signal DDS_sin, DDS_cos : std_logic_vector(11 downto 0) := (others => '0'); -- 12 bit source
	
	
	signal rampCount : unsigned(11 downto 0) := (others => '0');
	
BEGIN 
	-- Instantiate the Unit Under Test (UUT)
	uut:
    DAC 
     Port mAP ( 
         clk => clk,
         dacInterface_in_spiClk => spiClk,
         -- user interface to the system
         dacInterface_in_word=> dacWord,
         dacInterface_in_start   =>     dacStart,                         -- start conversion
         dacInterface_out_busy   =>  dacBusy,                        -- conversion in progress
         -- interface to the pmod-da2
         dac_out_pmodSync    => open,                         -- active-low sync signal
         dac_out_pmodSerialClk => open,                              -- serial clock to DAC (spi_sck)
         dac_out_serialDataCh1 =>     open                           -- serial data to the DAC (spi_MOSI)
     );
     
     

   
   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
   
   
   SPIClkGenerator: process
   begin
        spiClk <= '0';
        wait for spiClkPeriod/2; 
        spiClk <= '1';
        wait for spiClkPeriod/2;    
   end process; 

   
   
 
   -- Stimulus process
   stim_proc: process
        variable t : real := 0.0; 
   begin		
		loop 		  
		  -- pack ddscos and ddssin into 16 bit words for sending to the DAC
		  dacWord <= "0000" & std_logic_vector(unsigned(rampCount));
          
          -- assert start signal to initiate conversion
          dacStart <= '1'; 
          
          wait for 1 * clk_period; 
          if dacBusy = '1' then 
            dacStart <= '0';
          end if; 
		  
		  
		  wait for integer(TSAMP * 10.0**9) * 1 ns;
		  rampCount <= rampCount + 1; 		
	   end loop;
   end process;
END;
