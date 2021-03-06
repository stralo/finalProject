
�
@Attempting to get a license for feature '%s' and/or device '%s'
308*common2"
Implementation2default:default2
xc7a35t2default:defaultZ17-347h px
�
0Got license for feature '%s' and/or device '%s'
310*common2"
Implementation2default:default2
xc7a35t2default:defaultZ17-349h px
u
,Running DRC as a precondition to command %s
1349*	planAhead2#
write_bitstream2default:defaultZ12-1349h px
M
Running DRC with %s threads
24*drc2
22default:defaultZ23-27h px
�
Rule violation (%s) %s - %s
20*drc2
CFGBVS-12default:default2G
3Missing CFGBVS and CONFIG_VOLTAGE Design Properties2default:default2�
�Neither the CFGBVS nor CONFIG_VOLTAGE voltage property is set in the current_design.  Configuration bank voltage select (CFGBVS) must be set to VCCO or GND, and CONFIG_VOLTAGE must be set to the correct configuration voltage, in order to determine the I/O voltage support for the pins in bank 0.  It is suggested to specify these either using the 'Edit Device Properties' function in the GUI or directly in the XDC file using the following syntax:

 set_property CFGBVS value1 [current_design]
 #where value1 is either VCCO or GND

 set_property CONFIG_VOLTAGE value2 [current_design]
 #where value2 is the voltage provided to configuration bank 0

