----------------------------------------------------------------------------------
-- Engineer: Richard Addo & George Boateng
-- 
-- Create Date: 04/05/2015 12:16:56 AM
-- Module Name: CharBufferModule - Behavioral
-- Project Name: ENGS 128 LAB 1
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;
use IEEE.math_real.all;

entity CharBufferModule is
    Port ( buf_mod_in_clk : in STD_LOGIC;
           buf_mod_in_rx_data : in STD_LOGIC_VECTOR (7 downto 0);
           buf_mod_in_rx_done_tick : in STD_LOGIC;
           buf_mod_in_rd_en : in std_logic; 
           buf_mod_in_reset_rd_addr : in std_logic;
           buf_mod_in_flushDone : in std_logic; 
           buf_mod_in_rd_cnt_en : in std_logic;
           buf_mod_out_data : out STD_LOGIC_VECTOR (7 downto 0);   -- character read by the serializer
           buf_mod_out_start_clearing : out STD_LOGIC;   -- informs serializer it's time to pop out and serialize chars
           buf_mod_out_max_rd_addr_reached : out std_logic  -- informs serializer that flushing has to stop       
    );
end CharBufferModule;

architecture Behavioral of CharBufferModule is
    
    constant BUFFER_LEN : integer := 8;
    constant BUF_WIDTH : integer := 8;
    constant ADDR_MSB : integer := integer( CEIL(LOG2(real(BUFFER_LEN))) ) - 1 ; 
	
    
    
    
    COMPONENT BufferController is
        Port ( clk : in STD_LOGIC;
               rx_done_tick : in STD_LOGIC;
               enter_pressed : in STD_LOGIC;
               fsm_in_max_wr_addr_reached : in std_logic; 
               fsm_in_flushingDone : in std_logic; 
               fsm_out_ram_wr_en : out STD_LOGIC;
               fsm_out_wr_counter_en : out STD_LOGIC;
               fsm_out_reset_wr_pointer : out STD_LOGIC;
               fsm_out_startFlushing : out STD_LOGIC;
               fsm_out_clean_mem : out std_logic  -- put nulls in all of the memory (except the first position)
               );
    end COMPONENT;
	
    
    
    COMPONENT BufferAddrCounter is
        generic(BUF_LEN : integer;
                ADDR_MSB : integer;
                FOR_READING : std_logic   -- does this counter point to the write addr or read addr? write = '0', read = '1'
        );
        Port ( clk : in STD_LOGIC;
               ctr_in_en : in STD_LOGIC;    
               reset : in STD_LOGIC;
               ctr_out_addr : out STD_LOGIC_VECTOR (ADDR_MSB downto 0); 
               ctr_out_max_reached : out std_logic 
        );
    end COMPONENT;

    
    COMPONENT BufControllerEOLListener
    Port ( listener_in_rx_data : in STD_LOGIC_VECTOR (7 downto 0);
               listener_out_is_lf : out STD_LOGIC);
    END COMPONENT;  
    
    
    COMPONENT FifoBuffer
    generic(BUF_LEN : integer;
                ADDR_MSB : integer
        );
     Port ( 
              buf_clk : in STD_LOGIC; 
              buf_in_data : in STD_LOGIC_VECTOR (BUF_WIDTH-1 downto 0);
              buf_in_wr_en : in STD_LOGIC;
              buf_in_rd_en : in STD_LOGIC; 
              buf_in_wr_addr : in STD_LOGIC_VECTOR (ADDR_MSB downto 0); 
              buf_in_rd_addr : in std_logic_vector (ADDR_MSB downto 0);
              buf_out_data : out STD_LOGIC_VECTOR (7 downto 0);
              buf_in_reset : in STD_LOGIC
              );
    END COMPONENT; 
    
    COMPONENT NullReadListener
    Port ( null_listener_in_data : in STD_LOGIC_VECTOR (7 downto 0);
               null_listener_out_null_read : out STD_LOGIC);
    END COMPONENT; 
    
    
    
--    constant BUF_LEN : integer := 8; 
--    constant BUF_WIDTH : integer := 8;
    constant MSB : integer := BUF_WIDTH - 1;
    
    -- signals
    signal rx_data : std_logic_vector(MSB downto 0); 
    signal tx_data : std_logic_vector (MSB downto 0);
    signal lf_detected , null_detected: std_logic; 
    signal max_wr_addr_reached, max_rd_addr_reached : std_logic; 
    signal wr_en :std_logic;
    signal rd_en : std_logic;
    signal wr_cnt_en, rd_cnt_en : std_logic; 
    signal reset_wr_pointer, reset_rd_pointer : std_logic;
    signal wr_addr, rd_addr : std_logic_vector(addr_msb downto 0); 
    signal data_from_buf : std_logic_vector (MSB downto 0); 
    signal clear_mem : std_logic; 
    signal reading :std_logic; 
	
	

begin

    buf_mod_out_data <= data_from_buf; 
    rx_data <= buf_mod_in_rx_data; 
           
    Controller: 
    BufferController PORT MAP(
		clk => buf_mod_in_clk, 
        rx_done_tick => buf_mod_in_rx_done_tick, 
        enter_pressed => lf_detected,
        fsm_in_max_wr_addr_reached => max_wr_addr_reached,
        fsm_in_flushingDone => buf_mod_in_flushDone,
        fsm_out_ram_wr_en => wr_en, 
        fsm_out_wr_counter_en => wr_cnt_en, 
        fsm_out_startFlushing => buf_mod_out_start_clearing,
        fsm_out_reset_wr_pointer => reset_wr_pointer,
        fsm_out_clean_mem => clear_mem
    );
   

		  
    WriteAddrCounter:
    BufferAddrCounter 
    generic MAP(BUF_LEN => BUFFER_LEN, 
        ADDR_MSB => ADDR_MSB,
        FOR_READING => '0')
    PORT MAP(
        clk => buf_mod_in_clk,
        ctr_in_en => wr_cnt_en, 
        reset => reset_wr_pointer,
        ctr_out_addr => wr_addr, 
        ctr_out_max_reached => max_wr_addr_reached
    );
    
    ReadAddrCounter:
    BufferAddrCounter 
    generic MAP(BUF_LEN => BUFFER_LEN, 
        ADDR_MSB => ADDR_MSB,
        FOR_READING => '1')
    PORT MAP(
        clk => buf_mod_in_clk,
        ctr_in_en =>  buf_mod_in_rd_cnt_en, 
        reset => buf_mod_in_reset_rd_addr,
        ctr_out_addr => rd_addr,   -- goes to the ram 
        ctr_out_max_reached =>  buf_mod_out_max_rd_addr_reached
    );
    
    
    LFListener:
    BufControllerEOLListener PORT MAP(
        listener_in_rx_data => rx_data,
        listener_out_is_lf => lf_detected
    );
    
    RAM:
    FifoBuffer 
    generic MAP(BUF_LEN => BUFFER_LEN,
                    ADDR_MSB => ADDR_MSB
            )
    PORT MAP(
        buf_clk => buf_mod_in_clk, 
        buf_in_data => rx_data,
        buf_in_wr_en => wr_en, 
        buf_in_rd_en => buf_mod_in_rd_en, 
        buf_in_wr_addr => wr_addr, 
        buf_in_rd_addr => rd_addr,
        buf_out_data => data_from_buf, 
        buf_in_reset => clear_mem
    );
    
    NULReadListener:
    NullReadListener PORT MAP(
        null_listener_in_data => data_from_buf, 
        null_listener_out_null_read => null_detected
    );
    
end Behavioral;
