@echo off
set xv_path=C:\\Xilinx\\v2014.4\\Vivado\\2014.4\\bin
call %xv_path%/xelab  -wto 3fc4a5d3650a498bba6b448194a25c23 -m64 --debug typical --relax -L xil_defaultlib -L secureip --snapshot Serializer_tb_behav xil_defaultlib.Serializer_tb -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