Refer to the device configuration user guide for more information.2default:defaultZ23-20h px
�
Rule violation (%s) %s - %s
20*drc2
DPIP-12default:default2$
Input pipelining2default:default2�
vDSP Receiver/CarriageRecoveryLoop/ph_accum0 input B is not pipelined. Pipelining DSP48 input will improve performance.2default:defaultZ23-20h px
�
Rule violation (%s) %s - %s
20*drc2
DPIP-12default:default2$
Input pipelining2default:default2�
yDSP Receiver/CarriageRecoveryLoop/x2_ploop_reg input B is not pipelined. Pipelining DSP48 input will improve performance.2default:defaultZ23-20h px
�
Rule violation (%s) %s - %s
20*drc2
DPIP-12default:default2$
Input pipelining2default:default2�
wDSP Transmitter/QPSK_Modulator/qpskSignal1 input A B is not pipelined. Pipelining DSP48 input will improve performance.2default:defaultZ23-20h px
�
Rule violation (%s) %s - %s
20*drc2
DPIP-12default:default2$
Input pipelining2default:default2�
|DSP Transmitter/QPSK_Modulator/qpskSignal_reg input A B C is not pipelined. Pipelining DSP48 input will improve performance.2default:defaultZ23-20h px
�
Rule violation (%s) %s - %s
20*drc2
DPOP-12default:default2%
Output pipelining2default:default2�
�DSP Receiver/CarriageRecoveryLoop/ph_accum0 output P is not pipelined. Pipelining DSP48 output will improve performance. Both multiplier/adder output can be pipelined.2default:defaultZ23-20h px
�
Rule violation (%s) %s - %s
20*drc2
DPOP-12default:default2%
Output pipelining2default:default2�
�DSP Receiver/CarriageRecoveryLoop/ph_accum_reg output P is not pipelined. Pipelining DSP48 output will improve performance. Both multiplier/adder output can be pipelined.2default:defaultZ23-20h px
�
Rule violation (%s) %s - %s
20*drc2
DPOP-12default:default2%
Output pipelining2default:default2�
�DSP Receiver/CarriageRecoveryLoop/x2_ploop_reg output P is not pipelined. Pipelining DSP48 output will improve performance. Both multiplier/adder output can be pipelined.2default:defaultZ23-20h px
�
Rule violation (%s) %s - %s
20*drc2
DPOP-12default:default2%
Output pipelining2default:default2�
�DSP Receiver/CarriageRecoveryLoop/yI1 output P is not pipelined. Pipelining DSP48 output will improve performance. Both multiplier/adder output can be pipelined.2default:defaultZ23-20h px
�
Rule violation (%s) %s - %s
20*drc2
DPOP-12default:default2%
Output pipelining2default:default2�
�DSP Receiver/CarriageRecoveryLoop/yI_reg output P is not pipelined. Pipelining DSP48 output will improve performance. Both multiplier/adder output can be pipelined.2default:defaultZ23-20h px
�
Rule violation (%s) %s - %s
20*drc2
DPOP-12default:default2%
Output pipelining2default:default2�
�DSP Receiver/CarriageRecoveryLoop/yQ2 output P is not pipelined. Pipelining DSP48 output will improve performance. Both multiplier/adder output can be pipelined.2default:defaultZ23-20h px
�
Rule violation (%s) %s - %s
20*drc2
DPOP-12default:default2%
Output pipelining2default:default2�
�DSP Receiver/CarriageRecoveryLoop/yQ_reg output P is not pipelined. Pipelining DSP48 output will improve performance. Both multiplier/adder output can be pipelined.2default:defaultZ23-20h px
�
Rule violation (%s) %s - %s
20*drc2
DPOP-12default:default2%
Output pipelining2default:default2�
�DSP Transmitter/PSF_I/PulseFilter/U0/i_synth/g_polyphase_interpolation.i_polyphase_interpolation/g_semi_parallel_and_smac.g_paths[0].g_madd_array_and_accum.g_accum.i_accum/i_add_accum/g_dsp48.g_dsp48e1.i_dsp48e1 output P is not pipelined. Pipelining DSP48 output will improve performance. Both multiplier/adder output can be pipelined.2default:defaultZ23-20h px
�
Rule violation (%s) %s - %s
20*drc2
DPOP-12default:default2%
Output pipelining2default:default2�
�DSP Transmitter/PSF_Q/PulseFilter/U0/i_synth/g_polyphase_interpolation.i_polyphase_interpolation/g_semi_parallel_and_smac.g_paths[0].g_madd_array_and_accum.g_accum.i_accum/i_add_accum/g_dsp48.g_dsp48e1.i_dsp48e1 output P is not pipelined. Pipelining DSP48 output will improve performance. Both multiplier/adder output can be pipelined.2default:defaultZ23-20h px
�
Rule violation (%s) %s - %s
20*drc2
DPOP-12default:default2%
Output pipelining2default:default2�
�DSP Transmitter/QPSK_Modulator/qpskSignal1 output P is not pipelined. Pipelining DSP48 output will improve performance. Both multiplier/adder output can be pipelined.2default:defaultZ23-20h px
�
Rule violation (%s) %s - %s
20*drc2
DPOP-12default:default2%
Output pipelining2default:default2�
�DSP Transmitter/QPSK_Modulator/qpskSignal_reg output P is not pipelined. Pipelining DSP48 output will improve performance. Both multiplier/adder output can be pipelined.2default:defaultZ23-20h px
�
Rule violation (%s) %s - %s
20*drc2
PDRC-1532default:default2%
Gated clock check2default:default2�
�Net Receiver/IQToChar/in2 is a gated clock net sourced by a combinational pin Receiver/IQToChar/deser_out_txData_reg[7]_i_1/O, cell Receiver/IQToChar/deser_out_txData_reg[7]_i_1. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.2default:defaultZ23-20h px
�
Rule violation (%s) %s - %s
20*drc2
PDRC-1532default:default2%
Gated clock check2default:default2�
�Net Receiver/MF_I/n_0_romRdAddr_reg[7]_i_2 is a gated clock net sourced by a combinational pin Receiver/MF_I/romRdAddr_reg[7]_i_2/O, cell Receiver/MF_I/romRdAddr_reg[7]_i_2. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.2default:defaultZ23-20h px
�
Rule violation (%s) %s - %s
20*drc2
PDRC-1532default:default2%
Gated clock check2default:default2�
�Net Receiver/MF_Q/n_0_romRdAddr_reg[7]_i_2__0 is a gated clock net sourced by a combinational pin Receiver/MF_Q/romRdAddr_reg[7]_i_2__0/O, cell Receiver/MF_Q/romRdAddr_reg[7]_i_2__0. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.2default:defaultZ23-20h px
�
Rule violation (%s) %s - %s
20*drc2
PDRC-1532default:default2%
Gated clock check2default:default2�
�Net Transmitter/CharacterToIQ/Serializer/n_0_serI_reg_i_2 is a gated clock net sourced by a combinational pin Transmitter/CharacterToIQ/Serializer/serI_reg_i_2/O, cell Transmitter/CharacterToIQ/Serializer/serI_reg_i_2. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.2default:defaultZ23-20h px
�
Rule violation (%s) %s - %s
20*drc2
PLHOLDVIO-22default:default2O
;Non-Optimal connections which could lead to hold violations2default:default2�
�A LUT Receiver/IQToChar/deser_out_txData_reg[7]_i_1 is driving clock pin of 8 cells. This could lead to large hold time violations. First few involved cells are:
    Receiver/IQToChar/deser_out_txData_reg[0] {LDCE}
    Receiver/IQToChar/deser_out_txData_reg[1] {LDCE}
    Receiver/IQToChar/deser_out_txData_reg[2] {LDCE}
    Receiver/IQToChar/deser_out_txData_reg[3] {LDCE}
    Receiver/IQToChar/deser_out_txData_reg[4] {LDCE}
