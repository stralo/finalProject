# 
# Synthesis run script generated by Vivado
# 

namespace eval rt {
    variable rc
}
set rt::rc [catch {
  uplevel #0 {
    set ::env(BUILTIN_SYNTH) true
    source $::env(HRT_TCL_PATH)/rtSynthPrep.tcl
    rt::HARTNDb_resetJobStats
    rt::HARTNDb_startJobStats
    set rt::cmdEcho 0
    rt::set_parameter writeXmsg true
    set ::env(RT_TMP) "./.Xil/Vivado-2068-VLAB-029/realtime/tmp"
    if { [ info exists ::env(RT_TMP) ] } {
      file delete -force $::env(RT_TMP)
      file mkdir $::env(RT_TMP)
    }

    rt::delete_design

    set rt::partid xc7a35tcpg236-1

    source $::env(SYNTH_COMMON)/common_vhdl.tcl
    set rt::defaultWorkLibName xil_defaultlib

    set rt::useElabCache false
    if {$rt::useElabCache == false} {
      rt::read_vhdl -lib xbip_utils_v3_0 o:/engs128/lab5/lab5.srcs/sources_1/ip/fir_compiler_3/xbip_utils_v3_0/hdl/xbip_utils_v3_0_vh_rfs.vhd
      rt::read_vhdl -lib axi_utils_v2_0 o:/engs128/lab5/lab5.srcs/sources_1/ip/fir_compiler_3/axi_utils_v2_0/hdl/axi_utils_v2_0_vh_rfs.vhd
      rt::read_vhdl -lib fir_compiler_v7_2 {
      o:/engs128/lab5/lab5.srcs/sources_1/ip/fir_compiler_3/fir_compiler_v7_2/hdl/fir_compiler_v7_2_vh_rfs.vhd
      o:/engs128/lab5/lab5.srcs/sources_1/ip/fir_compiler_3/fir_compiler_v7_2/hdl/fir_compiler_v7_2.vhd
    }
      rt::read_vhdl -lib xil_defaultlib o:/engs128/lab5/lab5.srcs/sources_1/ip/fir_compiler_3/synth/fir_compiler_3.vhd
      rt::filesetChecksum
    }
    rt::set_parameter usePostFindUniquification false
    set rt::top fir_compiler_3
    set rt::reportTiming false
    rt::set_parameter elaborateOnly true
    rt::set_parameter elaborateRtl true
    rt::set_parameter eliminateRedundantBitOperator false
    rt::set_parameter writeBlackboxInterface true
    rt::set_parameter merge_flipflops true
    rt::set_parameter srlDepthThreshold 3
    rt::set_parameter rstSrlDepthThreshold 4
    rt::set_parameter webTalkPath {}
    rt::set_parameter enableSplitFlowPath "./.Xil/Vivado-2068-VLAB-029/"
    if {$rt::useElabCache == false} {
      rt::run_rtlelab -module $rt::top
    }

    set rt::flowresult [ source $::env(SYNTH_COMMON)/flow.tcl ]
    rt::HARTNDb_stopJobStats
    if { $rt::flowresult == 1 } { return -code error }

    if { [ info exists ::env(RT_TMP) ] } {
      file delete -force $::env(RT_TMP)
    }


    source $::env(HRT_TCL_PATH)/rtSynthCleanup.tcl
  } ; #end uplevel
} rt::result]

if { $rt::rc } {
  $rt::db resetHdlParse
  source $::env(HRT_TCL_PATH)/rtSynthCleanup.tcl
  return -code "error" $rt::result
}
