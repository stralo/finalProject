----------------------------------------------------------------------------------
-- Engineer: Richard Addo & George Boateng
-- Create Date: 04/27/2015 04:13:50 AM
-- Design Name: 
-- Module Name: Modulator - Behavioral
-- Description:  
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.math_real.all; 


entity Modulator is
    Port ( 
        clk : in STD_LOGIC;
        mod_in_iPulse : in std_logic_vector(15 downto 0); 
        mod_in_qPulse : in std_logic_vector(15 downto 0); 
        mod_in_sampleClk : in std_logic;
        mod_out_qpskSignal : out std_logic_vector(11 downto 0)    
    );
end Modulator;

architecture Behavioral of Modulator is

COMPONENT dds_compiler_0 is 
Port (
    aclk : in STD_LOGIC;
    m_axis_data_tvalid : out STD_LOGIC;
    m_axis_data_tdata : out STD_LOGIC_VECTOR ( 31 downto 0 )
);
end COMPONENT;
    -- INTER COMPONENT SIGNALS
    signal dataReady : std_logic := '0';
    signal dds_data : std_logic_vector(31 downto 0) := (others=>'0');
    signal dds_cosine: std_logic_vector(13 downto 0) := (others => '0');
    signal dds_sine : std_logic_vector(13 downto 0) := (others => '0');
    
    signal qpskSignal: signed (29 downto 0) := (others => '0');
    
    signal iProduct, qProduct :signed(29 downto 0) := (others => '0');
    
    type DSPStateType is(dspIdle, dspState1, dspState2, dspState3);
    signal dspCurrState, dspNextState : DSPStateType := dspIdle;
    
    signal dspReg_Mult, dspReg_Accum : signed(29 downto 0) := (others => '0');
    
    signal regEn1, regEn2, accumEn1, accumEn2 : std_logic := '0';
    
    signal multReset, accumReset : std_logic := '0';
begin

DDSModulator:
dds_compiler_0
Port Map(
    aclk => mod_in_sampleClk, 
    m_axis_data_tvalid => dataReady,
    m_axis_data_tdata => dds_data
);

process(clk)
begin
    if rising_edge(clk) then 
        if dataReady = '1' then 
            dds_cosine <= dds_data(13 downto 0);
            dds_sine <= dds_data(29 downto 16);
        else
            dds_cosine <= (others => '0'); 
            dds_sine <= (others => '0');
        end if; 
    end if; 
end process; 


--process(clk)
--begin
--    if rising_edge(clk) then 
--        if mod_in_sampleClk = '1' then 
----            iProduct <= signed(signed(mod_in_iPulse) * signed(dds_cosine));
----            qProduct <= signed(signed(mod_in_qPulse) * signed(dds_sine));
----            qpskSignal <= iProduct - qProduct; 
----            qpskSignal <= signed(signed(mod_in_iPulse) * signed(dds_cosine)) - signed(signed(mod_in_qPulse) * signed(dds_sine)); 
--        end if; 
--    end if; 
--end process; 



process(clk, mod_in_iPulse, dds_cosine, mod_in_qPulse, dds_sine, multReset, regEn1, regEn2)
begin
    if rising_edge(clk) then
        if multReset = '1' then 
            dspReg_Mult <= (others => '0');
        elsif regEn1 = '1' then
            dspReg_Mult <= signed(signed(mod_in_iPulse) * signed(dds_cosine));
        elsif regEn2 = '1' then
            dspReg_Mult <= signed(signed(mod_in_qPulse) * signed(dds_sine));
        end if;
    end if;
end process;

process(clk, accumReset, accumEn1, accumEn2)
begin
    if rising_edge(clk) then
        if accumReset = '1' then 
            dspReg_Accum <= (others => '0');
        elsif accumEn1 = '1' then
            dspReg_Accum <= dspReg_Mult; 
        elsif accumEn2 = '1' then
            qpskSignal <= dspReg_Accum  - dspReg_Mult;
        end if; 
    end if;
end process;

process(clk)
begin
    if rising_edge(clk)then 
        dspCurrState <= dspNextState; 
    end if; 
end process; 

process(dspCurrState, mod_in_sampleClk, mod_in_iPulse, dds_cosine, mod_in_qPulse, dds_sine)
begin
    dspNextState <= dspCurrState;
    regEn1 <= '0';
    regEn2 <= '0';
    accumEn1 <= '0';
    accumEn2 <= '0'; 
    multReset <= '0';
    accumReset <= '0';
    
    case dspCurrState is
        when dspIdle =>
            if mod_in_sampleClk = '1' then 
                multReset <= '1'; 
                accumReset <= '1';
                dspNextState <= dspState1; 
            end if; 
        
        when dspState1 =>
            regEn1 <= '1';
            dspNextState <= dspState2; 
        
        when dspState2 =>
            accumEn1 <= '1';
            regEn2 <= '1';
            dspNextState <= dspState3; 
        
        when dspState3 =>
            accumEn2 <= '1';
            dspNextState <= dspIdle; 
    end case; 
end process; 


mod_out_qpskSignal <= std_logic_vector(qpskSignal(28 downto 17));

end Behavioral;
