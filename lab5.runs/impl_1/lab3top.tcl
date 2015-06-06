proc start_step { step } {
  set stopFile ".stop.rst"
  if {[file isfile .stop.rst]} {
    puts ""
    puts "*** Halting run - EA reset detected ***"
    puts ""
    puts ""
    return -code error
  }
  set beginFile ".$step.begin.rst"
  set platform "$::tcl_platform(platform)"
  set user "$::tcl_platform(user)"
  set pid [pid]
  set host ""
  if { [string equal $platform unix] } {
    if { [info exist ::env(HOSTNAME)] } {
      set host $::env(HOSTNAME)
    }
  } else {
    if { [info exist ::env(COMPUTERNAME)] } {
      set host $::env(COMPUTERNAME)
    }
  }
  set ch [open $beginFile w]
  puts $ch "<?xml version=\"1.0\"?>"
  puts $ch "<ProcessHandle Version=\"1\" Minor=\"0\">"
  puts $ch "    <Process Command=\".planAhead.\" Owner=\"$user\" Host=\"$host\" Pid=\"$pid\">"
  puts $ch "    </Process>"
  puts $ch "</ProcessHandle>"
  close $ch
}

proc end_step { step } {
  set endFile ".$step.end.rst"
  set ch [open $endFile w]
  close $ch
}

proc step_failed { step } {
  set endFile ".$step.error.rst"
  set ch [open $endFile w]
  close $ch
}

set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000

start_step init_design
set rc [catch {
  create_msg_db init_design.pb
  set_param gui.test TreeTableDev
  set_param xicom.use_bs_reader 1
  debug::add_scope template.lib 1
  set_property design_mode GateLvl [current_fileset]
  set_property webtalk.parent_dir O:/engs128/lab5/lab5.cache/wt [current_project]
  set_property parent.project_path O:/engs128/lab5/lab5.xpr [current_project]
  set_property ip_repo_paths o:/engs128/lab5/lab5.cache/ip [current_project]
  set_property ip_output_repo o:/engs128/lab5/lab5.cache/ip [current_project]
  add_files -quiet O:/engs128/lab5/lab5.runs/synth_1/lab3top.dcp
  add_files -quiet O:/engs128/lab5/lab5.runs/dds_compiler_0_synth_1/dds_compiler_0.dcp
  set_property netlist_only true [get_files O:/engs128/lab5/lab5.runs/dds_compiler_0_synth_1/dds_compiler_0.dcp]
  add_files -quiet O:/engs128/lab5/lab5.runs/dds_compiler_1_synth_1/dds_compiler_1.dcp
  set_property netlist_only true [get_files O:/engs128/lab5/lab5.runs/dds_compiler_1_synth_1/dds_compiler_1.dcp]
  add_files -quiet O:/engs128/lab5/lab5.runs/MMCM_synth_1/MMCM.dcp
  set_property netlist_only true [get_files O:/engs128/lab5/lab5.runs/MMCM_synth_1/MMCM.dcp]
  add_files -quiet O:/engs128/lab5/lab5.runs/fifo_generator_0_synth_1/fifo_generator_0.dcp
  set_property netlist_only true [get_files O:/engs128/lab5/lab5.runs/fifo_generator_0_synth_1/fifo_generator_0.dcp]
  add_files -quiet O:/engs128/lab5/lab5.runs/fir_compiler_2_synth_1/fir_compiler_2.dcp
  set_property netlist_only true [get_files O:/engs128/lab5/lab5.runs/fir_compiler_2_synth_1/fir_compiler_2.dcp]
  add_files -quiet O:/engs128/lab5/lab5.runs/fir_compiler_3_synth_1/fir_compiler_3.dcp
  set_property netlist_only true [get_files O:/engs128/lab5/lab5.runs/fir_compiler_3_synth_1/fir_compiler_3.dcp]
  read_xdc -mode out_of_context -ref dds_compiler_0 -cells U0 o:/engs128/lab4_withCRLoop/lab4.srcs/sources_1/ip/dds_compiler_0/dds_compiler_0_ooc.xdc
  set_property processing_order EARLY [get_files o:/engs128/lab4_withCRLoop/lab4.srcs/sources_1/ip/dds_compiler_0/dds_compiler_0_ooc.xdc]
  read_xdc -mode out_of_context -ref dds_compiler_1 -cells U0 o:/engs128/lab4_withCRLoop/lab4.srcs/sources_1/ip/dds_compiler_1/dds_compiler_1_ooc.xdc
  set_property processing_order EARLY [get_files o:/engs128/lab4_withCRLoop/lab4.srcs/sources_1/ip/dds_compiler_1/dds_compiler_1_ooc.xdc]
  read_xdc -mode out_of_context -ref MMCM -cells U0 o:/engs128/lab5/lab5.srcs/sources_1/ip/MMCM/MMCM_ooc.xdc
  set_property processing_order EARLY [get_files o:/engs128/lab5/lab5.srcs/sources_1/ip/MMCM/MMCM_ooc.xdc]
  read_xdc -prop_thru_buffers -ref MMCM -cells U0 o:/engs128/lab5/lab5.srcs/sources_1/ip/MMCM/MMCM_board.xdc
  set_property processing_order EARLY [get_files o:/engs128/lab5/lab5.srcs/sources_1/ip/MMCM/MMCM_board.xdc]
  read_xdc -ref MMCM -cells U0 o:/engs128/lab5/lab5.srcs/sources_1/ip/MMCM/MMCM.xdc
  set_property processing_order EARLY [get_files o:/engs128/lab5/lab5.srcs/sources_1/ip/MMCM/MMCM.xdc]
  read_xdc -mode out_of_context -ref fifo_generator_0 -cells U0 o:/engs128/lab5/lab5.srcs/sources_1/ip/fifo_generator_0/fifo_generator_0_ooc.xdc
  set_property processing_order EARLY [get_files o:/engs128/lab5/lab5.srcs/sources_1/ip/fifo_generator_0/fifo_generator_0_ooc.xdc]
  read_xdc -ref fifo_generator_0 -cells U0 o:/engs128/lab5/lab5.srcs/sources_1/ip/fifo_generator_0/fifo_generator_0/fifo_generator_0.xdc
  set_property processing_order EARLY [get_files o:/engs128/lab5/lab5.srcs/sources_1/ip/fifo_generator_0/fifo_generator_0/fifo_generator_0.xdc]
  read_xdc -mode out_of_context -ref fir_compiler_2 -cells U0 o:/engs128/lab5/lab5.srcs/sources_1/ip/fir_compiler_2/fir_compiler_2_ooc.xdc
  set_property processing_order EARLY [get_files o:/engs128/lab5/lab5.srcs/sources_1/ip/fir_compiler_2/fir_compiler_2_ooc.xdc]
  read_xdc -mode out_of_context -ref fir_compiler_3 -cells U0 o:/engs128/lab5/lab5.srcs/sources_1/ip/fir_compiler_3/fir_compiler_3_ooc.xdc
  set_property processing_order EARLY [get_files o:/engs128/lab5/lab5.srcs/sources_1/ip/fir_compiler_3/fir_compiler_3_ooc.xdc]
  read_xdc O:/engs128/lab3/lab2.srcs/constrs_1/imports/Lab1/Basys3_Master.xdc
  link_design -top lab3top -part xc7a35tcpg236-1
  close_msg_db -file init_design.pb
} RESULT]
if {$rc} {
  step_failed init_design
  return -code error $RESULT
} else {
  end_step init_design
}

