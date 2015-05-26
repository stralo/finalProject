// Copyright 1986-2014 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2014.4 (win64) Build 1071353 Tue Nov 18 18:29:27 MST 2014
// Date        : Tue Apr 21 16:53:59 2015
// Host        : M210-17 running 64-bit Service Pack 1  (build 7601)
// Command     : write_verilog -force -mode synth_stub O:/engs128/lab3/lab2.srcs/sources_1/ip/BlockROM/BlockROM_stub.v
// Design      : BlockROM
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "blk_mem_gen_v8_2,Vivado 2014.4" *)
module BlockROM(clka, addra, douta)
/* synthesis syn_black_box black_box_pad_pin="clka,addra[7:0],douta[15:0]" */;
  input clka;
  input [7:0]addra;
  output [15:0]douta;
endmodule
