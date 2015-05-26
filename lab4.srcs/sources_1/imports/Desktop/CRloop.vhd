----------------------------------------------------------------------------------
-- Company:         Engs 128 15S
-- Engineer:        E.W. Hansen
-- 
-- Create Date:     04/30/2015
-- Design Name:     QPSK receiver
-- Module Name:     CRloop
-- Project Name:    
-- Target Devices:  Artix-7 
-- Tool Versions:   Vivado 2014.4
-- Description:     Skeleton carrier recovery loop for QPSK receiver.  
-- 
-- Dependencies:     
-- 
-- Revision:
-- Revision 1.0 - File Created
--  Loop filter coefficients are small, so output is not truncated, but sent to a 
--  32-bit phase accumulator.  Then, the phase accumulator is truncated before 
--  sending to the sine-cosine LUT.
--
-- Additional Comments:
-- 
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.MATH_REAL.ALL;     -- for digital filter coefficients

entity CRloop is
    generic( WIDTH : positive := 16 );
    Port ( clk : in STD_LOGIC;
           sample_clk : in STD_LOGIC;
--           strobe : in STD_LOGIC;                                     -- strobe is currently internal
           xI, xQ : in STD_LOGIC_VECTOR (WIDTH-1 downto 0);             -- from matched filters
           yI_out, yQ_out : out STD_LOGIC_VECTOR (WIDTH-1 downto 0) );  -- rotator output, to detectors
end CRloop;

architecture Behavioral of CRloop is
    -- Phase error detector  
    signal muxI, muxQ : signed (WIDTH-1 downto 0) := (others => '0');
    signal PE_count: unsigned(3 downto 0) := x"0";
    signal PE_strobe: std_logic;
    signal phase_error: signed(WIDTH-1 downto 0) := (others => '0');
    constant PE_STROBE_SYNC : integer := 1;
    
    -- Loop filter 
    -- Carrier (phase) recovery loop coefficients, per M. Rice    
    -- Specify filter coefficients as reals, and let the VHDL compiler convert 
    -- to fixed point.  Multiplying nominal values by 2, 4, or 8 
    -- raises the loop gain and gives better convergence, but of course, if we 
    -- push it too high the loop goes unstable.
    -- Phase accumulator is part of the loop filter.
    constant K1p: real := 4 * 0.0083;          
    constant K2p: real := 4 * 6.8869e-5; 
    constant b1p : signed(WIDTH-1 downto 0) := to_signed(integer(2.0**(WIDTH-1) * K1p), WIDTH);
    constant b2p : signed(WIDTH-1 downto 0) := to_signed(integer(2.0**(WIDTH-1) * K2p), WIDTH);
    signal x_ploop : signed(2*WIDTH-1 downto 0) := (others => '0');
    signal ph_accum: signed(2*WIDTH-1 downto 0) := (others => '0');
    signal x1_ploop, x2_ploop, y_ploop : signed(2*WIDTH-1 downto 0) := (others => '0'); 
 
     -- Phase rotator
    signal yI, yQ: signed(2*WIDTH-1 downto 0) := (others => '0');

    -- Sine/cosine LUT 
    signal lut_phase_in : std_logic_vector(15 downto 0) := (others=>'0');    
    signal sincoslut_out: std_logic_vector(31 downto 0);
    signal sincoslut_strobe: std_logic;
    signal CRcos, CRsin: signed(WIDTH-1 downto 0) := (others => '0');
      
    component dds_compiler_1 IS
      PORT (
        aclk : IN STD_LOGIC;
        s_axis_phase_tvalid : IN STD_LOGIC;
        s_axis_phase_tdata : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
        m_axis_data_tvalid : OUT STD_LOGIC;
        m_axis_data_tdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0) );
    END component;
    
begin

