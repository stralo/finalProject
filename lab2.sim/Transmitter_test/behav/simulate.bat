@echo off
set xv_path=C:\\Xilinx\\Vivado\\2014.4\\bin
call %xv_path%/xsim Transmitter_tb_behav -key {Behavioral:Transmitter_test:Functional:Transmitter_tb} -tclbatch Transmitter_tb.tcl -view O:/engs128/lab2/Transmitter_tb_behav.wcfg -view O:/engs128/lab2/Transmitter_tb_behav.wcfg -view O:/engs128/lab2/Transmitter_tb_behav.wcfg -view O:/engs128/lab2/Transmitter_tb_behav.wcfg -view O:/engs128/lab2/Transmitter_tb_behav.wcfg -view O:/engs128/lab2/Transmitter_tb_behav.wcfg -view O:/engs128/lab2/Transmitter_tb_behav.wcfg -view O:/engs128/lab2/Transmitter_tb_behav.wcfg -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