2default:defaultZ23-20h px
�
Rule violation (%s) %s - %s
20*drc2
PLHOLDVIO-22default:default2O
;Non-Optimal connections which could lead to hold violations2default:default2�
�A LUT Receiver/MF_I/romRdAddr_reg[7]_i_2 is driving clock pin of 8 cells. This could lead to large hold time violations. First few involved cells are:
    Receiver/MF_I/romRdAddr_reg[0] {LDCE}
    Receiver/MF_I/romRdAddr_reg[1] {LDCE}
    Receiver/MF_I/romRdAddr_reg[2] {LDCE}
    Receiver/MF_I/romRdAddr_reg[3] {LDCE}
    Receiver/MF_I/romRdAddr_reg[4] {LDCE}
2default:defaultZ23-20h px
�
Rule violation (%s) %s - %s
20*drc2
PLHOLDVIO-22default:default2O
;Non-Optimal connections which could lead to hold violations2default:default2�
�A LUT Receiver/MF_Q/romRdAddr_reg[7]_i_2__0 is driving clock pin of 8 cells. This could lead to large hold time violations. First few involved cells are:
    Receiver/MF_Q/romRdAddr_reg[0] {LDCE}
    Receiver/MF_Q/romRdAddr_reg[1] {LDCE}
    Receiver/MF_Q/romRdAddr_reg[2] {LDCE}
    Receiver/MF_Q/romRdAddr_reg[3] {LDCE}
    Receiver/MF_Q/romRdAddr_reg[4] {LDCE}
2default:defaultZ23-20h px
�
Rule violation (%s) %s - %s
20*drc2
PLHOLDVIO-22default:default2O
;Non-Optimal connections which could lead to hold violations2default:default2�
�A LUT Transmitter/CharacterToIQ/Serializer/serI_reg_i_2 is driving clock pin of 2 cells. This could lead to large hold time violations. First few involved cells are:
    Transmitter/CharacterToIQ/Serializer/serI_reg {LDCE}
    Transmitter/CharacterToIQ/Serializer/serQ_reg {LDCE}
