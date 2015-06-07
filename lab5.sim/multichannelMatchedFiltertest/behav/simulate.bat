@echo off
set xv_path=C:\\Xilinx\\Vivado\\2014.4\\bin
call %xv_path%/xsim multichannelMatchedFilter_tb_behav -key {Behavioral:multichannelMatchedFiltertest:Functional:multichannelMatchedFilter_tb} -tclbatch multichannelMatchedFilter_tb.tcl -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
