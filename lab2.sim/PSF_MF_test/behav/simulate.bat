@echo off
set xv_path=C:\\Xilinx\\Vivado\\2014.4\\bin
call %xv_path%/xsim psf_mf_tb_behav -key {Behavioral:PSF_MF_test:Functional:psf_mf_tb} -tclbatch psf_mf_tb.tcl -view O:/engs128/lab3/psf_mf_tb_behav.wcfg -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
