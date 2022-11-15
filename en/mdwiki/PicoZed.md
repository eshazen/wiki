# PicoZed

## Collection of random notes about the PicoZed and PicoZed FMC carrier

The FMC signals LA00-LA33 are routed as diff pairs from the JX1 and JX2 connectors on the PicoZed.  They are all on banks 34 and 35, which are jumper-selectable for VCCO on the carrier via JP5.   The default is 1.8V, but should be reset to 2.5V for a 7010 or 7020.

This voltage is routed to FMC VADJ pins G39, H40.

*7010 or 7020*

Banks 34 and 35 are "HR" (High Range) I/O type.  This requires 2.5V VCCO for LVDS operation with on-board termination.

*7030*

Banks 34 and 35 are "HP" (High Performance) I/O type.  This requires 1.8V VCCO in all cases (and on-board LVDS termination is supported)


Other reference info:

 * PicozedZynqFirmware
 * PicozedZynqSoftware
