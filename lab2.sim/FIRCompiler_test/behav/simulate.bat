@echo off
set xv_path=C:\\Xilinx\\v2014.4\\Vivado\\2014.4\\bin
call %xv_path%/xsim MyFIR_tb_behav -key {Behavioral:FIRCompiler_test:Functional:MyFIR_tb} -tclbatch MyFIR_tb.tcl -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
