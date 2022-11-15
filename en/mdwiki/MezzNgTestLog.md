# MezzNgTestLog

Up: AtlasMichiganMezzCard

*01-31-2017, hazen*

Board 1 and software for ASD read/write seems to be working.
Checking AVR fuses on S/N 1.

  lfuse: 0xe2  hfuse: 0xdf  efuse: 0x01

Fuses on (new) S/N 6:

  lfuse: 0x62  hfuse: 0xdf  efuse: 0x01

So, need to program lfuse to 0xe2.  AOK, now fhe firmware is running.

Working with #8 with TDC installed.  Program ok.  Current ~ 200mA.  LVDS levels look good on ASD outputs.