2default:defaultZ23-20h px
�
Rule violation (%s) %s - %s
20*drc2
AVAL-42default:default2U
Aenum_USE_DPORT_FALSE_enum_DREG_ADREG_0_connects_CED_CEAD_RSTD_GND2default:default2�
�Transmitter/PSF_I/PulseFilter/U0/i_synth/g_polyphase_interpolation.i_polyphase_interpolation/g_semi_parallel_and_smac.g_paths[0].g_madd_array_and_accum.g_accum.i_accum/i_add_accum/g_dsp48.g_dsp48e1.i_dsp48e1: DSP48E1 is not using the D port (USE_DPORT = FALSE). For improved power characteristics, set DREG and ADREG to '1', tie CED, CEAD, and RSTD to logic '0'.2default:defaultZ23-20h px
�
Rule violation (%s) %s - %s
20*drc2
AVAL-42default:default2U
Aenum_USE_DPORT_FALSE_enum_DREG_ADREG_0_connects_CED_CEAD_RSTD_GND2default:default2�
�Transmitter/PSF_Q/PulseFilter/U0/i_synth/g_polyphase_interpolation.i_polyphase_interpolation/g_semi_parallel_and_smac.g_paths[0].g_madd_array_and_accum.g_accum.i_accum/i_add_accum/g_dsp48.g_dsp48e1.i_dsp48e1: DSP48E1 is not using the D port (USE_DPORT = FALSE). For improved power characteristics, set DREG and ADREG to '1', tie CED, CEAD, and RSTD to logic '0'.2default:defaultZ23-20h px
�
Rule violation (%s) %s - %s
20*drc2
AVAL-52default:default2S
?enum_USE_MULT_NONE_enum_DREG_ADREG_0_connects_CED_CEAD_RSTD_GND2default:default2�
�Transmitter/PSF_I/PulseFilter/U0/i_synth/g_polyphase_interpolation.i_polyphase_interpolation/g_semi_parallel_and_smac.g_paths[0].g_madd_array_and_accum.g_accum.i_accum/i_add_accum/g_dsp48.g_dsp48e1.i_dsp48e1: DSP48E1 is not using the Multiplier (USE_MULT = NONE). For improved power characteristics, set DREG and ADREG to '1', tie CED, CEAD, and RSTD to logic '0'.2default:defaultZ23-20h px
�
Rule violation (%s) %s - %s
20*drc2
AVAL-52default:default2S
?enum_USE_MULT_NONE_enum_DREG_ADREG_0_connects_CED_CEAD_RSTD_GND2default:default2�
�Transmitter/PSF_Q/PulseFilter/U0/i_synth/g_polyphase_interpolation.i_polyphase_interpolation/g_semi_parallel_and_smac.g_paths[0].g_madd_array_and_accum.g_accum.i_accum/i_add_accum/g_dsp48.g_dsp48e1.i_dsp48e1: DSP48E1 is not using the Multiplier (USE_MULT = NONE). For improved power characteristics, set DREG and ADREG to '1', tie CED, CEAD, and RSTD to logic '0'.2default:defaultZ23-20h px
�
Rule violation (%s) %s - %s
20*drc2
REQP-282default:default27
#enum_USE_MULT_NONE_connects_CEM_GND2default:default2�
�Transmitter/PSF_I/PulseFilter/U0/i_synth/g_polyphase_interpolation.i_polyphase_interpolation/g_semi_parallel_and_smac.g_paths[0].g_madd_array_and_accum.g_accum.i_accum/i_add_accum/g_dsp48.g_dsp48e1.i_dsp48e1: When the DSP48E1 USE_MULT attribute is set to NONE, the CEM input pin should be tied to GND to save power.2default:defaultZ23-20h px
�
Rule violation (%s) %s - %s
20*drc2
REQP-282default:default27
#enum_USE_MULT_NONE_connects_CEM_GND2default:default2�
�Transmitter/PSF_Q/PulseFilter/U0/i_synth/g_polyphase_interpolation.i_polyphase_interpolation/g_semi_parallel_and_smac.g_paths[0].g_madd_array_and_accum.g_accum.i_accum/i_add_accum/g_dsp48.g_dsp48e1.i_dsp48e1: When the DSP48E1 USE_MULT attribute is set to NONE, the CEM input pin should be tied to GND to save power.2default:defaultZ23-20h px
�
Rule violation (%s) %s - %s
20*drc2
REQP-302default:default20
enum_MREG_0_connects_CEM_GND2default:default2�
�Transmitter/PSF_I/PulseFilter/U0/i_synth/g_polyphase_interpolation.i_polyphase_interpolation/g_semi_parallel_and_smac.g_paths[0].g_madd_array_and_accum.g_accum.i_accum/i_add_accum/g_dsp48.g_dsp48e1.i_dsp48e1: When the DSP48E1 MREG attribute is set to 0, the CEM input pin should be tied to GND to save power.2default:defaultZ23-20h px
�
Rule violation (%s) %s - %s
20*drc2
REQP-302default:default20
enum_MREG_0_connects_CEM_GND2default:default2�
�Transmitter/PSF_Q/PulseFilter/U0/i_synth/g_polyphase_interpolation.i_polyphase_interpolation/g_semi_parallel_and_smac.g_paths[0].g_madd_array_and_accum.g_accum.i_accum/i_add_accum/g_dsp48.g_dsp48e1.i_dsp48e1: When the DSP48E1 MREG attribute is set to 0, the CEM input pin should be tied to GND to save power.2default:defaultZ23-20h px
r
DRC finished with %s
1905*	planAhead27
#0 Errors, 24 Warnings, 8 Advisories2default:defaultZ12-3199h px
f
BPlease refer to the DRC report (report_drc) for more information.
1906*	planAheadZ12-3200h px
<
Loading data files...
1271*designutilsZ12-1165h px
;
Loading site data...
1273*designutilsZ12-1167h px
<
Loading route data...
1272*designutilsZ12-1166h px
<
Processing options...
1362*designutilsZ12-1514h px
9
Creating bitmap...
1249*designutilsZ12-1141h px
4
Creating bitstream...
7*	bitstreamZ40-7h px
[
Writing bitstream %s...
11*	bitstream2!
./lab3top.bit2default:defaultZ40-11h px
C
Bitgen Completed Successfully.
1606*	planAheadZ12-1842h px
p
QWebTalk data collection is enabled (User setting is ON. Install Setting is ON.).
118*projectZ1-118h px
�
�'%s' has been successfully sent to Xilinx on %s. For additional details about this file, please refer to the Webtalk help file at %s.
186*common2\
HO:/engs128/lab4_withCRLoop/lab4.runs/impl_1/usage_statistics_webtalk.xml2default:default2,
Sun May 03 23:18:32 20152default:default2I
5C:/Xilinx/Vivado/2014.4/doc/webtalk_introduction.html2default:defaultZ17-186h px
W
Releasing license: %s
83*common2"
Implementation2default:defaultZ17-83h px
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2%
write_bitstream: 2default:default2
00:00:282default:default2
00:00:322default:default2
1408.8982default:default2
321.9612default:defaultZ17-268h px


End Record