start_step opt_design
set rc [catch {
  create_msg_db opt_design.pb
  catch {write_debug_probes -quiet -force debug_nets}
  opt_design 
  write_checkpoint -force lab3top_opt.dcp
  catch {report_drc -file lab3top_drc_opted.rpt}
  close_msg_db -file opt_design.pb
} RESULT]
if {$rc} {
  step_failed opt_design
  return -code error $RESULT
} else {
  end_step opt_design
}

start_step place_design
set rc [catch {
  create_msg_db place_design.pb
  place_design 
  write_checkpoint -force lab3top_placed.dcp
  catch { report_io -file lab3top_io_placed.rpt }
  catch { report_clock_utilization -file lab3top_clock_utilization_placed.rpt }
  catch { report_utilization -file lab3top_utilization_placed.rpt -pb lab3top_utilization_placed.pb }
  catch { report_control_sets -verbose -file lab3top_control_sets_placed.rpt }
  close_msg_db -file place_design.pb
} RESULT]
if {$rc} {
  step_failed place_design
  return -code error $RESULT
} else {
  end_step place_design
}

start_step route_design
set rc [catch {
  create_msg_db route_design.pb
  route_design 
  write_checkpoint -force lab3top_routed.dcp
  catch { report_drc -file lab3top_drc_routed.rpt -pb lab3top_drc_routed.pb }
  catch { report_timing_summary -warn_on_violation -max_paths 10 -file lab3top_timing_summary_routed.rpt -rpx lab3top_timing_summary_routed.rpx }
  catch { report_power -file lab3top_power_routed.rpt -pb lab3top_power_summary_routed.pb }
  catch { report_route_status -file lab3top_route_status.rpt -pb lab3top_route_status.pb }
  close_msg_db -file route_design.pb
} RESULT]
if {$rc} {
  step_failed route_design
  return -code error $RESULT
} else {
  end_step route_design
}

start_step write_bitstream
set rc [catch {
  create_msg_db write_bitstream.pb
  write_bitstream -force lab3top.bit 
  if { [file exists O:/engs128/lab5/lab5.runs/synth_1/lab3top.hwdef] } {
    catch { write_sysdef -hwdef O:/engs128/lab5/lab5.runs/synth_1/lab3top.hwdef -bitfile lab3top.bit -meminfo lab3top.mmi -file lab3top.sysdef }
  }
  close_msg_db -file write_bitstream.pb
} RESULT]
if {$rc} {
  step_failed write_bitstream
  return -code error $RESULT
} else {
  end_step write_bitstream
}

