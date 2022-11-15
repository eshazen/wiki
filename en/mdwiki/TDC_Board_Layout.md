# TDC_Board_Layout

 * [Preview2013-08-09](http://ohm.bu.edu/~hazen/G-2/ASDQ/Preview2013-08-09/)
 * [Schematic](http://ohm.bu.edu/~hazen/G-2/TDC-Proto2.pdf)

## Pending Changes

Component values:

```
C35, C36 = 1.0uF
R41 = 52.3k
R42 = 30.1k
R43, R47 = 39.2k
R44, R48 = 36.5k
R45 = 0
R46 = omit
J4 = LSHM-130-02.5-F-DV-N
```

 * On U3F (FPGA), connect MSEL0 and MSEL2 pins to GND.  Connect MSEL1 to V+3.3.

## Design Notes

 * TDC is EP3C5U256C6 (though we should remain pin compatible with EP3C16U256) pkg is 14x14mm 0.8mm pitch 256 pin BGA
 * Configuration device is EPCS16SI8N (8-SOIC)
 * Wire configuration as:  [complicated diagram](http://ohm.bu.edu/~hazen/G-2/c3_jtag_cfg.png)
   * Need 2 10-pin headers for JTAG plus ICSP.  Maybe a Samtec ESHF .05" pitch header?  Can merge into one larger if space is tight.
 * [EP3C5_pinout.xls](http://ohm.bu.edu/~hazen/G-2/EP3C5_pinout.xls)
 * DAC124S085 DAC should drive four signals through amplifiers to provide -3V...+3V swing.  Maybe need to power op-amps
on +/-4V to get full swing.
 * Connector candidate: Samtec T1M-10-GF-S-RA

ASDQ-TDC board connector FLE-113-01-G-DV mated to FTSH-113-02-L-DV mated height is about 0.29" (7.36mm)

Power supplied is ~350mA on each +4V and -4V to ASDQ board.

J1 Connector



| *'Pins* | *Signal* |*Notes* |
| ------- | -------- |------- |
| 1-16 | D1A...D8B |LVDS pairs (unterminated) |
| 17 | TREFE_IN |-3...+1.5V DAC output |
| 19 | TREFO_IN |-3...+1.5V DAC output |
| 21 | DTHR_IN |0...+2.0V DAC output |
| 23 | IBLR_IN |-3...+3V DAC output |
| 25 | TSTN1_IN |Test pulse LVDS + |
| 26 | TSTP1_IN |Test pulse LVDS - |
| 18,20,22,24 | GND | |

J4 Connector


| *'Pins* | *Signal* | *Notes* |
| ------- | -------- | ------- |
| 1-16 | D1A...D8B |LVDS pairs (unterminated) |
| 19,20 | V+3IN |3.5..4V nominal (5.5V max) |
| 23,24 | V-3IN |-3.5V..4V nominal |
| 25 | TSTN2_IN |Test pulse LVDS + |
| 26 | TSTP2_IN |Test pulse LVDS - |
| 17,18,21,22 | GND | |


## Configuration Alternatives

 * Small-footprint serial flash, i.e. MX25L4006EZUI-12G (2x3mm) or M45PE40-VMP6G (one of many 5x6mm).
 * Small-footprint uC i.e. ATTiny13A-MMU (also 3x3mm)

## Reference Material

 * https://www.terasic.com &ndash; source for DE0 eval board and Terasic Blaster USB cable
 * DAC124S085 from TI (Quad SPI 12-bit DAC) looks good for bias setting.




