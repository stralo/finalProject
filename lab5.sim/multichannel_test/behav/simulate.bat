@echo off
set xv_path=C:\\Xilinx\\Vivado\\2014.4\\bin
call %xv_path%/xsim tb_fir_compiler_2_behav -key {Behavioral:multichannel_test:Functional:tb_fir_compiler_2} -tclbatch tb_fir_compiler_2.tcl -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
