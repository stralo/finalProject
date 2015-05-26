@echo off
set xv_path=C:\\Xilinx\\Vivado\\2014.4\\bin
call %xv_path%/xelab  -wto 3fc4a5d3650a498bba6b448194a25c23 -m64 --debug typical --relax -L blk_mem_gen_v8_2 -L xil_defaultlib -L xbip_utils_v3_0 -L axi_utils_v2_0 -L fir_compiler_v7_2 -L xbip_pipe_v3_0 -L xbip_bram18k_v3_0 -L mult_gen_v12_0 -L xbip_dsp48_wrapper_v3_0 -L xbip_dsp48_addsub_v3_0 -L xbip_dsp48_multadd_v3_0 -L dds_compiler_v6_0 -L secureip --snapshot wCRLoop_tb_behav xil_defaultlib.wCRLoop_tb -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
