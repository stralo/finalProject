----------------------------------------------------------------------------------
-- Engineer: Richard Addo & George Boateng
-- 
-- Create Date: 04/05/2015 12:16:56 AM
-- Module Name: BufferController - Behavioral
-- Project Name: ENGS 128 LAB 1
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;
use ieee.math_real.all;


entity BufferController is
    Port ( clk : in STD_LOGIC;
           rx_done_tick : in STD_LOGIC;
           enter_pressed : in STD_LOGIC;
           fsm_in_max_wr_addr_reached : in std_logic; 
           fsm_in_flushingDone : in std_logic; 
           fsm_out_ram_wr_en : out STD_LOGIC;
           fsm_out_wr_counter_en : out STD_LOGIC;
           fsm_out_reset_wr_pointer : out STD_LOGIC;
           fsm_out_startFlushing : out STD_LOGIC;
           fsm_out_clean_mem : out std_logic
           );
end BufferController;

architecture Behavioral of BufferController is
    type state_type is( booting_up, idle, writing_char, updating_wr_addr, check_if_can_wr_more, startingFlush, waitingForFlushComplete);
    signal current_state, next_state : state_type := booting_up;

    
     -- SETUP RATE FOR CLOCK DIVIDER THAT TRIGGERS TX_START
    constant CLOCK_FREQUENCY : integer := 100000000;		
    constant BAUD_RATE : integer := 115200;
    constant RATE : integer := integer (    real(CLOCK_FREQUENCY / BAUD_RATE)  *  real( 8 * 1.5 ) );
    constant TICK_CTR_WIDTH : integer := integer(CEIL(LOG2(real(RATE))));
    signal tx_trig_cnt:        unsigned(TICK_CTR_WIDTH-1 downto 0) := (others=>'0');
    signal tx_trigger : std_logic ; --:= '0';

begin

    -- state register. only stores the state of the fsm 
    StateRegister: 
    process(clk)
    begin
        if rising_edge(clk) then 
            current_state <= next_state;
        end if;
    end process;
    

    NextStateLogic: 
    process(current_state, rx_done_tick, enter_pressed, fsm_in_max_wr_addr_reached, fsm_in_flushingDone)
    begin
        -- defaults
        next_state <= current_state; 
        fsm_out_ram_wr_en <= '0'; 
        fsm_out_wr_counter_en <= '0'; 
        fsm_out_reset_wr_pointer <= '0'; 
        fsm_out_startFlushing <= '0';
        fsm_out_clean_mem <= '0';
        
        case current_state is
            when booting_up =>
                fsm_out_clean_mem <= '1';
                fsm_out_reset_wr_pointer <= '1';  
                next_state <= idle; 
                
            when idle =>
                -- for a regular character, just write it
                if (rx_done_tick = '1')then 
                    next_state <= writing_char; 
                end if; 
                
            when writing_char =>
                fsm_out_ram_wr_en <= '1'; 
                if enter_pressed = '1' then 
                    next_state <= startingFlush; 
                else
                    next_state <= updating_wr_addr;
                end if; 
            
            when updating_wr_addr =>
                fsm_out_wr_counter_en <= '1'; 
                next_state <= check_if_can_wr_more; 
                
            when check_if_can_wr_more =>
                if  fsm_in_max_wr_addr_reached = '1' then 
                    next_state <= startingFlush;
                else
                    next_State <= idle; 
                end if; 
               
         
            when startingFlush =>    
                fsm_out_startFlushing <= '1';
                next_state <= waitingForFlushComplete;
                
            when waitingForFlushComplete =>
                if (fsm_in_flushingDone = '1') then 
                    fsm_out_reset_wr_pointer <= '1'; 
                    fsm_out_clean_mem <= '1';
                    next_state <= idle; 
                end if; 
                    
               
            when others =>
                next_state <= idle;
        end case;
    end process;


end Behavioral;
