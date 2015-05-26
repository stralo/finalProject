----------------------------------------------------------------------------------
-- Engineer: Richard Addo & George Boateng
-- Create Date: 04/30/2015 12:53:07 AM
-- Module Name: Demodulator - Behavioral
-- Description: 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.math_real.all; 
use IEEE.numeric_std.all; 

entity Demodulator is
    Port ( clk : in STD_LOGIC;
           demod_in_sampleClk : in std_logic; 
           demod_in_qpskSignal : in STD_LOGIC_VECTOR (11 downto 0);
           demod_out_iSample : out STD_LOGIC_VECTOR (15 downto 0);
           demod_out_qSample : out STD_LOGIC_VECTOR (15 downto 0));
end Demodulator;

architecture Behavioral of Demodulator is

    signal waveCount : integer range 0 to 4  := 0;   
    signal negSine, cosine : signed(15 downto 0); 

    
    -- clock generation for waves
    constant CLOCK_FREQUENCY : integer := 100000000;        
    constant WAVE_RATE : integer := 40000 * 16;
    constant RATE : integer := integer (    real(CLOCK_FREQUENCY / WAVE_RATE) );
    constant TICK_CTR_WIDTH : integer := integer(CEIL(LOG2(real(RATE))));
    signal wave_clk_cnt:        unsigned(TICK_CTR_WIDTH-1 downto 0) := (others=>'0');
    signal waveClk : std_logic := '0';

     signal rawI, rawQ :  signed( 12 downto 0) := (others=>'0');  
    
begin


process(clk)
begin
    if rising_edge(clk) then 
        if demod_in_sampleClk = '1' then 
            case waveCount is
                when 0 =>
                    rawI <= resize( signed(demod_in_qpskSignal), rawI'length); 
                    rawQ <= (others => '0');
                when 1 =>
                    rawI <= (others => '0');
                    rawQ <=  resize( -signed(demod_in_qpskSignal), rawQ'length) ; 
                when 2 =>
                    rawI <= resize( -signed(demod_in_qpskSignal), rawI'length); 
                    rawQ <= (others => '0');
                when 3 => 
                    rawI <= (others => '0');
                    rawQ <= resize( signed(demod_in_qpskSignal), rawQ'length); 
                when others =>
                    rawI <= (others => '0');
                    rawQ <= (others => '0');
            end case; 
        end if; 
    end if;
end process; 


demod_out_iSample <= std_logic_vector( resize(rawI, demod_out_iSample'length)  ); 
demod_out_qSample <= std_logic_vector( resize(rawQ, demod_out_qSample'length)  ); 

WaveCounter:
process(clk)
begin
    if rising_edge(clk) then
        if  demod_in_sampleClk = '1' then 
            if waveCount = 3 then 
                waveCount <= 0; 
            else
                wavecount <= waveCount + 1; 
            end if; 
        end if; 
    end if;
end process;

end Behavioral;
