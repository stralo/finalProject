@echo off
set xv_path=C:\\Xilinx\\Vivado\\2014.4\\bin
call %xv_path%/xsim MatchFilter_tb2_behav -key {Behavioral:MatchFilter_test2:Functional:MatchFilter_tb2} -tclbatch MatchFilter_tb2.tcl -view O:/engs128/lab3/MatchedFilter_tb2_behav.wcfg -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
