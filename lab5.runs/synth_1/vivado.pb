
~
]hardware handoff file cannot be generated as there is no block diagram instance in the design132*	vivadotclZ4-279h px
q
Command: %s
53*	vivadotcl2C
/synth_design -top lab3top -part xc7a35tcpg236-12default:defaultZ4-113h px
7
Starting synth_design
149*	vivadotclZ4-321h px
�
@Attempting to get a license for feature '%s' and/or device '%s'
308*common2
	Synthesis2default:default2
xc7a35t2default:defaultZ17-347h px
�
0Got license for feature '%s' and/or device '%s'
310*common2
	Synthesis2default:default2
xc7a35t2default:defaultZ17-349h px
�
%s*synth2�
wStarting RTL Elaboration : Time (s): cpu = 00:00:11 ; elapsed = 00:00:31 . Memory (MB): peak = 240.070 ; gain = 80.758
2default:defaulth px
�
synthesizing module '%s'638*oasys2
lab3top2default:default2I
3O:/engs128/lab5/lab5.srcs/sources_1/new/lab3top.vhd2default:default2
382default:default8@Z8-638h px
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
MMCM2default:default2g
SO:/engs128/lab5/lab5.runs/synth_1/.Xil/Vivado-5936-VLAB-049/realtime/MMCM_stub.vhdl2default:default2
52default:default2#
SPIClkGenerator2default:default2
MMCM2default:default2I
3O:/engs128/lab5/lab5.srcs/sources_1/new/lab3top.vhd2default:default2
1142default:default8@Z8-3491h px
�
synthesizing module '%s'638*oasys2
MMCM2default:default2i
SO:/engs128/lab5/lab5.runs/synth_1/.Xil/Vivado-5936-VLAB-049/realtime/MMCM_stub.vhdl2default:default2
142default:default8@Z8-638h px
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
ModemTx2default:default2G
3O:/engs128/lab5/lab5.srcs/sources_1/new/ModemTx.vhd2default:default2
122default:default2
Transmitter2default:default2
ModemTx2default:default2I
3O:/engs128/lab5/lab5.srcs/sources_1/new/lab3top.vhd2default:default2
1212default:default8@Z8-3491h px
�
synthesizing module '%s'638*oasys2
ModemTx2default:default2I
3O:/engs128/lab5/lab5.srcs/sources_1/new/ModemTx.vhd2default:default2
302default:default8@Z8-638h px
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
SerialRx2default:default2Q
=O:/engs128/lab3/lab2.srcs/sources_1/imports/Lab1/SerialRx.vhd2default:default2
252default:default2
Receiver2default:default2
SerialRx2default:default2I
3O:/engs128/lab5/lab5.srcs/sources_1/new/ModemTx.vhd2default:default2
1192default:default8@Z8-3491h px
�
synthesizing module '%s'638*oasys2
SerialRx2default:default2S
=O:/engs128/lab3/lab2.srcs/sources_1/imports/Lab1/SerialRx.vhd2default:default2
322default:default8@Z8-638h px
�
%done synthesizing module '%s' (%s#%s)256*oasys2
SerialRx2default:default2
12default:default2
12default:default2S
=O:/engs128/lab3/lab2.srcs/sources_1/imports/Lab1/SerialRx.vhd2default:default2
322default:default8@Z8-256h px
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
mux7seg2default:default2P
<O:/engs128/lab3/lab2.srcs/sources_1/imports/Lab1/mux7seg.vhd2default:default2
252default:default2
Display2default:default2
mux7seg2default:default2I
3O:/engs128/lab5/lab5.srcs/sources_1/new/ModemTx.vhd2default:default2
1292default:default8@Z8-3491h px
�
synthesizing module '%s'638*oasys2
mux7seg2default:default2R
<O:/engs128/lab3/lab2.srcs/sources_1/imports/Lab1/mux7seg.vhd2default:default2
322default:default8@Z8-638h px
�
default block is never used226*oasys2R
<O:/engs128/lab3/lab2.srcs/sources_1/imports/Lab1/mux7seg.vhd2default:default2
642default:default8@Z8-226h px
�
default block is never used226*oasys2R
<O:/engs128/lab3/lab2.srcs/sources_1/imports/Lab1/mux7seg.vhd2default:default2
762default:default8@Z8-226h px
�
default block is never used226*oasys2R
<O:/engs128/lab3/lab2.srcs/sources_1/imports/Lab1/mux7seg.vhd2default:default2
862default:default8@Z8-226h px
�
%done synthesizing module '%s' (%s#%s)256*oasys2
mux7seg2default:default2
22default:default2
12default:default2R
<O:/engs128/lab3/lab2.srcs/sources_1/imports/Lab1/mux7seg.vhd2default:default2
322default:default8@Z8-256h px
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
CharToIQ2default:default2H
4O:/engs128/lab5/lab5.srcs/sources_1/new/CharToIQ.vhd2default:default2
152default:default2!
CharacterToIQ2default:default2
CharToIQ2default:default2I
3O:/engs128/lab5/lab5.srcs/sources_1/new/ModemTx.vhd2default:default2
1412default:default8@Z8-3491h px
�
synthesizing module '%s'638*oasys2,
CharToIQ__parameterized02default:default2J
4O:/engs128/lab5/lab5.srcs/sources_1/new/CharToIQ.vhd2default:default2
262default:default8@Z8-638h px
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2$
CharBufferModule2default:default2X
DO:/engs128/lab3/lab2.srcs/sources_1/imports/new/CharBufferModule.vhd2default:default2
152default:default2

CharBuffer2default:default2$
CharBufferModule2default:default2J
4O:/engs128/lab5/lab5.srcs/sources_1/new/CharToIQ.vhd2default:default2
652default:default8@Z8-3491h px
�
synthesizing module '%s'638*oasys2$
CharBufferModule2default:default2Z
DO:/engs128/lab3/lab2.srcs/sources_1/imports/new/CharBufferModule.vhd2default:default2
262default:default8@Z8-638h px
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2$
fifo_generator_02default:default2s
_O:/engs128/lab5/lab5.runs/synth_1/.Xil/Vivado-5936-VLAB-049/realtime/fifo_generator_0_stub.vhdl2default:default2
52default:default2!
CharacterFIFO2default:default2$
fifo_generator_02default:default2Z
DO:/engs128/lab3/lab2.srcs/sources_1/imports/new/CharBufferModule.vhd2default:default2
1792default:default8@Z8-3491h px
�
synthesizing module '%s'638*oasys2$
fifo_generator_02default:default2u
_O:/engs128/lab5/lab5.runs/synth_1/.Xil/Vivado-5936-VLAB-049/realtime/fifo_generator_0_stub.vhdl2default:default2
212default:default8@Z8-638h px
�
%done synthesizing module '%s' (%s#%s)256*oasys2$
CharBufferModule2default:default2
32default:default2
12default:default2Z
DO:/engs128/lab3/lab2.srcs/sources_1/imports/new/CharBufferModule.vhd2default:default2
262default:default8@Z8-256h px
_
%s*synth2J
6	Parameter DATA_NUM_BITS bound to: 8 - type: integer 
2default:defaulth px
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2 
IQSerializer2default:default2T
@O:/engs128/lab3/lab2.srcs/sources_1/imports/new/IQSerializer.vhd2default:default2
142default:default2

Serializer2default:default2 
IQSerializer2default:default2J
4O:/engs128/lab5/lab5.srcs/sources_1/new/CharToIQ.vhd2default:default2
792default:default8@Z8-3491h px
�
synthesizing module '%s'638*oasys20
IQSerializer__parameterized02default:default2V
@O:/engs128/lab3/lab2.srcs/sources_1/imports/new/IQSerializer.vhd2default:default2
302default:default8@Z8-638h px
_
%s*synth2J
6	Parameter DATA_NUM_BITS bound to: 8 - type: integer 
2default:defaulth px
�
default block is never used226*oasys2V
@O:/engs128/lab3/lab2.srcs/sources_1/imports/new/IQSerializer.vhd2default:default2
1822default:default8@Z8-226h px
�
%done synthesizing module '%s' (%s#%s)256*oasys20
IQSerializer__parameterized02default:default2
42default:default2
12default:default2V
@O:/engs128/lab3/lab2.srcs/sources_1/imports/new/IQSerializer.vhd2default:default2
302default:default8@Z8-256h px
�
%done synthesizing module '%s' (%s#%s)256*oasys2,
CharToIQ__parameterized02default:default2
52default:default2
12default:default2J
4O:/engs128/lab5/lab5.srcs/sources_1/new/CharToIQ.vhd2default:default2
262default:default8@Z8-256h px
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
PulseShaper2default:default2K
7O:/engs128/lab3/lab2.srcs/sources_1/new/PulseShaper.vhd2default:default2
152default:default2
PSF2default:default2
PulseShaper2default:default2I
3O:/engs128/lab5/lab5.srcs/sources_1/new/ModemTx.vhd2default:default2
1612default:default8@Z8-3491h px
�
synthesizing module '%s'638*oasys2
PulseShaper2default:default2M
7O:/engs128/lab3/lab2.srcs/sources_1/new/PulseShaper.vhd2default:default2
292default:default8@Z8-638h px
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2"
fir_compiler_22default:default2q
]O:/engs128/lab5/lab5.runs/synth_1/.Xil/Vivado-5936-VLAB-049/realtime/fir_compiler_2_stub.vhdl2default:default2
52default:default2&
your_instance_name2default:default2"
fir_compiler_22default:default2M
7O:/engs128/lab3/lab2.srcs/sources_1/new/PulseShaper.vhd2default:default2
562default:default8@Z8-3491h px
�
synthesizing module '%s'638*oasys2"
fir_compiler_22default:default2s
]O:/engs128/lab5/lab5.runs/synth_1/.Xil/Vivado-5936-VLAB-049/realtime/fir_compiler_2_stub.vhdl2default:default2
172default:default8@Z8-638h px
�
%done synthesizing module '%s' (%s#%s)256*oasys2
PulseShaper2default:default2
62default:default2
12default:default2M
7O:/engs128/lab3/lab2.srcs/sources_1/new/PulseShaper.vhd2default:default2
292default:default8@Z8-256h px
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
	Modulator2default:default2I
5O:/engs128/lab5/lab5.srcs/sources_1/new/Modulator.vhd2default:default2
162default:default2"
QPSK_Modulator2default:default2
	Modulator2default:default2I
3O:/engs128/lab5/lab5.srcs/sources_1/new/ModemTx.vhd2default:default2
1772default:default8@Z8-3491h px
�
synthesizing module '%s'638*oasys2
	Modulator2default:default2K
5O:/engs128/lab5/lab5.srcs/sources_1/new/Modulator.vhd2default:default2
262default:default8@Z8-638h px
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2"
dds_compiler_02default:default2q
]O:/engs128/lab5/lab5.runs/synth_1/.Xil/Vivado-5936-VLAB-049/realtime/dds_compiler_0_stub.vhdl2default:default2
52default:default2 
DDSModulator2default:default2"
dds_compiler_02default:default2K
5O:/engs128/lab5/lab5.srcs/sources_1/new/Modulator.vhd2default:default2
552default:default8@Z8-3491h px
�
synthesizing module '%s'638*oasys2"
dds_compiler_02default:default2s
]O:/engs128/lab5/lab5.runs/synth_1/.Xil/Vivado-5936-VLAB-049/realtime/dds_compiler_0_stub.vhdl2default:default2
142default:default8@Z8-638h px
�
%done synthesizing module '%s' (%s#%s)256*oasys2
	Modulator2default:default2
72default:default2
12default:default2K
5O:/engs128/lab5/lab5.srcs/sources_1/new/Modulator.vhd2default:default2
262default:default8@Z8-256h px
\
%s*synth2G
3	Parameter WORD_SIZE bound to: 16 - type: integer 
2default:defaulth px
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
DAC2default:default2C
/O:/engs128/lab5/lab5.srcs/sources_1/new/DAC.vhd2default:default2
122default:default2 
DACInterface2default:default2
DAC2default:default2I
3O:/engs128/lab5/lab5.srcs/sources_1/new/ModemTx.vhd2default:default2
1912default:default8@Z8-3491h px
�
synthesizing module '%s'638*oasys2'
DAC__parameterized02default:default2E
/O:/engs128/lab5/lab5.srcs/sources_1/new/DAC.vhd2default:default2
302default:default8@Z8-638h px
\
%s*synth2G
3	Parameter WORD_SIZE bound to: 16 - type: integer 
2default:defaulth px
�
%done synthesizing module '%s' (%s#%s)256*oasys2'
DAC__parameterized02default:default2
82default:default2
12default:default2E
/O:/engs128/lab5/lab5.srcs/sources_1/new/DAC.vhd2default:default2
302default:default8@Z8-256h px
�
%done synthesizing module '%s' (%s#%s)256*oasys2
ModemTx2default:default2
92default:default2
12default:default2I
3O:/engs128/lab5/lab5.srcs/sources_1/new/ModemTx.vhd2default:default2
302default:default8@Z8-256h px
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
ModemRx2default:default2G
3O:/engs128/lab5/lab5.srcs/sources_1/new/ModemRx.vhd2default:default2
132default:default2
Receiver2default:default2
ModemRx2default:default2I
3O:/engs128/lab5/lab5.srcs/sources_1/new/lab3top.vhd2default:default2
1392default:default8@Z8-3491h px
�
synthesizing module '%s'638*oasys2
ModemRx2default:default2I
3O:/engs128/lab5/lab5.srcs/sources_1/new/ModemRx.vhd2default:default2
322default:default8@Z8-638h px
\
%s*synth2G
3	Parameter WORD_SIZE bound to: 16 - type: integer 
2default:defaulth px
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2 
ADCInterface2default:default2K
7O:/engs128/lab5/lab5.srcs/sources_1/imports/new/ADC.vhd2default:default2
72default:default2
	ADCInFace2default:default2 
ADCInterface2default:default2I
3O:/engs128/lab5/lab5.srcs/sources_1/new/ModemRx.vhd2default:default2
1662default:default8@Z8-3491h px
�
synthesizing module '%s'638*oasys20
ADCInterface__parameterized02default:default2M
7O:/engs128/lab5/lab5.srcs/sources_1/imports/new/ADC.vhd2default:default2
272default:default8@Z8-638h px
\
%s*synth2G
3	Parameter WORD_SIZE bound to: 16 - type: integer 
2default:defaulth px
�
%done synthesizing module '%s' (%s#%s)256*oasys20
ADCInterface__parameterized02default:default2
102default:default2
12default:default2M
7O:/engs128/lab5/lab5.srcs/sources_1/imports/new/ADC.vhd2default:default2
272default:default8@Z8-256h px
\
%s*synth2G
3	Parameter WORD_SIZE bound to: 16 - type: integer 
2default:defaulth px
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
DAC2default:default2C
/O:/engs128/lab5/lab5.srcs/sources_1/new/DAC.vhd2default:default2
122default:default2(
Debug_PassThroughDAC2default:default2
DAC2default:default2I
3O:/engs128/lab5/lab5.srcs/sources_1/new/ModemRx.vhd2default:default2
1852default:default8@Z8-3491h px
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
Demodulator2default:default2V
BO:/engs128/lab4_withCRLoop/lab4.srcs/sources_1/new/Demodulator.vhd2default:default2
142default:default2$
QPSK_Demodulator2default:default2
Demodulator2default:default2I
3O:/engs128/lab5/lab5.srcs/sources_1/new/ModemRx.vhd2default:default2
2012default:default8@Z8-3491h px
�
synthesizing module '%s'638*oasys2
Demodulator2default:default2X
BO:/engs128/lab4_withCRLoop/lab4.srcs/sources_1/new/Demodulator.vhd2default:default2
222default:default8@Z8-638h px
�
%done synthesizing module '%s' (%s#%s)256*oasys2
Demodulator2default:default2
112default:default2
12default:default2X
BO:/engs128/lab4_withCRLoop/lab4.srcs/sources_1/new/Demodulator.vhd2default:default2
222default:default8@Z8-256h px
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2$
NewMatchedFilter2default:default2P
<O:/engs128/lab5/lab5.srcs/sources_1/new/NewMatchedFilter.vhd2default:default2
162default:default2
MF2default:default2$
NewMatchedFilter2default:default2I
3O:/engs128/lab5/lab5.srcs/sources_1/new/ModemRx.vhd2default:default2
2132default:default8@Z8-3491h px
�
synthesizing module '%s'638*oasys2$
NewMatchedFilter2default:default2R
<O:/engs128/lab5/lab5.srcs/sources_1/new/NewMatchedFilter.vhd2default:default2
292default:default8@Z8-638h px
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2"
fir_compiler_32default:default2q
]O:/engs128/lab5/lab5.runs/synth_1/.Xil/Vivado-5936-VLAB-049/realtime/fir_compiler_3_stub.vhdl2default:default2
52default:default2
FIR2default:default2"
fir_compiler_32default:default2R
<O:/engs128/lab5/lab5.srcs/sources_1/new/NewMatchedFilter.vhd2default:default2
512default:default8@Z8-3491h px
�
synthesizing module '%s'638*oasys2"
fir_compiler_32default:default2s
]O:/engs128/lab5/lab5.runs/synth_1/.Xil/Vivado-5936-VLAB-049/realtime/fir_compiler_3_stub.vhdl2default:default2
172default:default8@Z8-638h px
�
%done synthesizing module '%s' (%s#%s)256*oasys2$
NewMatchedFilter2default:default2
122default:default2
12default:default2R
<O:/engs128/lab5/lab5.srcs/sources_1/new/NewMatchedFilter.vhd2default:default2
292default:default8@Z8-256h px
X
%s*synth2C
/	Parameter WIDTH bound to: 16 - type: integer 
2default:defaulth px
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
CRloop2default:default2]
IO:/engs128/lab4_withCRLoop/lab4.srcs/sources_1/imports/Desktop/CRloop.vhd2default:default2
302default:default2(
CarriageRecoveryLoop2default:default2
CRloop2default:default2I
3O:/engs128/lab5/lab5.srcs/sources_1/new/ModemRx.vhd2default:default2
2252default:default8@Z8-3491h px
�
synthesizing module '%s'638*oasys2*
CRloop__parameterized02default:default2_
IO:/engs128/lab4_withCRLoop/lab4.srcs/sources_1/imports/Desktop/CRloop.vhd2default:default2
422default:default8@Z8-638h px
X
%s*synth2C
/	Parameter WIDTH bound to: 16 - type: integer 
2default:defaulth px
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2"
dds_compiler_12default:default2q
]O:/engs128/lab5/lab5.runs/synth_1/.Xil/Vivado-5936-VLAB-049/realtime/dds_compiler_1_stub.vhdl2default:default2
52default:default2
	SinCosLUT2default:default2"
dds_compiler_12default:default2_
IO:/engs128/lab4_withCRLoop/lab4.srcs/sources_1/imports/Desktop/CRloop.vhd2default:default2
1592default:default8@Z8-3491h px
�
synthesizing module '%s'638*oasys2"
dds_compiler_12default:default2s
]O:/engs128/lab5/lab5.runs/synth_1/.Xil/Vivado-5936-VLAB-049/realtime/dds_compiler_1_stub.vhdl2default:default2
162default:default8@Z8-638h px
�
%done synthesizing module '%s' (%s#%s)256*oasys2*
CRloop__parameterized02default:default2
132default:default2
12default:default2_
IO:/engs128/lab4_withCRLoop/lab4.srcs/sources_1/imports/Desktop/CRloop.vhd2default:default2
422default:default8@Z8-256h px
_
%s*synth2J
6	Parameter DATA_NUM_BITS bound to: 8 - type: integer 
2default:defaulth px
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2"
IQDeserializer2default:default2V
BO:/engs128/lab3/lab2.srcs/sources_1/imports/new/IQDeserializer.vhd2default:default2
142default:default2
IQToChar2default:default2"
IQDeserializer2default:default2I
3O:/engs128/lab5/lab5.srcs/sources_1/new/ModemRx.vhd2default:default2
2392default:default8@Z8-3491h px
�
synthesizing module '%s'638*oasys22
IQDeserializer__parameterized02default:default2X
BO:/engs128/lab3/lab2.srcs/sources_1/imports/new/IQDeserializer.vhd2default:default2
272default:default8@Z8-638h px
_
%s*synth2J
6	Parameter DATA_NUM_BITS bound to: 8 - type: integer 
2default:defaulth px
�
default block is never used226*oasys2X
BO:/engs128/lab3/lab2.srcs/sources_1/imports/new/IQDeserializer.vhd2default:default2
1502default:default8@Z8-226h px
�
%done synthesizing module '%s' (%s#%s)256*oasys22
IQDeserializer__parameterized02default:default2
142default:default2
12default:default2X
BO:/engs128/lab3/lab2.srcs/sources_1/imports/new/IQDeserializer.vhd2default:default2
272default:default8@Z8-256h px
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
SerialTx2default:default2Q
=O:/engs128/lab3/lab2.srcs/sources_1/imports/Lab1/SerialTx.vhd2default:default2
242default:default2
Transmitter2default:default2
SerialTx2default:default2I
3O:/engs128/lab5/lab5.srcs/sources_1/new/ModemRx.vhd2default:default2
2532default:default8@Z8-3491h px
�
synthesizing module '%s'638*oasys2
SerialTx2default:default2S
=O:/engs128/lab3/lab2.srcs/sources_1/imports/Lab1/SerialTx.vhd2default:default2
322default:default8@Z8-638h px
�
%done synthesizing module '%s' (%s#%s)256*oasys2
SerialTx2default:default2
152default:default2
12default:default2S
=O:/engs128/lab3/lab2.srcs/sources_1/imports/Lab1/SerialTx.vhd2default:default2
322default:default8@Z8-256h px
�
%done synthesizing module '%s' (%s#%s)256*oasys2
ModemRx2default:default2
162default:default2
12default:default2I
3O:/engs128/lab5/lab5.srcs/sources_1/new/ModemRx.vhd2default:default2
322default:default8@Z8-256h px
�
%done synthesizing module '%s' (%s#%s)256*oasys2
lab3top2default:default2
172default:default2
12default:default2I
3O:/engs128/lab5/lab5.srcs/sources_1/new/lab3top.vhd2default:default2
382default:default8@Z8-256h px
�
%s*synth2�
xFinished RTL Elaboration : Time (s): cpu = 00:00:14 ; elapsed = 00:00:36 . Memory (MB): peak = 275.242 ; gain = 115.930
2default:defaulth px
A
%s*synth2,

Report Check Netlist: 
2default:defaulth px
r
%s*synth2]
I+------+------------------+-------+---------+-------+------------------+
2default:defaulth px
r
%s*synth2]
I|      |Item              |Errors |Warnings |Status |Description       |
2default:defaulth px
r
%s*synth2]
I+------+------------------+-------+---------+-------+------------------+
2default:defaulth px
r
%s*synth2]
I|1     |multi_driven_nets |      0|        0|Passed |Multi driven nets |
2default:defaulth px
r
%s*synth2]
I+------+------------------+-------+---------+-------+------------------+
2default:defaulth px
{
%s*synth2f
R---------------------------------------------------------------------------------
2default:defaulth px
�
%s*synth2�
�Finished RTL Optimization Phase 1 : Time (s): cpu = 00:00:14 ; elapsed = 00:00:37 . Memory (MB): peak = 275.242 ; gain = 115.930
2default:defaulth px
{
%s*synth2f
R---------------------------------------------------------------------------------
2default:defaulth px
�
Loading clock regions from %s
13*device2k
WC:/Xilinx/v2014.4/Vivado/2014.4/data\parts/xilinx/artix7/artix7/xc7a35t/ClockRegion.xml2default:defaultZ21-13h px
�
Loading clock buffers from %s
11*device2l
XC:/Xilinx/v2014.4/Vivado/2014.4/data\parts/xilinx/artix7/artix7/xc7a35t/ClockBuffers.xml2default:defaultZ21-11h px
�
&Loading clock placement rules from %s
318*place2a
MC:/Xilinx/v2014.4/Vivado/2014.4/data/parts/xilinx/artix7/ClockPlacerRules.xml2default:defaultZ30-318h px
�
)Loading package pin functions from %s...
17*device2]
IC:/Xilinx/v2014.4/Vivado/2014.4/data\parts/xilinx/artix7/PinFunctions.xml2default:defaultZ21-17h px
�
Loading package from %s
16*device2n
ZC:/Xilinx/v2014.4/Vivado/2014.4/data\parts/xilinx/artix7/artix7/xc7a35t/cpg236/Package.xml2default:defaultZ21-16h px
�
Loading io standards from %s
15*device2^
JC:/Xilinx/v2014.4/Vivado/2014.4/data\./parts/xilinx/artix7/IOStandards.xml2default:defaultZ21-15h px
�
+Loading device configuration modes from %s
14*device2\
HC:/Xilinx/v2014.4/Vivado/2014.4/data\parts/xilinx/artix7/ConfigModes.xml2default:defaultZ21-14h px
H
)Preparing netlist for logic optimization
349*projectZ1-570h px
;

Processing XDC Constraints
244*projectZ1-262h px
:
Initializing timing engine
348*projectZ1-569h px
�
$Parsing XDC File [%s] for cell '%s'
848*designutils2i
UO:/engs128/lab5/lab5.runs/synth_1/.Xil/Vivado-5936-VLAB-049/dcp_3/MMCM_in_context.xdc2default:default2#
SPIClkGenerator2default:defaultZ20-848h px
�
-Finished Parsing XDC File [%s] for cell '%s'
847*designutils2i
UO:/engs128/lab5/lab5.runs/synth_1/.Xil/Vivado-5936-VLAB-049/dcp_3/MMCM_in_context.xdc2default:default2#
SPIClkGenerator2default:defaultZ20-847h px
�
Parsing XDC File [%s]
179*designutils2V
BO:/engs128/lab3/lab2.srcs/constrs_1/imports/Lab1/Basys3_Master.xdc2default:defaultZ20-179h px
�
Finished Parsing XDC File [%s]
178*designutils2V
BO:/engs128/lab3/lab2.srcs/constrs_1/imports/Lab1/Basys3_Master.xdc2default:defaultZ20-178h px
E
&Completed Processing XDC Constraints

245*projectZ1-263h px
{
!Unisim Transformation Summary:
%s111*project29
%No Unisim elements were transformed.
2default:defaultZ1-111h px
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common24
 Constraint Validation Runtime : 2default:default2
00:00:002default:default2 
00:00:00.0462default:default2
575.9452default:default2
0.0002default:defaultZ17-268h px
{
%s*synth2f
R---------------------------------------------------------------------------------
2default:defaulth px
�
%s*synth2�
~Finished Constraint Validation : Time (s): cpu = 00:00:32 ; elapsed = 00:01:04 . Memory (MB): peak = 575.945 ; gain = 416.633
2default:defaulth px
{
%s*synth2f
R---------------------------------------------------------------------------------
2default:defaulth px
{
%s*synth2f
R---------------------------------------------------------------------------------
2default:defaulth px
S
%s*synth2>
*Start Loading Part and Timing Information
2default:defaulth px
{
%s*synth2f
R---------------------------------------------------------------------------------
2default:defaulth px
G
%s*synth22
Loading part: xc7a35tcpg236-1
2default:defaulth px
{
%s*synth2f
R---------------------------------------------------------------------------------
2default:defaulth px
�
%s*synth2�
�Finished Loading Part and Timing Information : Time (s): cpu = 00:00:32 ; elapsed = 00:01:04 . Memory (MB): peak = 575.945 ; gain = 416.633
2default:defaulth px
{
%s*synth2f
R---------------------------------------------------------------------------------
2default:defaulth px
{
%s*synth2f
R---------------------------------------------------------------------------------
2default:defaulth px
W
%s*synth2B
.Start Applying 'set_property' XDC Constraints
2default:defaulth px
{
%s*synth2f
R---------------------------------------------------------------------------------
2default:defaulth px
{
%s*synth2f
R---------------------------------------------------------------------------------
2default:defaulth px
�
%s*synth2�
�Finished applying 'set_property' XDC Constraints : Time (s): cpu = 00:00:33 ; elapsed = 00:01:05 . Memory (MB): peak = 575.945 ; gain = 416.633
2default:defaulth px
{
%s*synth2f
R---------------------------------------------------------------------------------
2default:defaulth px
�
3inferred FSM for state register '%s' in module '%s'802*oasys2"
curr_state_reg2default:default2
SerialRx2default:defaultZ8-802h px
j
%s*synth2U
AROM "rx_sample" won't be mapped to RAM because it is too sparse.
2default:defaulth px
�
%s*synth2x
dROM "rx_reg_full" won't be mapped to Block RAM because address size (4) smaller than threshold (5) 
2default:defaulth px
�
%s*synth2v
bROM "rx_output" won't be mapped to Block RAM because address size (3) smaller than threshold (5) 
2default:defaulth px
�
%s*synth2u
aROM "rx_shift" won't be mapped to Block RAM because address size (3) smaller than threshold (5) 
2default:defaulth px
�
%s*synth2t
`ROM "rx_init" won't be mapped to Block RAM because address size (3) smaller than threshold (5) 
2default:defaulth px
�
%s*synth2y
eROM "rx_done_tick" won't be mapped to Block RAM because address size (3) smaller than threshold (5) 
2default:defaulth px
�
%s*synth2w
cROM "next_state" won't be mapped to Block RAM because address size (1) smaller than threshold (5) 
2default:defaulth px
�
%s*synth2z
fROM "dataForBuffer" won't be mapped to Block RAM because address size (2) smaller than threshold (5) 
2default:defaulth px
q
%s*synth2\
HROM "lineFeedDetected" won't be mapped to RAM because it is too sparse.
2default:defaulth px
�
%s*synth2�
pROM "canSendMoreSymbols" won't be mapped to RAM because address size (32) is larger than maximum supported(18) 
2default:defaulth px
�
%s*synth2x
dROM "bitIdx" won't be mapped to RAM because address size (32) is larger than maximum supported(18) 
2default:defaulth px
k
%s*synth2V
BROM "next_state" won't be mapped to RAM because it is too sparse.
2default:defaulth px
�
%s*synth2|
hROM "diff_encode_out" won't be mapped to Block RAM because address size (4) smaller than threshold (5) 
2default:defaulth px
�
}HDL ADVISOR - The operator resource <%s> is shared. To prevent sharing consider applying a KEEP on the inputs of the operator3413*oasys2

multiplier2default:default2K
5O:/engs128/lab5/lab5.srcs/sources_1/new/Modulator.vhd2default:default2
942default:default8@Z8-3537h px
�
RFound unconnected internal register '%s' and it is trimmed from '%s' to '%s' bits.3455*oasys2"
qpskSignal_reg2default:default2
302default:default2
292default:default2K
5O:/engs128/lab5/lab5.srcs/sources_1/new/Modulator.vhd2default:default2
1122default:default8@Z8-3936h px
�
%s*synth2�
nROM "dacInterface_out_busy" won't be mapped to Block RAM because address size (2) smaller than threshold (5) 
2default:defaulth px
�
%s*synth2{
gROM "parallelLoadEn" won't be mapped to Block RAM because address size (2) smaller than threshold (5) 
2default:defaulth px
�
RFound unconnected internal register '%s' and it is trimmed from '%s' to '%s' bits.3455*oasys2
	temp1_reg2default:default2
162default:default2
152default:default2M
7O:/engs128/lab5/lab5.srcs/sources_1/imports/new/ADC.vhd2default:default2
812default:default8@Z8-3936h px
�
%s*synth2{
gROM "conversionDone" won't be mapped to Block RAM because address size (2) smaller than threshold (5) 
2default:defaulth px
�
%s*synth2v
bROM "PE_strobe" won't be mapped to Block RAM because address size (4) smaller than threshold (5) 
2default:defaulth px
k
%s*synth2V
BROM "next_state" won't be mapped to RAM because it is too sparse.
2default:defaulth px
k
%s*synth2V
BROM "next_state" won't be mapped to RAM because it is too sparse.
2default:defaulth px
�
%s*synth2y
eROM "symb_dec_out" won't be mapped to Block RAM because address size (4) smaller than threshold (5) 
2default:defaulth px
�
3inferred FSM for state register '%s' in module '%s'802*oasys2"
curr_state_reg2default:default2
SerialTx2default:defaultZ8-802h px
h
%s*synth2S
?ROM "br_tick" won't be mapped to RAM because it is too sparse.
2default:defaulth px
�
%s*synth2u
aROM "tx_empty" won't be mapped to Block RAM because address size (4) smaller than threshold (5) 
2default:defaulth px
�
%s*synth2u
aROM "tx_shift" won't be mapped to Block RAM because address size (3) smaller than threshold (5) 
2default:defaulth px
�
%s*synth2t
`ROM "tx_load" won't be mapped to Block RAM because address size (3) smaller than threshold (5) 
2default:defaulth px
�
%s*synth2y
eROM "tx_done_tick" won't be mapped to Block RAM because address size (3) smaller than threshold (5) 
2default:defaulth px
�
%s*synth2�
lROM "sampleClkRisingEdge" won't be mapped to Block RAM because address size (2) smaller than threshold (5) 
2default:defaulth px
j
%s*synth2U
AROM "symbolClk" won't be mapped to RAM because it is too sparse.
2default:defaulth px
�
Gencoded FSM with state register '%s' using encoding '%s' in module '%s'3353*oasys2"
curr_state_reg2default:default2

sequential2default:default2
SerialRx2default:defaultZ8-3354h px
�
Gencoded FSM with state register '%s' using encoding '%s' in module '%s'3353*oasys2"
curr_state_reg2default:default2

sequential2default:default2
SerialTx2default:defaultZ8-3354h px
{
%s*synth2f
R---------------------------------------------------------------------------------
2default:defaulth px
�
%s*synth2�
�Finished RTL Optimization Phase 2 : Time (s): cpu = 00:00:34 ; elapsed = 00:01:07 . Memory (MB): peak = 575.945 ; gain = 416.633
2default:defaulth px
{
%s*synth2f
R---------------------------------------------------------------------------------
2default:defaulth px
B
%s*synth2-

Report RTL Partitions: 
2default:defaulth px
T
%s*synth2?
++-+--------------+------------+----------+
2default:defaulth px
T
%s*synth2?
+| |RTL Partition |Replication |Instances |
2default:defaulth px
T
%s*synth2?
++-+--------------+------------+----------+
2default:defaulth px
T
%s*synth2?
++-+--------------+------------+----------+
2default:defaulth px
{
%s*synth2f
R---------------------------------------------------------------------------------
2default:defaulth px
I
%s*synth24
 Start RTL Component Statistics 
2default:defaulth px
{
%s*synth2f
R---------------------------------------------------------------------------------
2default:defaulth px
H
%s*synth23
Detailed RTL Component Info : 
2default:defaulth px
7
%s*synth2"
+---Adders : 
2default:defaulth px
W
%s*synth2B
.	   2 Input     32 Bit       Adders := 1     
2default:defaulth px
W
%s*synth2B
.	   3 Input     16 Bit       Adders := 1     
2default:defaulth px
W
%s*synth2B
.	   2 Input     12 Bit       Adders := 1     
2default:defaulth px
W
%s*synth2B
.	   2 Input     10 Bit       Adders := 2     
2default:defaulth px
W
%s*synth2B
.	   2 Input      4 Bit       Adders := 6     
2default:defaulth px
W
%s*synth2B
.	   2 Input      3 Bit       Adders := 2     
2default:defaulth px
W
%s*synth2B
.	   2 Input      2 Bit       Adders := 1     
2default:defaulth px
:
%s*synth2%
+---Registers : 
2default:defaulth px
W
%s*synth2B
.	               30 Bit    Registers := 1     
2default:defaulth px
W
%s*synth2B
.	               29 Bit    Registers := 1     
2default:defaulth px
W
%s*synth2B
.	               16 Bit    Registers := 16    
2default:defaulth px
W
%s*synth2B
.	               15 Bit    Registers := 1     
2default:defaulth px
W
%s*synth2B
.	               14 Bit    Registers := 2     
2default:defaulth px
W
%s*synth2B
.	               12 Bit    Registers := 4     
2default:defaulth px
W
%s*synth2B
.	               10 Bit    Registers := 4     
2default:defaulth px
W
%s*synth2B
.	                8 Bit    Registers := 3     
2default:defaulth px
W
%s*synth2B
.	                4 Bit    Registers := 8     
2default:defaulth px
W
%s*synth2B
.	                3 Bit    Registers := 6     
2default:defaulth px
W
%s*synth2B
.	                2 Bit    Registers := 11    
2default:defaulth px
W
%s*synth2B
.	                1 Bit    Registers := 10    
2default:defaulth px
6
%s*synth2!
+---Muxes : 
2default:defaulth px
W
%s*synth2B
.	   2 Input     16 Bit        Muxes := 7     
2default:defaulth px
W
%s*synth2B
.	   2 Input     14 Bit        Muxes := 1     
2default:defaulth px
W
%s*synth2B
.	   2 Input     12 Bit        Muxes := 4     
2default:defaulth px
W
%s*synth2B
.	   4 Input     12 Bit        Muxes := 2     
2default:defaulth px
W
%s*synth2B
.	   2 Input     10 Bit        Muxes := 3     
2default:defaulth px
W
%s*synth2B
.	   2 Input      8 Bit        Muxes := 1     
2default:defaulth px
W
%s*synth2B
.	  16 Input      7 Bit        Muxes := 1     
2default:defaulth px
W
%s*synth2B
.	   4 Input      4 Bit        Muxes := 2     
2default:defaulth px
W
%s*synth2B
.	   9 Input      4 Bit        Muxes := 1     
2default:defaulth px
W
%s*synth2B
.	   6 Input      3 Bit        Muxes := 2     
2default:defaulth px
W
%s*synth2B
.	   2 Input      3 Bit        Muxes := 4     
2default:defaulth px
W
%s*synth2B
.	   8 Input      3 Bit        Muxes := 4     
2default:defaulth px
W
%s*synth2B
.	   9 Input      2 Bit        Muxes := 1     
2default:defaulth px
W
%s*synth2B
.	   2 Input      2 Bit        Muxes := 3     
2default:defaulth px
W
%s*synth2B
.	   4 Input      2 Bit        Muxes := 8     
2default:defaulth px
W
%s*synth2B
.	   2 Input      1 Bit        Muxes := 39    
2default:defaulth px
W
%s*synth2B
.	   5 Input      1 Bit        Muxes := 5     
2default:defaulth px
W
%s*synth2B
.	   9 Input      1 Bit        Muxes := 4     
2default:defaulth px
W
%s*synth2B
.	   6 Input      1 Bit        Muxes := 7     
2default:defaulth px
W
%s*synth2B
.	   4 Input      1 Bit        Muxes := 18    
2default:defaulth px
W
%s*synth2B
.	   8 Input      1 Bit        Muxes := 6     
2default:defaulth px
W
%s*synth2B
.	   7 Input      1 Bit        Muxes := 4     
2default:defaulth px
{
%s*synth2f
R---------------------------------------------------------------------------------
2default:defaulth px
L
%s*synth27
#Finished RTL Component Statistics 
2default:defaulth px
{
%s*synth2f
R---------------------------------------------------------------------------------
2default:defaulth px
{
%s*synth2f
R---------------------------------------------------------------------------------
2default:defaulth px
V
%s*synth2A
-Start RTL Hierarchical Component Statistics 
2default:defaulth px
{
%s*synth2f
R---------------------------------------------------------------------------------
2default:defaulth px
L
%s*synth27
#Hierarchical RTL Component report 
2default:defaulth px
9
%s*synth2$
Module lab3top 
2default:defaulth px
H
%s*synth23
Detailed RTL Component Info : 
2default:defaulth px
7
%s*synth2"
+---Adders : 
2default:defaulth px
W
%s*synth2B
.	   2 Input     12 Bit       Adders := 1     
2default:defaulth px
:
%s*synth2%
+---Registers : 
2default:defaulth px
W
%s*synth2B
.	               12 Bit    Registers := 1     
2default:defaulth px
W
%s*synth2B
.	                1 Bit    Registers := 1     
2default:defaulth px
6
%s*synth2!
+---Muxes : 
2default:defaulth px
W
%s*synth2B
.	   2 Input     12 Bit        Muxes := 1     
2default:defaulth px
W
%s*synth2B
.	   2 Input      1 Bit        Muxes := 1     
2default:defaulth px
:
%s*synth2%
Module SerialRx 
2default:defaulth px
H
%s*synth23
Detailed RTL Component Info : 
2default:defaulth px
7
%s*synth2"
+---Adders : 
2default:defaulth px
W
%s*synth2B
.	   2 Input     10 Bit       Adders := 1     
2default:defaulth px
W
%s*synth2B
.	   2 Input      4 Bit       Adders := 1     
2default:defaulth px
:
%s*synth2%
+---Registers : 
2default:defaulth px
W
%s*synth2B
.	               10 Bit    Registers := 2     
2default:defaulth px
W
%s*synth2B
.	                8 Bit    Registers := 1     
2default:defaulth px
W
%s*synth2B
.	                4 Bit    Registers := 1     
2default:defaulth px
W
%s*synth2B
.	                2 Bit    Registers := 1     
2default:defaulth px
W
%s*synth2B
.	                1 Bit    Registers := 1     
2default:defaulth px
6
%s*synth2!
+---Muxes : 
2default:defaulth px
W
%s*synth2B
.	   2 Input     10 Bit        Muxes := 1     
2default:defaulth px
W
%s*synth2B
.	   6 Input      3 Bit        Muxes := 1     
2default:defaulth px
W
%s*synth2B
.	   2 Input      1 Bit        Muxes := 3     
2default:defaulth px
W
%s*synth2B
.	   5 Input      1 Bit        Muxes := 5     
2default:defaulth px
9
%s*synth2$
Module mux7seg 
2default:defaulth px
H
%s*synth23
Detailed RTL Component Info : 
2default:defaulth px
7
%s*synth2"
+---Adders : 
2default:defaulth px
W
%s*synth2B
.	   2 Input      2 Bit       Adders := 1     
2default:defaulth px
:
%s*synth2%
+---Registers : 
2default:defaulth px
W
%s*synth2B
.	                2 Bit    Registers := 1     
2default:defaulth px
W
%s*synth2B
.	                1 Bit    Registers := 1     
2default:defaulth px
6
%s*synth2!
+---Muxes : 
2default:defaulth px
W
%s*synth2B
.	  16 Input      7 Bit        Muxes := 1     
2default:defaulth px
W
%s*synth2B
.	   4 Input      4 Bit        Muxes := 2     
2default:defaulth px
B
%s*synth2-
Module CharBufferModule 
2default:defaulth px
H
%s*synth23
Detailed RTL Component Info : 
2default:defaulth px
:
%s*synth2%
+---Registers : 
2default:defaulth px
W
%s*synth2B
.	                4 Bit    Registers := 1     
2default:defaulth px
6
%s*synth2!
+---Muxes : 
2default:defaulth px
W
%s*synth2B
.	   2 Input      8 Bit        Muxes := 1     
2default:defaulth px
W
%s*synth2B
.	   9 Input      4 Bit        Muxes := 1     
2default:defaulth px
W
%s*synth2B
.	   2 Input      3 Bit        Muxes := 1     
2default:defaulth px
W
%s*synth2B
.	   9 Input      2 Bit        Muxes := 1     
2default:defaulth px
W
%s*synth2B
.	   2 Input      2 Bit        Muxes := 1     
2default:defaulth px
W
%s*synth2B
.	   9 Input      1 Bit        Muxes := 4     
2default:defaulth px
W
%s*synth2B
.	   2 Input      1 Bit        Muxes := 1     
2default:defaulth px
N
%s*synth29
%Module IQSerializer__parameterized0 
2default:defaulth px
H
%s*synth23
Detailed RTL Component Info : 
2default:defaulth px
7
%s*synth2"
+---Adders : 
2default:defaulth px
W
%s*synth2B
.	   2 Input     32 Bit       Adders := 1     
2default:defaulth px
:
%s*synth2%
+---Registers : 
2default:defaulth px
W
%s*synth2B
.	                3 Bit    Registers := 1     
2default:defaulth px
W
%s*synth2B
.	                2 Bit    Registers := 1     
2default:defaulth px
W
%s*synth2B
.	                1 Bit    Registers := 3     
2default:defaulth px
6
%s*synth2!
+---Muxes : 
2default:defaulth px
W
%s*synth2B
.	   2 Input      3 Bit        Muxes := 2     
2default:defaulth px
W
%s*synth2B
.	   6 Input      3 Bit        Muxes := 1     
2default:defaulth px
W
%s*synth2B
.	   4 Input      2 Bit        Muxes := 1     
2default:defaulth px
W
%s*synth2B
.	   6 Input      1 Bit        Muxes := 7     
2default:defaulth px
W
%s*synth2B
.	   2 Input      1 Bit        Muxes := 4     
2default:defaulth px
W
%s*synth2B
.	   4 Input      1 Bit        Muxes := 2     
2default:defaulth px
J
%s*synth25
!Module CharToIQ__parameterized0 
2default:defaulth px
H
%s*synth23
Detailed RTL Component Info : 
2default:defaulth px
=
%s*synth2(
Module PulseShaper 
2default:defaulth px
H
%s*synth23
Detailed RTL Component Info : 
2default:defaulth px
:
%s*synth2%
+---Registers : 
2default:defaulth px
W
%s*synth2B
.	               16 Bit    Registers := 2     
2default:defaulth px
;
%s*synth2&
Module Modulator 
2default:defaulth px
H
%s*synth23
Detailed RTL Component Info : 
2default:defaulth px
:
%s*synth2%
+---Registers : 
2default:defaulth px
W
%s*synth2B
.	               30 Bit    Registers := 1     
2default:defaulth px
W
%s*synth2B
.	               29 Bit    Registers := 1     
2default:defaulth px
W
%s*synth2B
.	               14 Bit    Registers := 2     
2default:defaulth px
W
%s*synth2B
.	                2 Bit    Registers := 1     
2default:defaulth px
6
%s*synth2!
+---Muxes : 
2default:defaulth px
W
%s*synth2B
.	   2 Input     16 Bit        Muxes := 1     
2default:defaulth px
W
%s*synth2B
.	   2 Input     14 Bit        Muxes := 1     
2default:defaulth px
W
%s*synth2B
.	   4 Input      2 Bit        Muxes := 1     
2default:defaulth px
W
%s*synth2B
.	   4 Input      1 Bit        Muxes := 7     
2default:defaulth px
W
%s*synth2B
.	   2 Input      1 Bit        Muxes := 1     
2default:defaulth px
E
%s*synth20
Module DAC__parameterized0 
2default:defaulth px
H
%s*synth23
Detailed RTL Component Info : 
2default:defaulth px
7
%s*synth2"
+---Adders : 
2default:defaulth px
W
%s*synth2B
.	   2 Input      4 Bit       Adders := 1     
2default:defaulth px
:
%s*synth2%
+---Registers : 
2default:defaulth px
W
%s*synth2B
.	               16 Bit    Registers := 1     
2default:defaulth px
W
%s*synth2B
.	                4 Bit    Registers := 1     
2default:defaulth px
W
%s*synth2B
.	                3 Bit    Registers := 1     
2default:defaulth px
W
%s*synth2B
.	                2 Bit    Registers := 1     
2default:defaulth px
6
%s*synth2!
+---Muxes : 
2default:defaulth px
W
%s*synth2B
.	   2 Input     16 Bit        Muxes := 1     
2default:defaulth px
W
%s*synth2B
.	   8 Input      3 Bit        Muxes := 1     
2default:defaulth px
W
%s*synth2B
.	   4 Input      2 Bit        Muxes := 1     
2default:defaulth px
W
%s*synth2B
.	   2 Input      1 Bit        Muxes := 7     
2default:defaulth px
W
%s*synth2B
.	   8 Input      1 Bit        Muxes := 2     
2default:defaulth px
W
%s*synth2B
.	   4 Input      1 Bit        Muxes := 1     
2default:defaulth px
9
%s*synth2$
Module ModemTx 
2default:defaulth px
H
%s*synth23
Detailed RTL Component Info : 
2default:defaulth px
6
%s*synth2!
+---Muxes : 
2default:defaulth px
W
%s*synth2B
.	   2 Input     16 Bit        Muxes := 2     
2default:defaulth px
N
%s*synth29
%Module ADCInterface__parameterized0 
2default:defaulth px
H
%s*synth23
Detailed RTL Component Info : 
2default:defaulth px
7
%s*synth2"
+---Adders : 
2default:defaulth px
W
%s*synth2B
.	   2 Input      4 Bit       Adders := 1     
2default:defaulth px
:
%s*synth2%
+---Registers : 
2default:defaulth px
W
%s*synth2B
.	               15 Bit    Registers := 1     
2default:defaulth px
W
%s*synth2B
.	               12 Bit    Registers := 1     
2default:defaulth px
W
%s*synth2B
.	                4 Bit    Registers := 1     
2default:defaulth px
W
%s*synth2B
.	                3 Bit    Registers := 1     
2default:defaulth px
W
%s*synth2B
.	                2 Bit    Registers := 1     
2default:defaulth px
6
%s*synth2!
+---Muxes : 
2default:defaulth px
W
%s*synth2B
.	   8 Input      3 Bit        Muxes := 1     
2default:defaulth px
W
%s*synth2B
.	   4 Input      2 Bit        Muxes := 1     
2default:defaulth px
W
%s*synth2B
.	   8 Input      1 Bit        Muxes := 2     
2default:defaulth px
W
%s*synth2B
.	   2 Input      1 Bit        Muxes := 9     
2default:defaulth px
W
%s*synth2B
.	   4 Input      1 Bit        Muxes := 1     
2default:defaulth px
=
%s*synth2(
Module Demodulator 
2default:defaulth px
H
%s*synth23
Detailed RTL Component Info : 
2default:defaulth px
7
%s*synth2"
+---Adders : 
2default:defaulth px
W
%s*synth2B
.	   2 Input      3 Bit       Adders := 1     
2default:defaulth px
:
%s*synth2%
+---Registers : 
2default:defaulth px
W
%s*synth2B
.	               12 Bit    Registers := 2     
2default:defaulth px
W
%s*synth2B
.	                3 Bit    Registers := 1     
2default:defaulth px
6
%s*synth2!
+---Muxes : 
2default:defaulth px
W
%s*synth2B
.	   2 Input     12 Bit        Muxes := 2     
2default:defaulth px
W
%s*synth2B
.	   4 Input     12 Bit        Muxes := 2     
2default:defaulth px
W
%s*synth2B
.	   2 Input      3 Bit        Muxes := 1     
2default:defaulth px
B
%s*synth2-
Module NewMatchedFilter 
2default:defaulth px
H
%s*synth23
Detailed RTL Component Info : 
2default:defaulth px
:
%s*synth2%
+---Registers : 
2default:defaulth px
W
%s*synth2B
.	               16 Bit    Registers := 2     
2default:defaulth px
H
%s*synth23
Module CRloop__parameterized0 
2default:defaulth px
H
%s*synth23
Detailed RTL Component Info : 
2default:defaulth px
7
%s*synth2"
+---Adders : 
2default:defaulth px
W
%s*synth2B
.	   3 Input     16 Bit       Adders := 1     
2default:defaulth px
W
%s*synth2B
.	   2 Input      4 Bit       Adders := 1     
2default:defaulth px
:
%s*synth2%
+---Registers : 
2default:defaulth px
W
%s*synth2B
.	               16 Bit    Registers := 10    
2default:defaulth px
W
%s*synth2B
.	                4 Bit    Registers := 1     
2default:defaulth px
6
%s*synth2!
+---Muxes : 
2default:defaulth px
W
%s*synth2B
.	   2 Input     16 Bit        Muxes := 2     
2default:defaulth px
W
%s*synth2B
.	   2 Input      1 Bit        Muxes := 1     
2default:defaulth px
P
%s*synth2;
'Module IQDeserializer__parameterized0 
2default:defaulth px
H
%s*synth23
Detailed RTL Component Info : 
2default:defaulth px
7
%s*synth2"
+---Adders : 
2default:defaulth px
W
%s*synth2B
.	   2 Input      3 Bit       Adders := 1     
2default:defaulth px
:
%s*synth2%
+---Registers : 
2default:defaulth px
W
%s*synth2B
.	                8 Bit    Registers := 2     
2default:defaulth px
W
%s*synth2B
.	                4 Bit    Registers := 1     
2default:defaulth px
W
%s*synth2B
.	                3 Bit    Registers := 1     
2default:defaulth px
W
%s*synth2B
.	                2 Bit    Registers := 2     
2default:defaulth px
6
%s*synth2!
+---Muxes : 
2default:defaulth px
W
%s*synth2B
.	   4 Input      2 Bit        Muxes := 2     
2default:defaulth px
W
%s*synth2B
.	   2 Input      2 Bit        Muxes := 2     
2default:defaulth px
W
%s*synth2B
.	   2 Input      1 Bit        Muxes := 1     
2default:defaulth px
W
%s*synth2B
.	   4 Input      1 Bit        Muxes := 4     
2default:defaulth px
:
%s*synth2%
Module SerialTx 
2default:defaulth px
H
%s*synth23
Detailed RTL Component Info : 
2default:defaulth px
7
%s*synth2"
+---Adders : 
2default:defaulth px
W
%s*synth2B
.	   2 Input     10 Bit       Adders := 1     
2default:defaulth px
W
%s*synth2B
.	   2 Input      4 Bit       Adders := 1     
2default:defaulth px
:
%s*synth2%
+---Registers : 
2default:defaulth px
W
%s*synth2B
.	               10 Bit    Registers := 2     
2default:defaulth px
W
%s*synth2B
.	                4 Bit    Registers := 1     
2default:defaulth px
W
%s*synth2B
.	                1 Bit    Registers := 1     
2default:defaulth px
6
%s*synth2!
+---Muxes : 
2default:defaulth px
W
%s*synth2B
.	   2 Input     10 Bit        Muxes := 2     
2default:defaulth px
W
%s*synth2B
.	   8 Input      3 Bit        Muxes := 1     
2default:defaulth px
W
%s*synth2B
.	   2 Input      1 Bit        Muxes := 3     
2default:defaulth px
W
%s*synth2B
.	   7 Input      1 Bit        Muxes := 4     
2default:defaulth px
9
%s*synth2$
Module ModemRx 
2default:defaulth px
H
%s*synth23
Detailed RTL Component Info : 
2default:defaulth px
:
%s*synth2%
+---Registers : 
2default:defaulth px
W
%s*synth2B
.	                2 Bit    Registers := 2     
2default:defaulth px
W
%s*synth2B
.	                1 Bit    Registers := 3     
2default:defaulth px
6
%s*synth2!
+---Muxes : 
2default:defaulth px
W
%s*synth2B
.	   2 Input     12 Bit        Muxes := 1     
2default:defaulth px
W
%s*synth2B
.	   4 Input      2 Bit        Muxes := 1     
2default:defaulth px
W
%s*synth2B
.	   4 Input      1 Bit        Muxes := 2     
2default:defaulth px
W
%s*synth2B
.	   2 Input      1 Bit        Muxes := 1     
2default:defaulth px
{
%s*synth2f
R---------------------------------------------------------------------------------
2default:defaulth px
X
%s*synth2C
/Finished RTL Hierarchical Component Statistics
2default:defaulth px
{
%s*synth2f
R---------------------------------------------------------------------------------
2default:defaulth px
{
%s*synth2f
R---------------------------------------------------------------------------------
2default:defaulth px
E
%s*synth20
Start Part Resource Summary
2default:defaulth px
{
%s*synth2f
R---------------------------------------------------------------------------------
2default:defaulth px
�
%s*synth2k
WPart Resources:
DSPs: 120 (col length:60)
BRAMs: 150 (col length: RAMB18 60 RAMB36 30)
2default:defaulth px
{
%s*synth2f
R---------------------------------------------------------------------------------
2default:defaulth px
H
%s*synth23
Finished Part Resource Summary
2default:defaulth px
{
%s*synth2f
R---------------------------------------------------------------------------------
2default:defaulth px
�
%s*synth2�
�Start Parallel Synthesis Optimization  : Time (s): cpu = 00:00:35 ; elapsed = 00:01:07 . Memory (MB): peak = 575.945 ; gain = 416.633
2default:defaulth px
{
%s*synth2f
R---------------------------------------------------------------------------------
2default:defaulth px
K
%s*synth26
"Start Cross Boundary Optimization
2default:defaulth px
{
%s*synth2f
R---------------------------------------------------------------------------------
2default:defaulth px
�
merging register '%s' into '%s'3619*oasys2A
-Receiver/CarriageRecoveryLoop/CRsin_reg[15:0]2default:default2A
-Receiver/CarriageRecoveryLoop/CRsin_reg[15:0]2default:default2_
IO:/engs128/lab4_withCRLoop/lab4.srcs/sources_1/imports/Desktop/CRloop.vhd2default:default2
1742default:default8@Z8-4471h px
�
merging register '%s' into '%s'3619*oasys2A
-Receiver/CarriageRecoveryLoop/CRcos_reg[15:0]2default:default2A
-Receiver/CarriageRecoveryLoop/CRcos_reg[15:0]2default:default2_
IO:/engs128/lab4_withCRLoop/lab4.srcs/sources_1/imports/Desktop/CRloop.vhd2default:default2
1732default:default8@Z8-4471h px
�
merging register '%s' into '%s'3619*oasys2G
3Receiver/CarriageRecoveryLoop/phase_error_reg[15:0]2default:default2G
3Receiver/CarriageRecoveryLoop/phase_error_reg[15:0]2default:default2_
IO:/engs128/lab4_withCRLoop/lab4.srcs/sources_1/imports/Desktop/CRloop.vhd2default:default2
1282default:default8@Z8-4471h px
�
merging register '%s' into '%s'3619*oasys2D
0Transmitter/QPSK_Modulator/dspReg_Mult_reg[29:0]2default:default2D
0Transmitter/QPSK_Modulator/dspReg_Mult_reg[29:0]2default:default2K
5O:/engs128/lab5/lab5.srcs/sources_1/new/Modulator.vhd2default:default2
952default:default8@Z8-4471h px
�
RFound unconnected internal register '%s' and it is trimmed from '%s' to '%s' bits.3455*oasys20
Receiver/ADCInFace/temp1_reg2default:default2
152default:default2
142default:default2M
7O:/engs128/lab5/lab5.srcs/sources_1/imports/new/ADC.vhd2default:default2
812default:default8@Z8-3936h px
�
%s*synth2�
�ROM "Transmitter/CharacterToIQ/CharBuffer/dataForBuffer" won't be mapped to Block RAM because address size (2) smaller than threshold (5) 
2default:defaulth px

%s*synth2j
VROM "Transmitter/Receiver/rx_sample" won't be mapped to RAM because it is too sparse.
2default:defaulth px
�
%s*synth2�
mROM "Transmitter/CharacterToIQ/CharBuffer/lineFeedDetected" won't be mapped to RAM because it is too sparse.
2default:defaulth px
�
%s*synth2�
�ROM "Transmitter/CharacterToIQ/Serializer/bitIdx" won't be mapped to RAM because address size (32) is larger than maximum supported(18) 
2default:defaulth px
�
%s*synth2�
�ROM "Transmitter/CharacterToIQ/Serializer/canSendMoreSymbols" won't be mapped to RAM because address size (32) is larger than maximum supported(18) 
2default:defaulth px
�
%s*synth2{
gROM "Transmitter/CharacterToIQ/Serializer/next_state" won't be mapped to RAM because it is too sparse.
2default:defaulth px
}
%s*synth2h
TROM "Receiver/IQToChar/next_state" won't be mapped to RAM because it is too sparse.
2default:defaulth px
}
%s*synth2h
TROM "Receiver/IQToChar/next_state" won't be mapped to RAM because it is too sparse.
2default:defaulth px
}
%s*synth2h
TROM "Receiver/Transmitter/br_tick" won't be mapped to RAM because it is too sparse.
2default:defaulth px
j
%s*synth2U
AROM "symbolClk" won't be mapped to RAM because it is too sparse.
2default:defaulth px
�
%s*synth2z
fDSP Report: Generating DSP Transmitter/QPSK_Modulator/dspReg_Accum_reg, operation Mode is: ((A*B)')'.
2default:defaulth px
�
%s*synth2�
�DSP Report: register Transmitter/QPSK_Modulator/dspReg_Accum_reg is absorbed into DSP Transmitter/QPSK_Modulator/dspReg_Accum_reg.
2default:defaulth px
�
%s*synth2�
�DSP Report: register Transmitter/QPSK_Modulator/dspReg_Mult_reg is absorbed into DSP Transmitter/QPSK_Modulator/dspReg_Accum_reg.
2default:defaulth px
�
%s*synth2r
^DSP Report: operator (null) is absorbed into DSP Transmitter/QPSK_Modulator/dspReg_Accum_reg.
2default:defaulth px
�
%s*synth2z
fDSP Report: Generating DSP Transmitter/QPSK_Modulator/qpskSignal_reg, operation Mode is: (C-(A*B)')'.
2default:defaulth px
�
%s*synth2�
DSP Report: register Transmitter/QPSK_Modulator/qpskSignal_reg is absorbed into DSP Transmitter/QPSK_Modulator/qpskSignal_reg.
2default:defaulth px
�
%s*synth2�
�DSP Report: register Transmitter/QPSK_Modulator/dspReg_Mult_reg is absorbed into DSP Transmitter/QPSK_Modulator/qpskSignal_reg.
2default:defaulth px
�
%s*synth2�
|DSP Report: operator Transmitter/QPSK_Modulator/qpskSignal0 is absorbed into DSP Transmitter/QPSK_Modulator/qpskSignal_reg.
2default:defaulth px
�
%s*synth2p
\DSP Report: operator (null) is absorbed into DSP Transmitter/QPSK_Modulator/qpskSignal_reg.
2default:defaulth px
�
%s*synth2l
XDSP Report: Generating DSP Receiver/CarriageRecoveryLoop/yI1, operation Mode is: A2*B2.
2default:defaulth px
�
%s*synth2�
uDSP Report: register Receiver/CarriageRecoveryLoop/CRcos_reg is absorbed into DSP Receiver/CarriageRecoveryLoop/yI1.
2default:defaulth px
�
%s*synth2}
iDSP Report: register Receiver/MF/mf_out_Ival_reg is absorbed into DSP Receiver/CarriageRecoveryLoop/yI1.
2default:defaulth px
�
%s*synth2�
oDSP Report: operator Receiver/CarriageRecoveryLoop/yI1 is absorbed into DSP Receiver/CarriageRecoveryLoop/yI1.
2default:defaulth px
�
%s*synth2w
cDSP Report: Generating DSP Receiver/CarriageRecoveryLoop/yI_reg, operation Mode is: (PCIN+A2*B2)'.
2default:defaulth px
�
%s*synth2�
xDSP Report: register Receiver/CarriageRecoveryLoop/CRsin_reg is absorbed into DSP Receiver/CarriageRecoveryLoop/yI_reg.
2default:defaulth px
�
%s*synth2�
lDSP Report: register Receiver/MF/mf_out_qVal_reg is absorbed into DSP Receiver/CarriageRecoveryLoop/yI_reg.
2default:defaulth px
�
%s*synth2�
uDSP Report: register Receiver/CarriageRecoveryLoop/yI_reg is absorbed into DSP Receiver/CarriageRecoveryLoop/yI_reg.
2default:defaulth px
�
%s*synth2�
rDSP Report: operator Receiver/CarriageRecoveryLoop/yI0 is absorbed into DSP Receiver/CarriageRecoveryLoop/yI_reg.
2default:defaulth px
�
%s*synth2�
rDSP Report: operator Receiver/CarriageRecoveryLoop/yI1 is absorbed into DSP Receiver/CarriageRecoveryLoop/yI_reg.
2default:defaulth px
�
%s*synth2l
XDSP Report: Generating DSP Receiver/CarriageRecoveryLoop/yQ2, operation Mode is: A2*B2.
2default:defaulth px
�
%s*synth2�
uDSP Report: register Receiver/CarriageRecoveryLoop/CRsin_reg is absorbed into DSP Receiver/CarriageRecoveryLoop/yQ2.
2default:defaulth px
�
%s*synth2}
iDSP Report: register Receiver/MF/mf_out_Ival_reg is absorbed into DSP Receiver/CarriageRecoveryLoop/yQ2.
2default:defaulth px
�
%s*synth2�
oDSP Report: operator Receiver/CarriageRecoveryLoop/yQ2 is absorbed into DSP Receiver/CarriageRecoveryLoop/yQ2.
2default:defaulth px
�
%s*synth2|
hDSP Report: Generating DSP Receiver/CarriageRecoveryLoop/yQ_reg, operation Mode is: (-PCIN+A2*B2+1-1)'.
2default:defaulth px
�
%s*synth2�
xDSP Report: register Receiver/CarriageRecoveryLoop/CRcos_reg is absorbed into DSP Receiver/CarriageRecoveryLoop/yQ_reg.
2default:defaulth px
�
%s*synth2�
lDSP Report: register Receiver/MF/mf_out_qVal_reg is absorbed into DSP Receiver/CarriageRecoveryLoop/yQ_reg.
2default:defaulth px
�
%s*synth2�
uDSP Report: register Receiver/CarriageRecoveryLoop/yQ_reg is absorbed into DSP Receiver/CarriageRecoveryLoop/yQ_reg.
2default:defaulth px
�
%s*synth2�
rDSP Report: operator Receiver/CarriageRecoveryLoop/yQ0 is absorbed into DSP Receiver/CarriageRecoveryLoop/yQ_reg.
2default:defaulth px
�
%s*synth2�
rDSP Report: operator Receiver/CarriageRecoveryLoop/yQ1 is absorbed into DSP Receiver/CarriageRecoveryLoop/yQ_reg.
2default:defaulth px
�
%s*synth2�
lDSP Report: Generating DSP Receiver/CarriageRecoveryLoop/x2_ploop_reg, operation Mode is: (C'+A2*(B:0x9))'.
2default:defaulth px
�
%s*synth2�
�DSP Report: register Receiver/CarriageRecoveryLoop/phase_error_reg is absorbed into DSP Receiver/CarriageRecoveryLoop/x2_ploop_reg.
2default:defaulth px
�
%s*synth2�
�DSP Report: register Receiver/CarriageRecoveryLoop/y_ploop_reg is absorbed into DSP Receiver/CarriageRecoveryLoop/x2_ploop_reg.
2default:defaulth px
�
%s*synth2�
�DSP Report: register Receiver/CarriageRecoveryLoop/x2_ploop_reg is absorbed into DSP Receiver/CarriageRecoveryLoop/x2_ploop_reg.
2default:defaulth px
�
%s*synth2�
~DSP Report: operator Receiver/CarriageRecoveryLoop/x2_ploop0 is absorbed into DSP Receiver/CarriageRecoveryLoop/x2_ploop_reg.
2default:defaulth px
�
%s*synth2�
~DSP Report: operator Receiver/CarriageRecoveryLoop/x2_ploop1 is absorbed into DSP Receiver/CarriageRecoveryLoop/x2_ploop_reg.
2default:defaulth px
�
%s*synth2�
mDSP Report: Generating DSP Receiver/CarriageRecoveryLoop/ph_accum0, operation Mode is: PCIN+(A2*(B:0x440))'.
2default:defaulth px
�
%s*synth2�
�DSP Report: register Receiver/CarriageRecoveryLoop/phase_error_reg is absorbed into DSP Receiver/CarriageRecoveryLoop/ph_accum0.
2default:defaulth px
�
%s*synth2�
~DSP Report: register Receiver/CarriageRecoveryLoop/x1_ploop_reg is absorbed into DSP Receiver/CarriageRecoveryLoop/ph_accum0.
2default:defaulth px
�
%s*synth2�
{DSP Report: operator Receiver/CarriageRecoveryLoop/ph_accum0 is absorbed into DSP Receiver/CarriageRecoveryLoop/ph_accum0.
2default:defaulth px
�
%s*synth2�
{DSP Report: operator Receiver/CarriageRecoveryLoop/x1_ploop0 is absorbed into DSP Receiver/CarriageRecoveryLoop/ph_accum0.
2default:defaulth px
�
%s*synth2y
eDSP Report: Generating DSP Receiver/CarriageRecoveryLoop/ph_accum_reg, operation Mode is: (PCIN+P)'.
2default:defaulth px
�
%s*synth2�
�DSP Report: register Receiver/CarriageRecoveryLoop/ph_accum_reg is absorbed into DSP Receiver/CarriageRecoveryLoop/ph_accum_reg.
2default:defaulth px
�
%s*synth2�
�DSP Report: operator Receiver/CarriageRecoveryLoop/ph_accum0_dspDelayedAccum is absorbed into DSP Receiver/CarriageRecoveryLoop/ph_accum_reg.
2default:defaulth px
{
%s*synth2f
R---------------------------------------------------------------------------------
2default:defaulth px
�
%s*synth2�
�Finished Cross Boundary Optimization : Time (s): cpu = 00:00:37 ; elapsed = 00:01:10 . Memory (MB): peak = 575.945 ; gain = 416.633
2default:defaulth px
{
%s*synth2f
R---------------------------------------------------------------------------------
2default:defaulth px
�
%s*synth2�
~Finished Parallel Reinference  : Time (s): cpu = 00:00:37 ; elapsed = 00:01:10 . Memory (MB): peak = 575.945 ; gain = 416.633
2default:defaulth px
B
%s*synth2-

Report RTL Partitions: 
2default:defaulth px
T
%s*synth2?
++-+--------------+------------+----------+
2default:defaulth px
T
%s*synth2?
+| |RTL Partition |Replication |Instances |
2default:defaulth px
T
%s*synth2?
++-+--------------+------------+----------+
2default:defaulth px
T
%s*synth2?
++-+--------------+------------+----------+
2default:defaulth px
�
%s*synth2v
b Sort Area is null Receiver/CarriageRecoveryLoop/x2_ploop_reg_9 : 0 2 : 127 878 : Used 1 time 100
2default:defaulth px
�
%s*synth2m
Y Sort Area is null Receiver/CarriageRecoveryLoop/yQ2_7 : 0 0 : 1969 4192 : Used 1 time 0
2default:defaulth px
�
%s*synth2m
Y Sort Area is null Receiver/CarriageRecoveryLoop/yQ2_7 : 0 1 : 2223 4192 : Used 1 time 0
2default:defaulth px
�
%s*synth2m
Y Sort Area is null Receiver/CarriageRecoveryLoop/yI1_4 : 0 0 : 1969 4065 : Used 1 time 0
2default:defaulth px
�
%s*synth2m
Y Sort Area is null Receiver/CarriageRecoveryLoop/yI1_4 : 0 1 : 2096 4065 : Used 1 time 0
2default:defaulth px
�
%s*synth2u
a Sort Area is null Transmitter/QPSK_Modulator/qpskSignal_reg_2 : 0 0 : 1919 1919 : Used 1 time 0
2default:defaulth px
�
%s*synth2w
c Sort Area is null Transmitter/QPSK_Modulator/dspReg_Accum_reg_0 : 0 0 : 1719 1719 : Used 1 time 0
2default:defaulth px
�
%s*synth2t
` Sort Area is null Receiver/CarriageRecoveryLoop/x2_ploop_reg_9 : 0 0 : 323 878 : Used 1 time 0
2default:defaulth px
�
%s*synth2t
` Sort Area is null Receiver/CarriageRecoveryLoop/x2_ploop_reg_9 : 0 1 : 428 878 : Used 1 time 0
2default:defaulth px
�
%s*synth2�
~---------------------------------------------------------------------------------
Start RAM, DSP and Shift Register Reporting
2default:defaulth px
{
%s*synth2f
R---------------------------------------------------------------------------------
2default:defaulth px
/
%s*synth2

DSP:
2default:defaulth px
�
%s*synth2�
�+------------+----------------------+--------------+--------+--------+--------+--------+--------+------+------+------+------+-------+------+------+
2default:defaulth px
�
%s*synth2�
�|Module Name | DSP Mapping          | Neg Edge Clk | A Size | B Size | C Size | D Size | P Size | AREG | BREG | CREG | DREG | ADREG | MREG | PREG | 
2default:defaulth px
�
%s*synth2�
�+------------+----------------------+--------------+--------+--------+--------+--------+--------+------+------+------+------+-------+------+------+
2default:defaulth px
�
%s*synth2�
�|Modulator   | ((A*B)')'            | No           | 16     | 14     | 48     | 25     | 30     | 0    | 0    | 1    | 1    | 1     | 1    | 1    | 
2default:defaulth px
�
%s*synth2�
�|Modulator   | (C-(A*B)')'          | No           | 16     | 14     | 29     | 25     | 29     | 0    | 0    | 0    | 1    | 1     | 1    | 1    | 
2default:defaulth px
�
%s*synth2�
�|CRloop      | A2*B2                | No           | 16     | 16     | 48     | 25     | 32     | 1    | 1    | 1    | 1    | 1     | 0    | 0    | 
2default:defaulth px
�
%s*synth2�
�|CRloop      | (PCIN+A2*B2)'        | No           | 16     | 16     | 32     | 25     | 32     | 1    | 1    | 1    | 1    | 1     | 0    | 1    | 
2default:defaulth px
�
%s*synth2�
�|CRloop      | A2*B2                | No           | 16     | 16     | 48     | 25     | 32     | 1    | 1    | 1    | 1    | 1     | 0    | 0    | 
2default:defaulth px
�
%s*synth2�
�|CRloop      | (-PCIN+A2*B2+1-1)'   | No           | 16     | 16     | 32     | 25     | 32     | 1    | 1    | 1    | 1    | 1     | 0    | 1    | 
2default:defaulth px
�
%s*synth2�
�|CRloop      | (C'+A2*(B:0x9))'     | No           | 16     | 5      | 32     | 25     | 32     | 1    | 0    | 1    | 1    | 1     | 0    | 1    | 
2default:defaulth px
�
%s*synth2�
�|CRloop      | PCIN+(A2*(B:0x440))' | No           | 16     | 12     | 32     | 25     | 32     | 1    | 0    | 1    | 1    | 1     | 1    | 0    | 
2default:defaulth px
�
%s*synth2�
�|CRloop      | (PCIN+P)'            | No           | 14     | 18     | 32     | -1     | 32     | 1    | 1    | 1    | 1    | 1     | 0    | 1    | 
2default:defaulth px
�
%s*synth2�
�+------------+----------------------+--------------+--------+--------+--------+--------+--------+------+------+------+------+-------+------+------+

2default:defaulth px
�
%s*synth2�
�Note: The table shows DSPs generated at current stage. Some DSP generation could be reversed due to later optimizations. Multiple instantiated DSPs are reported only once.
2default:defaulth px
�
%s*synth2�
�---------------------------------------------------------------------------------
Finished RAM, DSP and Shift Register Reporting
2default:defaulth px
{
%s*synth2f
R---------------------------------------------------------------------------------
2default:defaulth px
�
6propagating constant %s across sequential element (%s)3333*oasys2
12default:default28
$\Receiver/Transmitter/tx_reg_reg[9] 2default:defaultZ8-3333h px
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys28
$\Transmitter/Receiver/rx_reg_reg[0] 2default:default2
lab3top2default:defaultZ8-3332h px
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys26
"\Receiver/ADCInFace/temp1_reg[13] 2default:default2
lab3top2default:defaultZ8-3332h px
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys26
"\Receiver/ADCInFace/temp1_reg[12] 2default:default2
lab3top2default:defaultZ8-3332h px
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys28
$\Receiver/Transmitter/tx_reg_reg[9] 2default:default2
lab3top2default:defaultZ8-3332h px
{
%s*synth2f
R---------------------------------------------------------------------------------
2default:defaulth px
A
%s*synth2,
Start Area Optimization
2default:defaulth px
{
%s*synth2f
R---------------------------------------------------------------------------------
2default:defaulth px
{
%s*synth2f
R---------------------------------------------------------------------------------
2default:defaulth px
�
%s*synth2�
zFinished Area Optimization : Time (s): cpu = 00:00:40 ; elapsed = 00:01:13 . Memory (MB): peak = 575.945 ; gain = 416.633
2default:defaulth px
{
%s*synth2f
R---------------------------------------------------------------------------------
2default:defaulth px
{
%s*synth2f
R---------------------------------------------------------------------------------
2default:defaulth px
�
%s*synth2�
zFinished Area Optimization : Time (s): cpu = 00:00:40 ; elapsed = 00:01:13 . Memory (MB): peak = 575.945 ; gain = 416.633
2default:defaulth px
{
%s*synth2f
R---------------------------------------------------------------------------------
2default:defaulth px
�
%s*synth2�
�Finished Parallel Area Optimization  : Time (s): cpu = 00:00:40 ; elapsed = 00:01:13 . Memory (MB): peak = 575.945 ; gain = 416.633
2default:defaulth px
B
%s*synth2-

Report RTL Partitions: 
2default:defaulth px
T
%s*synth2?
++-+--------------+------------+----------+
2default:defaulth px
T
%s*synth2?
+| |RTL Partition |Replication |Instances |
2default:defaulth px
T
%s*synth2?
++-+--------------+------------+----------+
2default:defaulth px
T
%s*synth2?
++-+--------------+------------+----------+
2default:defaulth px
�
%s*synth2�
�Finished Parallel Synthesis Optimization  : Time (s): cpu = 00:00:40 ; elapsed = 00:01:13 . Memory (MB): peak = 575.945 ; gain = 416.633
2default:defaulth px
{
%s*synth2f
R---------------------------------------------------------------------------------
2default:defaulth px
C
%s*synth2.
Start Timing Optimization
2default:defaulth px
{
%s*synth2f
R---------------------------------------------------------------------------------
2default:defaulth px
{
%s*synth2f
R---------------------------------------------------------------------------------
2default:defaulth px
O
%s*synth2:
&Start Applying XDC Timing Constraints
2default:defaulth px
{
%s*synth2f
R---------------------------------------------------------------------------------
2default:defaulth px
�
%s*synth2l
XINFO: Moved 2 constraints on hierarchical pins to their respective driving/loading pins
2default:defaulth px
{
%s*synth2f
R---------------------------------------------------------------------------------
2default:defaulth px
�
%s*synth2�
�Finished Applying XDC Timing Constraints : Time (s): cpu = 00:01:17 ; elapsed = 00:01:54 . Memory (MB): peak = 607.770 ; gain = 448.457
2default:defaulth px
{
%s*synth2f
R---------------------------------------------------------------------------------
2default:defaulth px
{
%s*synth2f
R---------------------------------------------------------------------------------
2default:defaulth px
�
%s*synth2�
|Finished Timing Optimization : Time (s): cpu = 00:01:19 ; elapsed = 00:01:57 . Memory (MB): peak = 618.762 ; gain = 459.449
2default:defaulth px
{
%s*synth2f
R---------------------------------------------------------------------------------
2default:defaulth px
B
%s*synth2-

Report RTL Partitions: 
2default:defaulth px
T
%s*synth2?
++-+--------------+------------+----------+
2default:defaulth px
T
%s*synth2?
+| |RTL Partition |Replication |Instances |
2default:defaulth px
T
%s*synth2?
++-+--------------+------------+----------+
2default:defaulth px
T
%s*synth2?
++-+--------------+------------+----------+
2default:defaulth px
{
%s*synth2f
R---------------------------------------------------------------------------------
2default:defaulth px
B
%s*synth2-
Start Technology Mapping
2default:defaulth px
{
%s*synth2f
R---------------------------------------------------------------------------------
2default:defaulth px
{
%s*synth2f
R---------------------------------------------------------------------------------
2default:defaulth px
�
%s*synth2�
{Finished Technology Mapping : Time (s): cpu = 00:01:20 ; elapsed = 00:01:58 . Memory (MB): peak = 632.426 ; gain = 473.113
2default:defaulth px
{
%s*synth2f
R---------------------------------------------------------------------------------
2default:defaulth px
B
%s*synth2-

Report RTL Partitions: 
2default:defaulth px
T
%s*synth2?
++-+--------------+------------+----------+
2default:defaulth px
T
%s*synth2?
+| |RTL Partition |Replication |Instances |
2default:defaulth px
T
%s*synth2?
++-+--------------+------------+----------+
2default:defaulth px
T
%s*synth2?
++-+--------------+------------+----------+
2default:defaulth px
{
%s*synth2f
R---------------------------------------------------------------------------------
2default:defaulth px
<
%s*synth2'
Start IO Insertion
2default:defaulth px
{
%s*synth2f
R---------------------------------------------------------------------------------
2default:defaulth px
{
%s*synth2f
R---------------------------------------------------------------------------------
2default:defaulth px
N
%s*synth29
%Start Flattening Before IO Insertion
2default:defaulth px
{
%s*synth2f
R---------------------------------------------------------------------------------
2default:defaulth px
{
%s*synth2f
R---------------------------------------------------------------------------------
2default:defaulth px
Q
%s*synth2<
(Finished Flattening Before IO Insertion
2default:defaulth px
{
%s*synth2f
R---------------------------------------------------------------------------------
2default:defaulth px
{
%s*synth2f
R---------------------------------------------------------------------------------
2default:defaulth px
E
%s*synth20
Start Final Netlist Cleanup
2default:defaulth px
{
%s*synth2f
R---------------------------------------------------------------------------------
2default:defaulth px
�
,Flop %s is being inverted and renamed to %s.3906*oasys29
%Receiver/IQToChar/symb_dec_out_reg[1]2default:default2=
)Receiver/IQToChar/symb_dec_out_reg[1]_inv2default:defaultZ8-5365h px
�
,Flop %s is being inverted and renamed to %s.3906*oasys29
%Receiver/IQToChar/symb_dec_out_reg[0]2default:default2=
)Receiver/IQToChar/symb_dec_out_reg[0]_inv2default:defaultZ8-5365h px
{
%s*synth2f
R---------------------------------------------------------------------------------
2default:defaulth px
H
%s*synth23
Finished Final Netlist Cleanup
2default:defaulth px
{
%s*synth2f
R---------------------------------------------------------------------------------
2default:defaulth px
{
%s*synth2f
R---------------------------------------------------------------------------------
2default:defaulth px
�
%s*synth2�
uFinished IO Insertion : Time (s): cpu = 00:01:22 ; elapsed = 00:02:00 . Memory (MB): peak = 632.426 ; gain = 473.113
2default:defaulth px
{
%s*synth2f
R---------------------------------------------------------------------------------
2default:defaulth px
A
%s*synth2,

Report Check Netlist: 
2default:defaulth px
r
%s*synth2]
I+------+------------------+-------+---------+-------+------------------+
2default:defaulth px
r
%s*synth2]
I|      |Item              |Errors |Warnings |Status |Description       |
2default:defaulth px
r
%s*synth2]
I+------+------------------+-------+---------+-------+------------------+
2default:defaulth px
r
%s*synth2]
I|1     |multi_driven_nets |      0|        0|Passed |Multi driven nets |
2default:defaulth px
r
%s*synth2]
I+------+------------------+-------+---------+-------+------------------+
2default:defaulth px
{
%s*synth2f
R---------------------------------------------------------------------------------
2default:defaulth px
L
%s*synth27
#Start Renaming Generated Instances
2default:defaulth px
{
%s*synth2f
R---------------------------------------------------------------------------------
2default:defaulth px
{
%s*synth2f
R---------------------------------------------------------------------------------
2default:defaulth px
�
%s*synth2�
�Finished Renaming Generated Instances : Time (s): cpu = 00:01:22 ; elapsed = 00:02:00 . Memory (MB): peak = 632.426 ; gain = 473.113
2default:defaulth px
{
%s*synth2f
R---------------------------------------------------------------------------------
2default:defaulth px
B
%s*synth2-

Report RTL Partitions: 
2default:defaulth px
T
%s*synth2?
++-+--------------+------------+----------+
2default:defaulth px
T
%s*synth2?
+| |RTL Partition |Replication |Instances |
2default:defaulth px
T
%s*synth2?
++-+--------------+------------+----------+
2default:defaulth px
T
%s*synth2?
++-+--------------+------------+----------+
2default:defaulth px
{
%s*synth2f
R---------------------------------------------------------------------------------
2default:defaulth px
I
%s*synth24
 Start Rebuilding User Hierarchy
2default:defaulth px
{
%s*synth2f
R---------------------------------------------------------------------------------
2default:defaulth px
{
%s*synth2f
R---------------------------------------------------------------------------------
2default:defaulth px
�
%s*synth2�
�Finished Rebuilding User Hierarchy : Time (s): cpu = 00:01:22 ; elapsed = 00:02:00 . Memory (MB): peak = 632.426 ; gain = 473.113
2default:defaulth px
{
%s*synth2f
R---------------------------------------------------------------------------------
2default:defaulth px
�
%s*synth2�
~---------------------------------------------------------------------------------
Start RAM, DSP and Shift Register Reporting
2default:defaulth px
{
%s*synth2f
R---------------------------------------------------------------------------------
2default:defaulth px
�
%s*synth2�
�---------------------------------------------------------------------------------
Finished RAM, DSP and Shift Register Reporting
2default:defaulth px
{
%s*synth2f
R---------------------------------------------------------------------------------
2default:defaulth px
{
%s*synth2f
R---------------------------------------------------------------------------------
2default:defaulth px
H
%s*synth23
Start Writing Synthesis Report
2default:defaulth px
{
%s*synth2f
R---------------------------------------------------------------------------------
2default:defaulth px
>
%s*synth2)

Report BlackBoxes: 
2default:defaulth px
O
%s*synth2:
&+------+-----------------+----------+
2default:defaulth px
O
%s*synth2:
&|      |BlackBox name    |Instances |
2default:defaulth px
O
%s*synth2:
&+------+-----------------+----------+
2default:defaulth px
O
%s*synth2:
&|1     |MMCM             |         1|
2default:defaulth px
O
%s*synth2:
&|2     |dds_compiler_1   |         1|
2default:defaulth px
O
%s*synth2:
&|3     |fir_compiler_3   |         1|
2default:defaulth px
O
%s*synth2:
&|4     |fifo_generator_0 |         1|
2default:defaulth px
O
%s*synth2:
&|5     |fir_compiler_2   |         1|
2default:defaulth px
O
%s*synth2:
&|6     |dds_compiler_0   |         1|
2default:defaulth px
O
%s*synth2:
&+------+-----------------+----------+
2default:defaulth px
>
%s*synth2)

Report Cell Usage: 
2default:defaulth px
P
%s*synth2;
'+------+----------------------+------+
2default:defaulth px
P
%s*synth2;
'|      |Cell                  |Count |
2default:defaulth px
P
%s*synth2;
'+------+----------------------+------+
2default:defaulth px
P
%s*synth2;
'|1     |MMCM_bbox             |     1|
2default:defaulth px
P
%s*synth2;
'|2     |dds_compiler_0_bbox   |     1|
2default:defaulth px
P
%s*synth2;
'|3     |dds_compiler_1_bbox   |     1|
2default:defaulth px
P
%s*synth2;
'|4     |fifo_generator_0_bbox |     1|
2default:defaulth px
P
%s*synth2;
'|5     |fir_compiler_2_bbox   |     1|
2default:defaulth px
P
%s*synth2;
'|6     |fir_compiler_3_bbox   |     1|
2default:defaulth px
P
%s*synth2;
'|7     |CARRY4                |    36|
2default:defaulth px
P
%s*synth2;
'|8     |DSP48E1               |     1|
2default:defaulth px
P
%s*synth2;
'|9     |DSP48E1_1             |     1|
2default:defaulth px
P
%s*synth2;
'|10    |DSP48E1_2             |     2|
2default:defaulth px
P
%s*synth2;
'|11    |DSP48E1_3             |     2|
2default:defaulth px
P
%s*synth2;
'|12    |DSP48E1_4             |     1|
2default:defaulth px
P
%s*synth2;
'|13    |DSP48E1_5             |     1|
2default:defaulth px
P
%s*synth2;
'|14    |DSP48E1_6             |     1|
2default:defaulth px
P
%s*synth2;
'|15    |LUT1                  |   110|
2default:defaulth px
P
%s*synth2;
'|16    |LUT2                  |    83|
2default:defaulth px
P
%s*synth2;
'|17    |LUT3                  |    78|
2default:defaulth px
P
%s*synth2;
'|18    |LUT4                  |    87|
2default:defaulth px
P
%s*synth2;
'|19    |LUT5                  |    49|
2default:defaulth px
P
%s*synth2;
'|20    |LUT6                  |    84|
2default:defaulth px
P
%s*synth2;
'|21    |FDRE                  |   406|
2default:defaulth px
P
%s*synth2;
'|22    |FDSE                  |    10|
2default:defaulth px
P
%s*synth2;
'|23    |IBUF                  |     3|
2default:defaulth px
P
%s*synth2;
'|24    |OBUF                  |    20|
2default:defaulth px
P
%s*synth2;
'+------+----------------------+------+
2default:defaulth px
B
%s*synth2-

Report Instance Areas: 
2default:defaulth px
s
%s*synth2^
J+------+-------------------------+-------------------------------+------+
2default:defaulth px
s
%s*synth2^
J|      |Instance                 |Module                         |Cells |
2default:defaulth px
s
%s*synth2^
J+------+-------------------------+-------------------------------+------+
2default:defaulth px
s
%s*synth2^
J|1     |top                      |                               |  1203|
2default:defaulth px
s
%s*synth2^
J|2     |  Receiver               |ModemRx                        |   617|
2default:defaulth px
s
%s*synth2^
J|3     |    ADCInFace            |ADCInterface__parameterized0   |    59|
2default:defaulth px
s
%s*synth2^
J|4     |    CarriageRecoveryLoop |CRloop__parameterized0         |   245|
2default:defaulth px
s
%s*synth2^
J|5     |    Debug_PassThroughDAC |DAC__parameterized0_0          |    53|
2default:defaulth px
s
%s*synth2^
J|6     |    IQToChar             |IQDeserializer__parameterized0 |    43|
2default:defaulth px
s
%s*synth2^
J|7     |    MF                   |NewMatchedFilter               |    82|
2default:defaulth px
s
%s*synth2^
J|8     |    QPSK_Demodulator     |Demodulator                    |    58|
2default:defaulth px
s
%s*synth2^
J|9     |    Transmitter          |SerialTx                       |    67|
2default:defaulth px
s
%s*synth2^
J|10    |  Transmitter            |ModemTx                        |   529|
2default:defaulth px
s
%s*synth2^
J|11    |    CharacterToIQ        |CharToIQ__parameterized0       |   145|
2default:defaulth px
s
%s*synth2^
J|12    |      CharBuffer         |CharBufferModule               |    40|
2default:defaulth px
s
%s*synth2^
J|13    |      Serializer         |IQSerializer__parameterized0   |   105|
2default:defaulth px
s
%s*synth2^
J|14    |    DACInterface         |DAC__parameterized0            |    53|
2default:defaulth px
s
%s*synth2^
J|15    |    Display              |mux7seg                        |    54|
2default:defaulth px
s
%s*synth2^
J|16    |    PSF                  |PulseShaper                    |   114|
2default:defaulth px
s
%s*synth2^
J|17    |    QPSK_Modulator       |Modulator                      |    87|
2default:defaulth px
s
%s*synth2^
J|18    |    Receiver             |SerialRx                       |    76|
2default:defaulth px
s
%s*synth2^
J+------+-------------------------+-------------------------------+------+
2default:defaulth px
{
%s*synth2f
R---------------------------------------------------------------------------------
2default:defaulth px
�
%s*synth2�
�Finished Writing Synthesis Report : Time (s): cpu = 00:01:22 ; elapsed = 00:02:00 . Memory (MB): peak = 632.426 ; gain = 473.113
2default:defaulth px
{
%s*synth2f
R---------------------------------------------------------------------------------
2default:defaulth px
o
%s*synth2Z
FSynthesis finished with 0 errors, 0 critical warnings and 7 warnings.
2default:defaulth px
�
%s*synth2�
~Synthesis Optimization Runtime : Time (s): cpu = 00:00:00 ; elapsed = 00:01:21 . Memory (MB): peak = 632.426 ; gain = 134.746
2default:defaulth px
�
%s*synth2�
Synthesis Optimization Complete : Time (s): cpu = 00:01:22 ; elapsed = 00:02:01 . Memory (MB): peak = 632.426 ; gain = 473.113
2default:defaulth px
?
 Translating synthesized netlist
350*projectZ1-571h px
c
-Analyzing %s Unisim elements for replacement
17*netlist2
482default:defaultZ29-17h px
g
2Unisim Transformation completed in %s CPU seconds
28*netlist2
02default:defaultZ29-28h px
H
)Preparing netlist for logic optimization
349*projectZ1-570h px
d
1Inserted %s IBUFs to IO ports without IO buffers.100*opt2
02default:defaultZ31-140h px
d
1Inserted %s OBUFs to IO ports without IO buffers.101*opt2
02default:defaultZ31-141h px
r
)Pushed %s inverter(s) to %s load pin(s).
98*opt2
02default:default2
02default:defaultZ31-138h px
{
!Unisim Transformation Summary:
%s111*project29
%No Unisim elements were transformed.
2default:defaultZ1-111h px
R
Releasing license: %s
83*common2
	Synthesis2default:defaultZ17-83h px
�
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
922default:default2
72default:default2
02default:default2
02default:defaultZ4-41h px
[
%s completed successfully
29*	vivadotcl2 
synth_design2default:defaultZ4-42h px
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2"
synth_design: 2default:default2
00:01:212default:default2
00:01:492default:default2
632.4262default:default2
440.0822default:defaultZ17-268h px
�
sreport_utilization: Time (s): cpu = 00:00:00 ; elapsed = 00:00:00.609 . Memory (MB): peak = 632.426 ; gain = 0.000
*commonh px
}
Exiting %s at %s...
206*common2
Vivado2default:default2,
Sun Jun 07 04:08:25 20152default:defaultZ17-206h px