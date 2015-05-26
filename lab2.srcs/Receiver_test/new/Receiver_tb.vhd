LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.all;
use IEEE.math_real.all;
 
ENTITY Receiver_tb IS
END Receiver_tb;
 
ARCHITECTURE behavior OF Receiver_tb IS 
 
COMPONENT ModemRx is
    Port ( clk : in STD_LOGIC;
        modemRx_in_serialI : in std_logic;
        modemRx_in_serialQ : in std_logic;
        modemRx_out_tx : out std_logic;
        modemRx_in_symbolClk : in std_logic
    );
end COMPONENT;
    
   --Inputs
   signal clk : std_logic := '0';
   signal symbolClk : std_logic ;
   signal serialI, serialQ: std_logic;

 	--Outputs
    signal tx : std_logic; 
  
   -- Clock period definitions
   constant clk_period : time := 10ns;		-- 100 MHz
	
	-- Data definitions
	constant bit_time : time := 8.68us;		-- 115,200 baud
	constant TxData : std_logic_vector(31 downto 0) := x"4142430d";
	
	
	
	
	
	-- symbol clock
	constant CLOCK_FREQUENCY : integer := 100000000;		
    constant BAUD_RATE : integer := 115200;
    constant RATE : integer := integer (    real(CLOCK_FREQUENCY / BAUD_RATE)  *  real( 8 * 1.5 ) );
    constant TICK_CTR_WIDTH : integer := integer(CEIL(LOG2(real(RATE))));
    signal tx_trig_cnt:        unsigned(TICK_CTR_WIDTH-1 downto 0) := (others=>'0');
	
BEGIN 
	-- Instantiate the Unit Under Test (UUT)
   uut: 
   ModemRx 
   PORT MAP (
          clk => clk,
          modemRx_in_serialI => serialI,
          modemRx_in_serialQ => serialQ,
          modemRx_in_symbolClk => symbolClk,
          modemRx_out_tx => tx
        );
       

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
   
   
   SymbolClk:
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
		wait for 1 ms;
   end process;
END;
