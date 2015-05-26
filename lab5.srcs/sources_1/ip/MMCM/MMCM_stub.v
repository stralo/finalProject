// Copyright 1986-2014 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2014.4 (win64) Build 1071353 Tue Nov 18 18:29:27 MST 2014
// Date        : Wed May 13 20:30:31 2015
// Host        : MECHA-2 running 64-bit Service Pack 1  (build 7601)
// Command     : write_verilog -force -mode synth_stub O:/engs128/lab5/lab5.srcs/sources_1/ip/MMCM/MMCM_stub.v
// Design      : MMCM
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module MMCM(clk_in1, clk_out1, clk_out2)
/* synthesis syn_black_box black_box_pad_pin="clk_in1,clk_out1,clk_out2" */;
  input clk_in1;
  output clk_out1;
  output clk_out2;
endmodule
