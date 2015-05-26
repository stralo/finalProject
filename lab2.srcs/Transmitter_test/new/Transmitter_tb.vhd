LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.all;
use IEEE.math_real.all;
 
ENTITY Transmitter_tb IS
END Transmitter_tb;
 
ARCHITECTURE behavior OF Transmitter_tb IS 
 
COMPONENT ModemTx is
    Port ( clk : in STD_LOGIC;
        RsRx  : in  STD_LOGIC;
        seg : out STD_LOGIC_VECTOR(0 to 6);
        an : out STD_LOGIC_VECTOR(3 downto 0);
        modemTx_out_serialI : out std_logic;
        modemTx_out_serialQ : out std_logic;
        modemTx_in_rotate : in std_logic_vector(1 downto 0);
        modemTx_in_symbolClk : in std_logic
    );
end COMPONENT;
    
   --Inputs
   signal clk : std_logic := '0';
   signal RsRx : std_logic := '1';
   signal rotate : std_logic_vector(1 downto 0) := "00";
   signal tx_trigger : std_logic ;

 	--Outputs
   signal serialI, serialQ: std_logic;
   signal seg: STD_LOGIC_VECTOR(0 to 6);
   signal an: STD_LOGIC_VECTOR(3 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10ns;		-- 100 MHz
	
	-- Data definitions
	constant bit_time : time := 8.68us;		-- 115,200 baud
	constant TxData : std_logic_vector(31 downto 0) := x"4142430d";
	
	
	
	
	
	-- symbol clock
	constant CLOCK_FREQUENCY : integer := 100000000;		
    constant BAUD_RATE : integer := 115200;
    constant RATE : integer := integer (    real(CLOCK_FREQUENCY / 50000) );
    constant TICK_CTR_WIDTH : integer := integer(CEIL(LOG2(real(RATE))));
    signal tx_trig_cnt:        unsigned(TICK_CTR_WIDTH-1 downto 0) := (others=>'0');
	
BEGIN 
	-- Instantiate the Unit Under Test (UUT)
   uut: 
   ModemTx 
   PORT MAP (
          clk => clk,
          RsRx => RsRx,
          modemTx_out_serialI => serialI,
          modemTx_out_serialQ => serialQ,
          seg => seg,
          an => an,
          modemTx_in_rotate => rotate,
          modemTx_in_symbolClk => tx_trigger
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
                   tx_trigger <= '1'; 
               else
                   tx_trig_cnt <= tx_trig_cnt + 1; 
                   tx_trigger <= '0';
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