-- Phase error detector
-- Multiplication by sgn() implemented with a mux
PED: process(clk)    
begin
    if rising_edge(clk) then
        if yI(2*WIDTH-1) = '0' then                 -- sgn(yI)
            muxQ <= yQ(2*WIDTH-2 downto WIDTH-1);
        else
            muxQ <= -yQ(2*WIDTH-2 downto WIDTH-1);
        end if;
        
        if yQ(2*WIDTH-1) = '0' then                 -- sgn(yQ)          
            muxI <= yI(2*WIDTH-2 downto WIDTH-1);
        else
            muxI <= -yI(2*WIDTH-2 downto WIDTH-1);
        end if;
    end if;
end process;

-- Eventually, use the strobe signal from the symbol timing loop
--PE_strobe <= strobe;

-- For now, divide sample_clk down to make a strobe signal (like symbol_clk, but wider)
-- Sample at the peaks of the symbols; for now, know where those peaks are occurring.
PE_strobe <= '1' when PE_count = PE_STROBE_SYNC else '0';   
PEsample_ctr: process(clk)
begin
    if rising_edge(clk) then
        if sample_clk = '1' then
            PE_count <= PE_count+1;
        end if;
    end if;
end process;

-- Phase error signal is a train of pulses pulse as wide as sample_clk, in sync with PE_strobe,  
-- pulses separated by 15 zero samples.
PEupdate: process(clk)
begin
    if rising_edge(clk) then
        if sample_clk = '1' then        
            if PE_strobe = '1' then
                phase_error <= muxQ - muxI;
            else
                phase_error <= (others => '0');
            end if;
        end if;
    end if;
end process;

-------------------------------------------------------------------------------------------
-- HERE IS WHERE STUDENT WORK BEGINS

-- Phase error loop filter and phase accumulator
-- Filter phase_error and pass result to phase accumulator for the sine/cosine LUT.   
-- The loop filter coefficients are small, and truncating the products from 32 bits to 
-- 16 bits effectively throws away the effect of the integrator.  Instead, accumulate 
-- all 32 bits and then truncate the contents of the accumulator before going into the LUT.  
PEloopfilter: process(clk)
begin
    if rising_edge(clk) then
        -- pipeline registers
        x1_ploop <= b1p * phase_error;
        x2_ploop <=  y_ploop + b2p * phase_error;
        if sample_clk = '1' then        -- filter updates at sample rate
            y_ploop <= x2_ploop; 
            ph_accum <= ph_accum + x1_ploop + x2_ploop; 
        end if;
    end if;
end process;

lut_phase_in <= std_logic_vector(ph_accum(27 downto 12 ));-- truncated ph_accum, formatted for LUT input

SinCosLUT: dds_compiler_1 
    port map(
        aclk => clk,
        s_axis_phase_tvalid => '1',
        s_axis_phase_tdata => lut_phase_in,
        m_axis_data_tvalid => sincoslut_strobe,
        m_axis_data_tdata => sincoslut_out );


-- Separate sine and cosine out of LUT output (like DDS)
SinCos: process(clk)
begin
    if rising_edge(clk) then
        if sincoslut_strobe = '1' then 
            CRcos <= signed(sincoslut_out(15 downto 0)); 
            CRsin <= signed(sincoslut_out(31 downto 16)); 
        else
            CRcos <= (others => '0');
            CRsin <= (others => '0'); 
        end if; 
    end if;
end process;
   
   
   
-- Rotate the matched filter outputs to correct the carrier phase error
CCWrotation: process(clk)
begin
    if rising_edge(clk) then
        if sample_clk = '1' then        
            yI <= (signed(xI) * CRcos) + (signed(xQ) * CRsin); 
            yQ <= (-signed(xI) * CRsin) + (signed(xQ) * CRcos); 
            yI_out <= std_logic_vector(yI(26 downto 26-15) );   
            yQ_out <= std_logic_vector(yQ(26 downto 26-15) );
        end if;
    end if;
end process;

end Behavioral;
