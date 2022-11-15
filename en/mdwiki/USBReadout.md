# USBReadout
Proposed USB readout for thermal neutron detector.  A readout box with 4 inputs (BNC or LEMO) digitizes at 1MSPS signals from 4 summing amplifiers.  Data is buffered in a RAM, and read out over USB (2.0 Hi-Speed mode) to a computer.

### USB Readout 4 Channel Digitizer

 * Schematic &ndash; [SCH](http://ohm.bu.edu/~swd/wire_chamber/USB_readout/usb_readout_2a.sch)
  [PDF](http://ohm.bu.edu/~swd/wire_chamber/USB_readout/usb_readout_2a.pdf)
 * Layout &ndash; [PCB](http://ohm.bu.edu/~swd/wire_chamber/USB_readout/usb_readout_2c.pcb)
 * BOM &ndash; [CSV](http://ohm.bu.edu/~swd/wire_chamber/USB_readout/USB_Readout_BOM.csv) &bull; [PDF](http://ohm.bu.edu/~swd/wire_chamber/USB_readout/USB_Readout_BOM.pdf)
 * Firmware &ndash; [Project ZIP](http://ohm.bu.edu/~swd/wire_chamber/USB_readout/USB_readout_firmware_project.zip) &bull; [VHDL ZIP](http://ohm.bu.edu/~swd/wire_chamber/USB_readout/USB_readout_firmware_VHDL.zip)
 * Software &ndash; [ZIP](http://ohm.bu.edu/~swd/wire_chamber/USB_readout/USB_readout_software.zip)

*PCB Notes*
 * The 0.1" pins for the JTAG connector did not fit into the PCB holes. The holes in the PCB file have been increased from 0.029" to 0.035". Test pins with a caliper before committing to this design in case the larger holes are still not big enough. The other problem with the board is that the SMA connectors are too close together. If SMA cables are used there is no problem. However, if BNC adapters are used, they are too big to use right next to each other. The solution is to order SMA to BNC cables, or move the SMA layout to accommodate the BNC adapters.

*VHDL Notes*
 * Project was tested using Win7 32-bit using Xilinx ISE 13.2

*'Memory Considerations*

One "pulse" could be 1mS of recording, or 1k samples (2 bytes/sample).  If we want to buffer i.e. 8 pulses per channel for 4 channels, this requires 64k bytes RAM.  For full-speed operation, we need to be able to store 4 channels simultaneously (8k bytes/sec) plus readout perhaps 30k bytes/sec (depends on USB speed).  A 25ns cycle time is adequate.  <em>Must operate on 3.3V supply</em> to be compatible with CPLD.

Many possible choices include the Cypress CY7C1010DV33 (256Kx8) or CY7C1049DV33 (512Kx8).


 * [ADS7886](http://focus.ti.com/docs/prod/folders/print/ads7886.html)
 * FTDI [FT232H](http://www.ftdichip.com/Products/ICs/FT232H.htm)
 * [IS61C5128AS-25TLI](http://www.issi.com/pdf/61-64C5128AL.pdf)
 * CoolRunner II CPLD (XC2Cxxx) from Xilinx
 * [bus-blaster](http://www.seeedstudio.com/depot/bus-blaster-v2-jtag-debugger-p-807.html?cPath=174&zenid=88cac76f48af65aaa58eca0eeb09510a)
 * [FT232H C code](http://svn.navi.cx/misc/trunk/nds/dsi/ram-tracer/host/)

*'Drawings*

 * [Block Diagram](https://docs.google.com/drawings/d/1tSsMtzeR61coKPAi3TfiDoxv5R6zU2kryjOlZQ7vgsU/edit?hl=en_US&authkey=CNOm-94K)

*'Initial Test Firmware*

Please refer to:
 * [UM232H datasheet](http://www.ftdichip.com/Support/Documents/DataSheets/Modules/DS_UM232H.pdf)
 * [FT232H datasheet](http://www.ftdichip.com/Support/Documents/DataSheets/ICs/DS_FT232H.pdf)
 * [CoolRunner-II Evaluation Board](http://www.xilinx.com/support/documentation/boards_and_kits/ug501.pdf)
 * [XC2C256 CPLD](http://www.xilinx.com/support/documentation/data_sheets/ds094.pdf)



Read data could come from a counter or the slide switches, while write data can go to the LEDs.

