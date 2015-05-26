@echo off
set xv_path=C:\\Xilinx\\Vivado\\2014.4\\bin
call %xv_path%/xsim wCRLoop_tb_behav -key {Behavioral:lab4_wCRLoop_test:Functional:wCRLoop_tb} -tclbatch wCRLoop_tb.tcl -view O:/engs128/lab4_withCRLoop/wCRLoop_tb_behav.wcfg -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
