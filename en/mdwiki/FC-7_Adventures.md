# FC-7_Adventures
See [FC7_Log](FC7_Log.md) for blow-by-blow log

# Links

 * [FC-7 Home](https://espace.cern.ch/project-FC7/SitePages/Home.aspx)
 * [FC7_R2_v37.pdf](http://ohm.bu.edu/~hazen/CMS/FC-7/FC7_R2_v37.pdf) -- Local schematic copy
 * [fc7_user_manual.pdf](http://ohm.bu.edu/~hazen/CMS/FC-7/fc7_user_manual.pdf) -- Local copy of user manual

## Firmware creation/loading

### Building Firmware

Check out firmware as they say in the manual:

```
  $ svn co https://svn.cern.ch/reps/cactus/tags/ipbus_fw/ipbus_2_0_v1
  $ svn co https://svn.cern.ch/reps/ph-ese/be/fc7/tags/fc7_5.0.1
```

Create a dir "fc7" under "ISE".

Put cactus in `top/cactus/tags/ipbus_fw/ipbus_2_0_v1`.

Put FC7 in `top/fc7/tags/fc7_5.0.1`.

NOTE:  this is not quite what they say in the docs.

Find a Vivado project file in `ISE/fc7/tags/fc7_5.0.1/fw/prj/fpga_fc7_golden`.

Have to edit this file to change the top-level path to match mine.

Load into Vivado 2015.2 (64-bit).  Try to build.  Works!

Generate bit file.

*IMPORTANT:  Has to be BIN file not BIT file*

Convert to BIN file as per user guide:

 * Start impact (from ISE 14.7 works)
 * Choose "Generic parallel prom" with "Auto select PROM" checked
 * Choose BIN file with swap bits

If needed, obtain and install the =imgtool= utility from the SVN link the the FC7 user manual, or grab a local copy: [ic_mmc_v1_6_1.zip](http://ohm.bu.edu/~hazen/G-2/ic_mmc_v1_6_1.zip).

Then format the SD card (`/dev/mmcblk0` on my Ubuntu system).

```
   $ sudo ./imgtool /dev/mmcblk0 format Firmware
   $ sudo ./imgtool /dev/mmcblk0 add GoldenImage.bin fc7_top.bin
```

Make sure Switch 'E' (number 5 up from bottom is LEFT)

If you have trouble with the SD card, try this to erase the first block:

```
 $ sudo dd if=/dev/zero of=/dev/xxxx bs=1024 count=1
```


## Network Access

Trying to figure out the IP address.  First, plug into crate with NAT MCH.
Blue LED blinks, looks ok.

Try to follow the recipe in the doco to read the IP address:

```
  $ ipmitool -H 192.168.1.41 -P "" -B 0 -T 0x82 -b 7 -t 0x7a raw 0x30 0x05
```

Doesn't work.  Try another based on AMC13 scripting:

```
  $ ipmitool -H 192.168.1.41 -U '' -P '' -T 0x82 -b 7 -t 0x7a raw 0x30 0x05
   c0 a8 00 87 00 0a 35 01 ea f3 00
```

This should be 192.168.0.135 but doesn't respond to ping.  Possibly some other
IP address is compiled-in?

Try to set it:
```
  $ ipmitool -H 192.168.1.41 -U '' -P '' -T 0x82 -b 7 -t 0x7a raw 0x30 0x03 0xc0 0xa8 0x80 0x80
```

Reads back OK but still no ping.  Probably need to build our own firmware.

Built own firmware, now it works, using this IP address!
(A small mystery because in =user_logic_basic.vhd= we have:

```
  ip_addr_o        <= x"c0_a8_00_50";
  mac_addr_o       <= x"aa_bb_cc_dd_ee_50";
  rarp_en_o        <= '0';              -- ESH: set to 0
  use_i2c_eeprom_o <= '0';              -- ESH: set to 0
```

Which is ignored?

## Building Software

```
  $ svn co https://svn.cern.ch/reps/ph-ese/be/fc7/tags/fc7_5.0.1/sw
  $ cd sw/fc7
```

Edit `MmcPipeInterface.cpp`, add:

```
#include <arpa/inet.h>
```

Then:
```
  $ source setup.sh
  $ make
```


