
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity MyFIR_tb is
end MyFIR_tb;

architecture tb of MyFIR_tb is

  -----------------------------------------------------------------------
  -- Timing constants
  -----------------------------------------------------------------------
  constant CLOCK_PERIOD : time := 100 ns;
  constant T_HOLD       : time := 10 ns;
  constant T_STROBE     : time := CLOCK_PERIOD - (1 ns);

  -----------------------------------------------------------------------
  -- DUT signals
  -----------------------------------------------------------------------

  -- General signals
  signal aclk                            : std_logic := '0';  -- the master clock

  -- Data slave channel signals
  signal s_axis_data_tvalid              : std_logic := '0';  -- payload is valid
  signal s_axis_data_tready              : std_logic := '1';  -- slave is ready
  signal s_axis_data_tdata               : std_logic_vector(15 downto 0) := (others => '0');  -- data payload

  -- Data master channel signals
  signal m_axis_data_tvalid              : std_logic := '0';  -- payload is valid
  signal m_axis_data_tdata               : std_logic_vector(31 downto 0) := (others => '0');  -- data payload

  -----------------------------------------------------------------------
  -- Aliases for AXI channel TDATA and TUSER fields
  -- These are a convenience for viewing data in a simulator waveform viewer.
  -- If using ModelSim or Questa, add "-voptargs=+acc=n" to the vsim command
  -- to prevent the simulator optimizing away these signals.
  -----------------------------------------------------------------------

  -- Data slave channel alias signals
  signal s_axis_data_tdata_data        : std_logic_vector(15 downto 0) := (others => '0');

  -- Data master channel alias signals
  signal m_axis_data_tdata_data        : std_logic_vector(29 downto 0) := (others => '0');
  
  
  signal binIdx27, binIdx26, binIdx25, binIdx28, binIdx29, binIdx30 : std_logic_vector(15 downto 0) := (others => '0');


