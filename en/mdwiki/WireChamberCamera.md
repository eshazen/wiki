# WireChamberCamera
This page provides documentation for an inexpensive CCD camera being
developed to read out dark matter detectors.  It may also find use
for other applications (i.e. neutron detectors).

Please also see new page [EMCCD_Ideas](EMCCD_Ideas.md)
about a possible EMCCD camera.

## Meeting Notes
 * [CCD_Camera_17_November_2008](CCD_Camera_17_November_2008.md)

## Presentation Materials

 * Block diagram and notes on first prototype &ndash; [PDF](http://joule.bu.edu/~hazen/AhlenCCD/CCD_diagram.pdf)
[ODG](http://joule.bu.edu/~hazen/AhlenCCD/CCD_diagram.odg)

 * [http://www.kodak.com/US/en/dpq/site/SENSORS/name/ISSFullFrameProductFamily
   Kodak CCD Image Sensors]

 * [Proposal Text](http://joule.bu.edu/~hazen/AhlenCCD/proposal_text.txt)
2005 for Dark Matter proposal

## Development Notes

 * [Camera Interface Documentation](http://joule.bu.edu/~hazen/AhlenCCD/ccd_4.pdf)
 * [Ethernet_Camera_Readout](Ethernet_Camera_Readout.md)
 * [Ethernet_Camera_Software](Ethernet_Camera_Software.md)

## Prototype I Documentation

 * *'Mechanical CAD*
   * [PCB Mechanical Drawing](http://ohm.bu.edu/~pbohn/AHLEN-CCD/Drawings/CCD_PCB_Mechanical_Drawing.dwg)
   * [PCB Mechanical Drawing](http://ohm.bu.edu/~pbohn/AHLEN-CCD/Drawings/CCD_PCB_Mechanical_Drawing.pdf)

 * *'Schematics and PCB Layouts*
   * CCD carrier board
     * _'PCB Layout_ &ndash; [PDF](http://joule.bu.edu/~hazen/AhlenCCD/carrier_pcb.pdf)
  [ExpressPCB](http://joule.bu.edu/~hazen/AhlenCCD/carrier.pcb)
   * Analog board
     * _'PCB Layout_ &ndash; [PDF](http://joule.bu.edu/~hazen/AhlenCCD/CCD_pcb.pdf)
  [ExpressPCB](http://joule.bu.edu/~hazen/AhlenCCD/CCD.pcb)
     * _'Schematic_ &ndash; [PDF](http://joule.bu.edu/~hazen/AhlenCCD/ccd_sch.pdf)
  [ExpressPCB](http://joule.bu.edu/~hazen/AhlenCCD/ccd.sch)
 * Interface board
   * _'Schematic_ &ndash; [PDF](http://joule.bu.edu/~hazen/AhlenCCD/interface_sch.pdf)
  [ExpressPCB](http://joule.bu.edu/~hazen/AhlenCCD/interface.sch)
   * _'PCB Layout_ &ndash; _(not yet completed)_


 * *'Component Data Sheets*
   * [PCB Assembly Parts](http://ohm.bu.edu/~pbohn/AHLEN-CCD/Documentation/CCD_PCB_Assembly_Parts.txt)
   * [Kodak KAI-2020 Image Sensor](http://ohm.bu.edu/~pbohn/AHLEN-CCD/Data_Sheets/CCD_Chip__KAI-2020LongSpec.pdf)
   * [Header Pins and Socket](http://ohm.bu.edu/~pbohn/AHLEN-CCD/Data_Sheets/CCD_Board_Header_Pins_and_Socket.pdf)
   * [Pin Receptacles](http://ohm.bu.edu/~pbohn/AHLEN-CCD/Data_Sheets/1303_pin_receptacle.pdf)


## Design Notes

One frame is 1600x1200 or 1.9Mpixel.  If we digitize with a 12 bit ADC,
we''ll need two bytes per pixel or 3.84MB. (2Mx8 or 1Mx16)

ISSI makes some reasonable-looking synchronous SRAMS which could be used
if we go with a custom board.

 * [Note on CCD Sensors](http://joule.bu.edu/~hazen/AhlenCCD/ccd.pdf)

Note that we expect to run this prototype at room temperature.
There is also a  [diagram](http://joule.bu.edu/~hazen/AhlenCCD/diagram.pdf)
from the 2005 version.

## Xilinx Boards

 * [Digilent](http://www.digilentinc.com)
[Nexsys2 board](http://www.digilentinc.com/Products/Detail.cfm?Prod=NEXYS2&Nav1=Products&Nav2=Programmable)
   * ++ 256 color VGA
   * ++ USB readout supported for data transfers
   * ++ Micron PSDRAM (can be used in asynchronous mode)
   * ++ only $99
   * -- USB software support is windows-only, no source code, an unknown quantity
   * -- Brand new product; no user manual (yet!)

 * [Spartan 3E](http://www.xilinx.com/products/silicon_solutions/fpgas/spartan_series/spartan3e_fpgas/index.htm)  [starter kit](http://www.xilinx.com/xlnx/xebiz/designResources/ip_product_details.jsp?key=HW-SPAR3E-SK-US-G&sGlobalNavPick=PRODUCTS&sSecondaryNavPick=BOARDS)
   * ++ We have them
   * ++ SiTCP support
   * -- VGA port is only 8 colors
   * -- DDR SDRAM (hard to use without microblaze)
   * -- USB port not supported for data transfers

 * [Opal Kelley](http://www.opalkelly.com)
[XEM3005 board](http://www.opalkelly.com/products/xem3005/)
   * ++ Linux software support
   * -- no VGA connector
   * -- SDRAM with no obviously-provided example VHDL code
   * -- Costs $279


