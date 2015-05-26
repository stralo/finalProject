@echo off
set xv_path=C:\\Xilinx\\Vivado\\2014.4\\bin
call %xv_path%/xsim lab2_tb_behav -key {Behavioral:lab2_test:Functional:lab2_tb} -tclbatch lab2_tb.tcl -view O:/engs128/lab3/lab2_tb_behav.wcfg -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
