@echo off
set xv_path=C:\\Xilinx\\Vivado\\2014.4\\bin
call %xv_path%/xsim MatchedFilter_OutBit_tb_behav -key {Behavioral:MatchedFilter_BitOut_test:Functional:MatchedFilter_OutBit_tb} -tclbatch MatchedFilter_OutBit_tb.tcl -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
