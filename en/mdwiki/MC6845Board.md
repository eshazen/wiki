# MC6845Board
Design-in-progress for an MC6845 based character display.

 * SVN: http://ohm.bu.edu/svn/edf/EricHome/Z80System/hardware/mc6845/
 * AN-0851: https://archive.org/details/bitsavers_motorolaapaMC6845CRTCSimplifiesVideoDisplayControl_9722748

Design log:

*2021-09-06* 6845 speeds.  Need a 3.15MHz character clock

 * MC6845 is too slow
 * MB89321A/B is good (6800 interface)
 * MB89322A/B is good (8080 interface)
 * HD46505 (only 3.0 MHz)
 * HD68x45S is good (3.7 MHz) x is A/B/C for bus speed


*2021-09-05* Re-starting

Default is 640x480, as 80x30 text cells 8x16 each.  So we need a cell address up to 80x30 = 2400 (12 bits)
so MA0..11.  For 16 vertical rows we need RA0..RA3.

An EEPROM character generator takes D0-D7 plus RA0..RA3 for the cell and provides 8 horizontal pixels.

For bitmap graphics, we instead route RA0..RA3 to video RAM bits and bypass the character generator
(or program a region to be 1:3) to output a different 8-pixel pattern for each row.

```
VGA timing (640x480 60Hz):
    horiz:  16 + 96 + 48 + 640 = 800 at 25.2 MHz
    vert:   11 + 2 + 31 + 480 = 524
```

*CPU Interface*

Character mode:  need 4k address space.  Graphics mode:  need 64K address space with funny address mapping.


*2020-11-15* Looking at [Schematic](http://ohm.bu.edu/svn/edf/EricHome/Z80System/hardware/mc6845/trunk/mc6845.pdf)
as of now.  Many loose ends:

 * CPU interface is generic with DS0..DS3 but no mapping to devices on board.
 * MMUX signal not driven
 * nMEM_RD to memory page must be low for video output, probably needs to be MUXed.  (there is one spare LS157 channel).

Fix a few things and re-commit.  Thinking to get rid of the Arduino stuff or at least plan to move it to a shield.  Need to double-check the schematic against the motorola app note.
