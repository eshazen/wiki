# PicoBlazeControlBlockReleaseNotes
Back to [BioDelayGenerator](BioDelayGenerator.md)

This page describes a generic serial control block designed to provide an
interface to register-oriented logic.  Up to 16 registers, each up to 16-bits wide
are supported.  The timing is very close to the timing described for input and output
in the PicoBlaze documentation (linked below).

 * [Xilinx PicoBlaze Page](http://www.xilinx.com/ipcenter/processor_central/picoblaze/picoblaze_user_resources.htm)
 * [serial.vhd](http://ohm.bu.edu/~hazen/BioDelay/vhdl/serial.vhd)
 * [picoblaze_read_timing.gif](http://ohm.bu.edu/~hazen/BioDelay/vhdl/picoblaze_read_timing.gif)
 * [picoblaze_write_timing.gif](http://ohm.bu.edu/~hazen/BioDelay/vhdl/picoblaze_write_timing.gif)

For most applications, read operations can be accomplished by connecting a multiplexer
to *'data_in* controlled by *addr_out*.  If external logic must be notified of a read
operation (for a FIFO, i.e.) the *'rd_ena* signal may be used.

For writing, capture the data on a rising clock edge when wr_ena is asserted.

It is assumed that the *'clk* input is the same as used for external logic,
and that an appropriate timing constraint on the clock period has been set.

The serial port is configured as follows (this may be changed in the source code):

```
  115200 baud
  8 data bits
  no parity
  1 stop bit
  no flow control

```
The program sends a one-line identification string followed by a
*'$* prompt and waits for input.  It understands
two commands:

```
  R n                n is a hex port number 0-f
  W n dddd           dddd is 16-bit data to write 0000-ffff

```
Each command should be terminated with an ascii CR character.
All characters sent to the interface are echoed to the host.
Each CR received from the host is echoed followed by an ascii LF.

In response to the *'r* command 4 hex digits are sent followed
by an ascii CR, LF sequence and a new *'$* prompt.

In response to the *'w* command a new *$* prompt only is sent.

If any unrecognized character is seen in the input, the string *'ERR*
followed by CR, LF and a new *'$* prompt is sent to the host.

