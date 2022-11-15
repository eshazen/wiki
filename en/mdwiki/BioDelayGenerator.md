# BioDelayGenerator
This page will contain documentation of a delay generator
to control a CCD camera in response to periodic biological
signals (i.e. heartbeat or respiration).

 * [RevisedProposal26Jan.pdf](http://ohm.bu.edu/~pbohn/Bio_Delay_Generator/Documentation/RevisedProposal26Jan.pdf)
 * [RevisedProposal23Dec.pdf](http://ohm.bu.edu/~hazen/BioDelay/RevisedProposal23Dec.pdf)

## Bio Delay Generator Starter Kit Documentation

 * [Spartan-3AN_Starter_Kit_Implementation](Spartan-3AN_Starter_Kit_Implementation.md)
 * [Xilinx Spartan-3AN Starter Kit Documentation](http://www.xilinx.com/products/devkits/HW-SPAR3AN-SK-UNI-G.htm)


## Firmware

### Source Code

 * [Firmware Source Code](http://ohm.bu.edu/~pbohn/Bio_Delay_Generator/Design_Files/backup/)
 * [PicoBlazeControlBlockReleaseNotes](PicoBlazeControlBlockReleaseNotes.md)
 * [PB_demo_6Jan09.zip](http://ohm.bu.edu/~hazen/BioDelay/PB_demo_6Jan09.zip)
   * See [PB_demo_nexsys2_Release_notes](PB_demo_nexsys2_Release_notes.md)

### Programming Instructions

1. Download and install ISE Webpack version 10.1 at http://www.xilinx.com/ise/logic_design_prod/webpack.htm

2. Download the latest firmware zip file and unzip the files

3. Open ISE and create New Project by following steps one through four on page 25 of the ISE 10.1 In-Depth Tutorial.
http://www.xilinx.com/direct/ise10_tutorials/ise10tut.pdf

For step five select the appropriate device and package for the design (XC3S50
AN – TQG144).  Then click the next button until the project wizard is finished.

4. Copy the directory "vhdl" from the firmware folder to the new project directory that ISE created.

5. With the project navigator open select the sources tab and right click in the sources window to bring up an options menu (to identify window see page 14 of the ISE 10.1 In-Depth Tutorial).  Select "Add Source" from the menu.  Navigate to the vhdl folder that was copied in the previous step.  Add all the files at the top of each of the following directories to the project by repeating the previous step three times.

vhdl\

vhdl\picoblaze\

vhd\ biodelay_design\

6. Under the "Sources" window right click on "xc3s50an_top" and select "Set as Top Module".

7. Under the "Processes" window right click on "Configure Target Device" then select "Run" from the menu.  After some time passes the programming software will launch.

8. To program the device follow the tutorials below.

See page 153 the iMPACT Tutorial
http://www.xilinx.com/direct/ise10_tutorials/ise10tut.pdf

See page 208 Programming an FPGA Using JTAG
http://www.xilinx.com/support/documentation/user_guides/ug332.pdf

See page 90 Preparing a Platform Flash PROM File
http://www.xilinx.com/support/documentation/user_guides/ug332.pdf


## Spartan-3AN Notes

### Power supplies required:

 * VccINT - 1.2V
 * VccAUX - 3.3V
 * VccO - 3.3V (other options available down to 1.2V)

See [diagram](http://ohm.bu.edu/~hazen/BioDelay/Spartan3ANConfigDiagram.gif)

#### Some Notes:

 * *'PUDC_B* pin should be grounded.  This will cause all FPGA pins to be pulled up
during configuration (rather than being left floating)
 * *'PROG_B* pin can be left open.  If pulled low (with open-collector output) for > 500ns, initiates re-configuration of FPGA from flash memory
 * __VS[2:0](2:0.md)
 * __M[2:0](2:0.md)

### Pinout Notes XC3S50AN TQ144 Package:

Please refer to the [Xilinx Spartan-3AN datasheet](http://www.xilinx.com/support/documentation/data_sheets/ds557.pdf)


[CURRENT PINOUT](http://ohm.bu.edu/~pbohn/Bio_Delay_Generator/Documentation/Pinout_BioDelayGen_2009-01-22.xls)




In bank 0:

IO_L12N_0/PUDC_B (pin 143)

In bank 1:   (none)

In bank 2:

IO_L09P_2/GCLK0     -- This pin should get the 50MHz clock

IO_L01N_2/M0
IO_L01P_2/M1
IO_L02P_2/M2

IO_L04N_2/VS0
IO_L03N_2/VS1
IO_L04P_2/VS2


IO_L11P_2/AWAKE
IO_L14N_2/CCLK
IO_L12P_2/INIT_B

In bank 3:  (none)

Of course, the JTAG pins (TMS, TCK, TDI, TDO) and DONE, PROG_B are also used for special purposes.

### Xilinx Documentation:

 * [Spartan-3AN](http://www.xilinx.com/support/documentation/spartan-3an.htm)
 * [Spartan 3 Family Users Guide (UG331)](http://www.xilinx.com/support/documentation/user_guides/ug331.pdf)
 * [Configuration Users Guide (UG332)](http://www.xilinx.com/support/documentation/user_guides/ug332.pdf)
 * [Spartan-3AN Data Sheet (DS557)](http://www.xilinx.com/support/documentation/data_sheets/ds557.pdf)
 * [TQ144 Footprint/Pinout](http://ohm.bu.edu/~hazen/BioDelay/TQ144_FootPrint.pdf)


