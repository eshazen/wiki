# CMS_VICE_Specs
## IPBUS Address Table
  http://gauss.bu.edu/redmine/projects/cms-ecal-vfe-adapter/repository/raw/VICE/addr_table.xml
## Operation modes:
 * "pedestal" mode:

    Capture raw VFE data in a BRAM and make available for readout

 * "counter" mode:

    Generate and send fake data to GBT output with just a counter

 * "adapter" mode:

    Translate VFE data to FE and transfer

## Board IDs

  | SN | IP | MAC |
  | -- | -- | --- |
  | 0x0 | 192.168.128.16 | 08-00-30-F3-00-3F |
  | 0x1 | 192.168.128.17 | 08-00-30-F3-00-3D |
  | 0x2 | 192.168.128.18 | 08-00-30-F3-00-3C |
  | 0x3 | 192.168.128.19| 08-00-30-F3-00-3B |
  | 0x4 | 192.168.128.20 | 08-00-30-F3-00-3A |
 * If you place a jumper on the lower two pins on the 6-pin P3 (ERNI connector side of the board, VFE side), then the IP addresses will all switch to 10.0.0.XX, where XX is the last octet in the address above.
```
    |
    |  xx
    |  xx
    |  xx <- addr jumper
    +-------
```

## Address Table

   * [Address table](http://ohm.bu.edu/~dgastler/CMS_VICE/address_table.xml) for use with tools to talk to the board.


|address name  |address (binary)|name|type|bits|notes|
|------- ----  |------- --------|----|----|----|-----|
| | | | | |
| FW_VER  |0x000 | Board FW Version | r |31..0 | YY.MM.DD.VV (hex) |
|  | | | | | |
| LHC_CLOCK  | 0x001 | Board clock status | | |
| LHC_CLOCK.LHC_CLOCK_RESET | |  | r/w  | 0 | reset |
| LHC_CLOCK.LHC_CLOCK_SOURCE |                  |                    | r/w  | 1 | LHC clock source |
|  | | | | | |
| SN | 0x2 | Board SN | r | 3..0 | HW ID |
|  | | | | | |
| CAP_CTRL | 0x400 |pedestal mode control| action | | |
| CAP_CTRL.CAP_START | | | 0: acquisition star | end writing samples to the circular buffer |
| CAP_CTRL.CAP_STOP | | | |1: acquisition stop | start circular buffer of captured samples |
|  | | | | | |
| CAP_SIZE | 0x401 |pedestal capture info| read |6..0: capture size | number of two sample words valid to read from each channel |
|  | | | | | |
| CH1_CAP | 0x480 |pedestal waveform ch1| r |13..0: sample N | samples |
|  | | | |29..16: sample N+1 |  |
| CH2_CAP |0x500|pedestal waveform ch2| r |13..0:  |  |
|  | | | |29..16:  | |
| CH3_CAP |0x580|pedestal waveform ch3| r |13..0:  |  |
|  | | | |29..16:  | |
| CH4_CAP |0x600|pedestal waveform ch4| r |13..0:  |  |
|  | | | |29..16:  | |
| CH5_CAP |0x680|pedestal waveform ch5| r |13..0: | |
|  | | | |29..16:  | |
|  | | | | | |
| OUTPUT_CTRL | 0x800 | OUTPUT mode | | |
| OUTPUT_CTRL.CH1_OUTPUT_CONTROL | |output mode control | r/w |3..0:   | output mode ch 1 |
| OUTPUT_CTRL.CH2_OUTPUT_CONTROL | |output mode control | r/w |7..4:   | output mode ch 2 |
| OUTPUT_CTRL.CH3_OUTPUT_CONTROL | |output mode control | r/w |11..8:  | output mode ch 3 |
| OUTPUT_CTRL.CH4_OUTPUT_CONTROL | |output mode control | r/w |15..12: | output mode ch 4 |
| OUTPUT_CTRL.CH5_OUTPUT_CONTROL | |output mode control | r/w |19..16: | output mode ch 5 |
|  | | |  | | 0x0: idle pattern |
|  | | |  | | 0x1: VFE data  ("3FFF" on VFE simulator firmware version)    |
|  | | |  | | 0x2: counter      |
|  | | |  | | 0x3: set value      |
|  | | | | | |
| CH1_SET_VAL | 0x801 | set value | r/w |13..0:   | ch1 |
| CH2_SET_VAL | 0x802 | set value | r/w |13..0:   | ch2 |
| CH3_SET_VAL | 0x803 | set value | r/w |13..0:   | ch3 |
| CH4_SET_VAL | 0x804 | set value | r/w |13..0:   | ch4 |
| CH5_SET_VAL | 0x805 | set value | r/w |13..0:   | ch5 |

## Flash programming
 * The boards have a 3.3V 32Mbit n24q32 spix1 flash
 * tcl command for mcs files: write_cfgmem -format mcs -interface spix1 -size 32 -loadbit "up 0x0 /home/dan/work/CMS/cms-ecal-vfe-adapter/VICE/firmware/trunk/proj/CMS_VICE/CMS_VICE.runs/impl_1/CMS_VICE.bit" -file /home/dan/work/CMS/cms-ecal-vfe-adapter/VICE/firmware/trunk/proj/CMS_VICE/CMS_VICE.runs/impl_1/CMS_VICE.mcs
