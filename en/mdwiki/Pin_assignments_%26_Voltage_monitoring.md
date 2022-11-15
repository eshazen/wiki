# Pin_assignments_%26_Voltage_monitoring
This page contains notes about updating the TDC FPGA pin-out.

## Test pulses
In the old design these LVDS signals were put on bank 7 of the TDC's FPGA and that bank does not allow for LVDS outputs.

The FPGA (Cyclone III EP3C5U256C6) only supports LVDS outputs on banks 1,2,5, and 6.

Since bank 6 is near bank 7, using C15,C16 and D15,D16 for this would hopefully have a minimal effect on the current layout.

