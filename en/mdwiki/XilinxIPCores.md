# XilinxIPCores
## FIFO Generator

A FIFO can be created using the FIFO generator.  (Andrew recommends using XPM but I forget how to do that).  Here is a TCL excerpt which does it.  I normally use the First_Word_Fall_Through option.  This results in the following behavior:

 * `EMPTY='0'`, data appears at output and `VALID='1'` on _second_ rising edge after `WR_EN` sampled high.
 * `EMPTY='1'`, `VALID='0'` on rising edge with `RD_EN='1'`.  No data is transferred.
 * `FULL='1'` on rising edge where last data word is accepted with `WR_EN='1'`.
 * `FULL='0'` on rising edge with `RD_EN='1'`, data updates to next word
 * `VALID='1'` continuously unless `EMPTY='1'`

The odd thing here is that an extra read attempt is required to make the `EMPTY` flag come on.

Without First_Word_Fall_Through option:

 * `EMPTY='0'` immediately on rising edge with `WR_EN='1'` (not data out or `VALID` change
 * `VALID='1'` for one clock when `RD_EN='1'`
 * `EMPTY='1'` on rising edge with `RD_EN='1'`, `VALID='1'` for one clock overlapping `EMPTY`.

Neither of these is ideal; one would prefer `EMPTY` to come on immediately when last word is read in the FWFT mode.

### TCL to create FIFO

```
create_project -force dummy -part xc7a35t-cpg236-1
create_ip -name fifo_generator \
    -vendor xilinx.com \
    -library ip \
    -version 13.2 \
    -module_name ${name} \
    -dir ${output_path}
set_property \
    -dict [list \
	       CONFIG.Valid_Flag {true} \
	       CONFIG.Performance_Options {First_Word_Fall_Through} \
	       CONFIG.Input_Data_Width {8} \
	       CONFIG.Input_Depth {16} \
	       CONFIG.Output_Data_Width {8} \
	       CONFIG.Output_Depth {16} \
	       CONFIG.Data_Count_Width {5} \
	       CONFIG.Write_Data_Count_Width {5} \
	       CONFIG.Read_Data_Count_Width {5} \
	       CONFIG.Full_Threshold_Assert_Value {15} \
	       CONFIG.Full_Threshold_Negate_Value {14}] \
    [get_ips ${name}]

generate_target {instantiation_template} [get_files ${xci_path}]
generate_target all [get_files ${xci_path}]
export_ip_user_files -of_objects [get_files ${xci_path}] -no_script -sync -force -quiet
create_ip_run [get_files -of_objects [get_filesets sources_1] ${xci_path}]
launch_runs fifo_512x36_synth_1
wait_on_run fifo_512x36_synth_1
close_project
```