begin

  -----------------------------------------------------------------------
  -- Instantiate the DUT
  -----------------------------------------------------------------------

  dut : entity work.fir_compiler_0
    port map (
      aclk                            => aclk,
      s_axis_data_tvalid              => s_axis_data_tvalid,
      s_axis_data_tready              => s_axis_data_tready,
      s_axis_data_tdata               => s_axis_data_tdata,
      m_axis_data_tvalid              => m_axis_data_tvalid,
      m_axis_data_tdata               => m_axis_data_tdata
      );

  -----------------------------------------------------------------------
  -- Generate clock
  -----------------------------------------------------------------------

  clock_gen : process
  begin
    aclk <= '0';
    wait for CLOCK_PERIOD;
    loop
      aclk <= '0';
      wait for CLOCK_PERIOD/2;
      aclk <= '1';
      wait for CLOCK_PERIOD/2;
    end loop;
  end process clock_gen;

  -----------------------------------------------------------------------
  -- Generate inputs
  -----------------------------------------------------------------------

  stimuli : process

    -- Procedure to drive a number of input samples with specific data
    -- data is the data value to drive on the tdata signal
    -- samples is the number of zero-data input samples to drive
    procedure drive_data ( data    : std_logic_vector(15 downto 0);
                           samples : natural := 1 ) is
      variable ip_count : integer := 0;
    begin
      ip_count := 0;
      loop
        s_axis_data_tvalid <= '1';
        s_axis_data_tdata  <= data;
        loop
          wait until rising_edge(aclk);
          exit when s_axis_data_tready = '1';
        end loop;
        ip_count := ip_count + 1;
        wait for T_HOLD;
      -- Input rate is 1 input each 2500 clock cycles: drive valid inputs at this rate
        s_axis_data_tvalid <= '0';
        wait for CLOCK_PERIOD * 2499;
        exit when ip_count >= samples;
      end loop;
    end procedure drive_data;

    -- Procedure to drive a number of zero-data input samples
    -- samples is the number of zero-data input samples to drive
    procedure drive_zeros ( samples : natural := 1 ) is
    begin
      drive_data((others => '0'), samples);
    end procedure drive_zeros;

    -- Procedure to drive an impulse and let the impulse response emerge on the data master channel
    -- samples is the number of input samples to drive; default is enough for impulse response output to emerge
    procedure drive_impulse ( samples : natural := 165 ) is
      variable impulse : std_logic_vector(15 downto 0);
    begin
      impulse := (others => '0');  -- initialize unused bits to zero
      impulse(15 downto 0) := x"7fff";--"0100000000000000";
      drive_data(impulse);
      if samples > 1 then
        drive_zeros(samples-1);
      end if;
    end procedure drive_impulse;

  begin

    -- Drive inputs T_HOLD time after rising edge of clock
    wait until rising_edge(aclk);
    wait for T_HOLD;

    -- Drive a single impulse and let the impulse response emerge
    drive_impulse;

    -- Drive another impulse, during which demonstrate use and effect of AXI handshaking signals
    drive_impulse(2);  -- start of impulse; data is now zero
    s_axis_data_tvalid <= '0';
    wait for CLOCK_PERIOD * 12500;  -- provide no data for 5 input samples worth
    drive_zeros(2);  -- 2 normal input samples
    s_axis_data_tvalid <= '1';
    wait for CLOCK_PERIOD * 12500;  -- provide data as fast as the core can accept it for 5 input samples worth
    drive_zeros(156);  -- back to normal operation

    -- End of test
    report "Not a real failure. Simulation finished successfully. Test completed successfully" severity failure;
    wait;

  end process stimuli;

  -----------------------------------------------------------------------
  -- Check outputs
  -----------------------------------------------------------------------

  check_outputs : process
    variable check_ok : boolean := true;
  begin

    -- Check outputs T_STROBE time after rising edge of clock
    wait until rising_edge(aclk);
    wait for T_STROBE;

    -- Do not check the output payload values, as this requires the behavioral model
    -- which would make this demonstration testbench unwieldy.
    -- Instead, check the protocol of the master DATA channel:
    -- check that the payload is valid (not X) when TVALID is high

    if m_axis_data_tvalid = '1' then
      if is_x(m_axis_data_tdata) then
        report "ERROR: m_axis_data_tdata is invalid when m_axis_data_tvalid is high" severity error;
        check_ok := false;
      end if;

    end if;

    assert check_ok
      report "ERROR: terminating test with failures." severity failure;

  end process check_outputs;

  -----------------------------------------------------------------------
  -- Assign TDATA / TUSER fields to aliases, for easy simulator waveform viewing
  -----------------------------------------------------------------------

  -- Data slave channel alias signals
  s_axis_data_tdata_data        <= s_axis_data_tdata(15 downto 0);

  -- Data master channel alias signals: update these only when they are valid
  m_axis_data_tdata_data        <= m_axis_data_tdata(29 downto 0) when m_axis_data_tvalid = '1';
  
  binIdx25        <= m_axis_data_tdata(26) & m_axis_data_tdata(24  downto 24-15+1) when m_axis_data_tvalid = '1';
  binIdx26        <= m_axis_data_tdata(27) & m_axis_data_tdata(25  downto 25-15+1) when m_axis_data_tvalid = '1';
  binIdx27        <= m_axis_data_tdata(28) & m_axis_data_tdata(26  downto 26-15+1) when m_axis_data_tvalid = '1';
  binIdx28        <= m_axis_data_tdata(29) & m_axis_data_tdata(27  downto 27-15+1) when m_axis_data_tvalid = '1';
  binIdx29        <= m_axis_data_tdata(30) & m_axis_data_tdata(28  downto 28-15+1) when m_axis_data_tvalid = '1';
  binIdx30        <= m_axis_data_tdata(31) & m_axis_data_tdata(29  downto 29-15+1) when m_axis_data_tvalid = '1';

end tb;
