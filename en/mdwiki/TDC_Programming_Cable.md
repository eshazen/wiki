# TDC_Programming_Cable
### Programming cable
The TDC board has on programming cable connector that serves as both a JTAG cable and an active serial cable.

This cable has two connectors used to select the JTAG or AS part of the cable.

Attached are the schematic files for this cable.

### Altera sof file creation ====

Altera's quartus software will generate the sof file for you when you compile the firmware and this is used with the JTAG part of the cable.

### Alter pof file creation
A pof file is used to program the onboard flash with the sof file created above.

To generate the pof file for flash programming, open quartus II and go to File->Convert Programming Files...

This will pop up a new window where you need to select EPCS16 under "Configuration device:" and then set the name of the output file.

Now select "Add File" at the bottom to add the sof file you want in the flash and click generate.

Then go to quartus's programming program and select active serial and add a EPCS16 device and the pof file you just created.

