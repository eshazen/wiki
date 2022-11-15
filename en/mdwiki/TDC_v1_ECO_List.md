# TDC_v1_ECO_List
g-2 TDC ECOs

 * Install 100 Ohm resistor R65 near connector J3
 * Change R58 to 4.7k

Layout changes

 * 8b10b TDC_OUT_p&n are routed to two pairs
   * N16 & N15
   * K16 & K15

## Future Changes (V2 PCB)

 * Power FPGA bank 8 on 2.5V
 * Move TSTP, TSTN to Bank 8 (LVDS)
 * Review design for any other pin conflicts (i.e. between voltage ramp inputs and test connector)
