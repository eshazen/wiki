# XilinxFlashUSB
This page is intended to document an effort to develop an on-board programming
capability for Xilinx 6 series and beyond FPGAs with SPI flash connected.
This would be used on boards initially with USB/serial interfaces and and
Micron NOR flash i.e. M25P32.

Bitstream file sizes range frm 2.7Mbits to 27MBits.  Programming would be done
from an MCS file, created using Xilinx impact, "Create PROM File" flow.  Select
the "Generic Parallel PROM", size unimportant but sufficiently large (64M is file).
Click "Add Storage Device" once.  Set the Output file name and Location as desired.
Then OK.  Navigate to and select the ".bit" file for the design.  Leave the start
address and revision at 0.  Finaly, when you have the little diagram with the
"PARALLEL PROM" connected to the FPGA, click "Generate File" in the lower left
Processes box.

This creates an "mcs" file, which should start like this:

```
:020000040000FA
:10000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
:100010005599AA660C8500E004008C8560148C82DA
  ...
```

This file is in Intel Hex (aka MCS) format:  see [IntelHex](http://en.wikipedia.org/wiki/Intel_hex)
This data is programmed into the flash at the addresses specified in the hex file (starting at 0)
in pages of 256 bytes (according to the flash data sheet).


Reference Materials:

 * [Spartan 6 Configuration Guide](http://www.xilinx.com/support/documentation/user_guides/ug380.pdf)
 * [M25P32 Data Sheet](http://www.micron.com/~/media/Documents/Products/Data%20Sheet/NOR%20Flash/Serial%20NOR/M25P/M25P32.pdf)


Firmware and python interface code:
svn co https://edf.bu.edu/svn/edf/Dan/Nexys3/Flash/
