set projDir "C:/Users/user/Documents/alchitry/AwesomeLogicUnit/work/vivado"
set projName "AwesomeLogicUnit"
set topName top
set device xc7a35tftg256-1
if {[file exists "$projDir/$projName"]} { file delete -force "$projDir/$projName" }
create_project $projName "$projDir/$projName" -part $device
set_property design_mode RTL [get_filesets sources_1]
set verilogSources [list "C:/Users/user/Documents/alchitry/AwesomeLogicUnit/work/verilog/au_top_0.v" "C:/Users/user/Documents/alchitry/AwesomeLogicUnit/work/verilog/reset_conditioner_1.v" "C:/Users/user/Documents/alchitry/AwesomeLogicUnit/work/verilog/counter_2.v" "C:/Users/user/Documents/alchitry/AwesomeLogicUnit/work/verilog/decoder_3.v" "C:/Users/user/Documents/alchitry/AwesomeLogicUnit/work/verilog/display_manager_4.v" "C:/Users/user/Documents/alchitry/AwesomeLogicUnit/work/verilog/test_manager_5.v" "C:/Users/user/Documents/alchitry/AwesomeLogicUnit/work/verilog/alu_whole_6.v" "C:/Users/user/Documents/alchitry/AwesomeLogicUnit/work/verilog/alu_adder_7.v" "C:/Users/user/Documents/alchitry/AwesomeLogicUnit/work/verilog/alu_boolean_8.v" "C:/Users/user/Documents/alchitry/AwesomeLogicUnit/work/verilog/alu_shifter_9.v" "C:/Users/user/Documents/alchitry/AwesomeLogicUnit/work/verilog/alu_compare_10.v" "C:/Users/user/Documents/alchitry/AwesomeLogicUnit/work/verilog/alu_multiply_11.v" ]
import_files -fileset [get_filesets sources_1] -force -norecurse $verilogSources
set xdcSources [list "C:/Users/user/Documents/alchitry/AwesomeLogicUnit/constraint/constraints.xdc" "C:/Users/user/Documents/alchitry/AwesomeLogicUnit/work/constraint/custom.xdc" ]
read_xdc $xdcSources
set_property STEPS.WRITE_BITSTREAM.ARGS.BIN_FILE true [get_runs impl_1]
update_compile_order -fileset sources_1
launch_runs -runs synth_1 -jobs 8
wait_on_run synth_1
launch_runs impl_1 -to_step write_bitstream -jobs 8
wait_on_run impl_1
