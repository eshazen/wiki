# PB_demo_nexsys2_Release_notes
Back to [BioDelayGenerator](BioDelayGenerator.md)

This is a demo picoblaze design configured for the Digilent Nexys2 board.
Unzip it somewhere convenient, then add all the VHDL files and the UCF file
to a new ISE project.

For a board other than Nexys2 you will need to change the UCF file.
The top-level I/O are as follows:

```
  clk - 50MHz clock from crystal
  RX - serial port input data
  TX - serial port output data
  anodes[3:0](3:0.md), seg[6:0](6:0.md)
  sliders[7:0](7:0.md)
  leds[7:0](7:0.md)
  buttons[3:0](3:0.md)

```
If you want to build a version which doesn''t use some of the above
you will need to delete them from the UCF file, and also modify
the file toplevel.vhd to eliminate references to the deleted pins.

The serial port is configured as follows:

```
  115200 baud
  8 data bits
  no parity
  1 stop bit
  no flow control

```
The program sends a _'$_ prompt and waits for input.  It understands
two commands:

```
  R n                n is a hex port number 0-f
  W n dddd           dddd is 16-bit data to write 0000-ffff

```
In response to the ''r' command 4 hex digits are sent with (currently)
two copies of the data read from the microblaze processor port
specified.



