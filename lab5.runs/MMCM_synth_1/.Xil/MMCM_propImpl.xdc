set_property SRC_FILE_INFO {cfile:o:/engs128/lab5/lab5.srcs/sources_1/ip/MMCM/MMCM.xdc rfile:../../../lab5.srcs/sources_1/ip/MMCM/MMCM.xdc id:1 order:EARLY scoped_inst:U0} [current_design]
set_property src_info {type:SCOPED_XDC file:1 line:56 export:INPUT save:INPUT read:READ} [current_design]
set_input_jitter [get_clocks -of_objects [get_ports clk_in1]] 0.1
