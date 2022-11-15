# QuickUSB_Debugging
_'1/13/06_

Our setup:   Fedora Core 3 linux, kernel 2.6.12-1.1378_FC3.
gcc version 3.4.4 20050721 (Red Hat 3.4.4-2).
Dell motherboard USB (1.1)

Hooked up to Spartan-3 eval board with 6" ribbon cable.  Connections:

```
  QuickUSB       Signal   Spartan-A2 pin (FPGA)
 J2 8            IFCLK    35 (D9)
 J2 19, 21...33  FD0-7    19..33 (B5...A13)
 J2 22           REN      22 (B7)
 J2 24           WEN      24 (B8)
 J3 4            SLRD     4 (E6)
 J3 6            SLWR     5 (D5)
 (plus GNDs)

```

Simple FPGA firmware which just monitors REN, WEN and sends counter values for reading.
Read data checked superficially.  Write data not checked (just word count).
Results:

 * Reads, writes work for 128, 256, 512 bytes at a time using master mode

Other byte counts cause mysterious problems.  After a failure, it seems that
re-enumeration is required to restore order.

Slave mode doesn''t work at all (yet).  Tried loop-back:

```
  slwr <= not ren
  slrd <= not wen

```
With and without the ''not'.  Doesn't work.

