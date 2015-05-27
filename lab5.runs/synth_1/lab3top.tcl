# 
# Synthesis run script generated by Vivado
# 

set_param gui.test TreeTableDev
debug::add_scope template.lib 1
set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000

create_project -in_memory -part xc7a35tcpg236-1
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir O:/engs128/lab5/lab5.cache/wt [current_project]
set_property parent.project_path O:/engs128/lab5/lab5.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language VHDL [current_project]
add_files //thayerfs.thayer.dartmouth.edu/d37581q/Desktop/rrcos8-brom.coe
add_files //thayerfs/d37581q/Desktop/rrcos8-fir-ip.coe
add_files //thayerfs/d37581q/Desktop/newmatchedfilter_coeffs.coe
add_files //thayerfs.thayer.dartmouth.edu/d37581q/Desktop/rrcos8-fir-ip.coe
add_files -quiet O:/engs128/lab5/lab5.runs/BlockROM_synth_1/BlockROM.dcp
set_property used_in_implementation false [get_files O:/engs128/lab5/lab5.runs/BlockROM_synth_1/BlockROM.dcp]
add_files -quiet O:/engs128/lab5/lab5.runs/fir_compiler_0_synth_1/fir_compiler_0.dcp
set_property used_in_implementation false [get_files O:/engs128/lab5/lab5.runs/fir_compiler_0_synth_1/fir_compiler_0.dcp]
add_files -quiet O:/engs128/lab5/lab5.runs/dds_compiler_0_synth_1/dds_compiler_0.dcp
set_property used_in_implementation false [get_files O:/engs128/lab5/lab5.runs/dds_compiler_0_synth_1/dds_compiler_0.dcp]
add_files -quiet O:/engs128/lab5/lab5.runs/dds_compiler_1_synth_1/dds_compiler_1.dcp
set_property used_in_implementation false [get_files O:/engs128/lab5/lab5.runs/dds_compiler_1_synth_1/dds_compiler_1.dcp]
add_files -quiet O:/engs128/lab5/lab5.runs/MMCM_synth_1/MMCM.dcp
set_property used_in_implementation false [get_files O:/engs128/lab5/lab5.runs/MMCM_synth_1/MMCM.dcp]
add_files -quiet O:/engs128/lab5/lab5.runs/fir_compiler_1_synth_1/fir_compiler_1.dcp
set_property used_in_implementation false [get_files O:/engs128/lab5/lab5.runs/fir_compiler_1_synth_1/fir_compiler_1.dcp]
read_vhdl -library xil_defaultlib {
  O:/engs128/lab3/lab2.srcs/sources_1/new/PulseShaper.vhd
  O:/engs128/lab3/lab2.srcs/sources_1/imports/new/IQDeserializer.vhd
  O:/engs128/lab3/lab2.srcs/sources_1/imports/new/CharToIQ.vhd
  O:/engs128/lab3/lab2.srcs/sources_1/imports/new/CharBufferModule.vhd
  O:/engs128/lab3/lab2.srcs/sources_1/imports/new/BufferController.vhd
  O:/engs128/lab3/lab2.srcs/sources_1/imports/new/BufferAddrCounter.vhd
  O:/engs128/lab3/lab2.srcs/sources_1/imports/new/FifoBuffer.vhd
  O:/engs128/lab3/lab2.srcs/sources_1/imports/new/BufControllerEOLListener.vhd
  O:/engs128/lab3/lab2.srcs/sources_1/imports/new/IQSerializer.vhd
  O:/engs128/lab3/lab2.srcs/sources_1/imports/new/NullReadListener.vhd
  O:/engs128/lab3/lab2.srcs/sources_1/imports/Lab1/mux7seg.vhd
  O:/engs128/lab3/lab2.srcs/sources_1/imports/Lab1/SerialRx.vhd
  O:/engs128/lab3/lab2.srcs/sources_1/imports/Lab1/SerialTx.vhd
  O:/engs128/lab4_withCRLoop/lab4.srcs/sources_1/new/Demodulator.vhd
  O:/engs128/lab4_withCRLoop/lab4.srcs/sources_1/imports/Desktop/CRloop.vhd
  O:/engs128/lab4_withCRLoop/lab4.srcs/sources_1/new/MatchedFilter.vhd
  O:/engs128/lab5/lab5.srcs/sources_1/new/ModemTx.vhd
  O:/engs128/lab5/lab5.srcs/sources_1/new/ModemRx.vhd
  O:/engs128/lab5/lab5.srcs/sources_1/new/DAC.vhd
  O:/engs128/lab5/lab5.srcs/sources_1/imports/new/ADC.vhd
  O:/engs128/lab5/lab5.srcs/sources_1/new/Modulator.vhd
  O:/engs128/lab5/lab5.srcs/sources_1/new/lab3top.vhd
  O:/engs128/lab5/lab5.srcs/sources_1/new/NewMatchedFilter.vhd
}
read_xdc O:/engs128/lab3/lab2.srcs/constrs_1/imports/Lab1/Basys3_Master.xdc
set_property used_in_implementation false [get_files O:/engs128/lab3/lab2.srcs/constrs_1/imports/Lab1/Basys3_Master.xdc]

catch { write_hwdef -file lab3top.hwdef }
synth_design -top lab3top -part xc7a35tcpg236-1
write_checkpoint -noxdef lab3top.dcp
catch { report_utilization -file lab3top_utilization_synth.rpt -pb lab3top_utilization_synth.pb }
