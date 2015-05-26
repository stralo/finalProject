@echo off
set xv_path=C:\\Xilinx\\Vivado\\2014.4\\bin
call %xv_path%/xsim DACInterface_tb2_behav -key {Behavioral:DACInterface_test2:Functional:DACInterface_tb2} -tclbatch DACInterface_tb2.tcl -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
