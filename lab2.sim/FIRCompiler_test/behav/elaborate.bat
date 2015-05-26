@echo off
set xv_path=C:\\Xilinx\\v2014.4\\Vivado\\2014.4\\bin
call %xv_path%/xelab  -wto 3fc4a5d3650a498bba6b448194a25c23 -m64 --debug typical --relax -L blk_mem_gen_v8_2 -L xil_defaultlib -L xbip_dsp48_wrapper_v3_0 -L xbip_utils_v3_0 -L xbip_pipe_v3_0 -L xbip_dsp48_macro_v3_0 -L axi_utils_v2_0 -L fir_compiler_v7_2 -L secureip --snapshot MyFIR_tb_behav xil_defaultlib.MyFIR_tb -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
