# Scope Clock Build Log

## TO Do

* commission UART so we can debug other hw more easily
* cut trace and rewire DAC A0/A1 to LED3
* burn a new EEPROM which goes straight to UMON

## Build Log

**2023-01-22** working on Z80

Built and programmed a calculator boot rom.  Modified slightly the boot loader in 
`software/bootloader/ser_19200_boot.asm` to include (for now) only UMON in the flash table.
`make` produces `eeprom-umon.hex` which is programmed using `fast_prog.ino` on the arduino programmer and `software/sio/hex_prog.c` to upload the file (4800 baud).

The EEPROM programming is a bit unreliable... took several tries to get through the whole file.  Maybe the timeout is too short for these EEPROMs?

Note that the calculator code is tuned for a 16MHz CPU clock while we're running at 4MHz.  This means 19200 baud is now 4800 for the bit-bang serial, and more annoyingly the 10s startup delay for the boot loader is now 40s.  Create a tiny program which can bypass the delay.  For a quick startup:

```
   (power-up the board, observe '*')
   $ .../sio/hex_binary .../testio/zout/booty.hex 4800
```

This will immediately start UMON.


**2023-01-21**  Hardware tests/fixes

* Jumper the UART for 9600 baud and write a test program `software/testio/test_uart.asm`.
This sends data on the UART Tx and seems to work.
* Start on DAC testing.  Find that there is a missing connection the the schematic,
and that pins 22-23 need to be jumpered on U8 and U9 (DAC chips)
* A0 is re-used for DAC A0 and the '138 decoder.  This doesn't work.  So, need to connect another spare latch signal (e.g. LED3 or U3 pin 10) to the A0/A1 on the DACs

**2023-01-16** Z80 and software

Z80 and DAC interface boards in and mostly assembled.  The Z80 is running (at least "halt" runs).  Using the old Arduino EEPROM programmer and some cheap 28C256 EEPROMs from Jameco.

It would be somewhat nice to get UMON running on the bare CPU.  I used bit-bang serial successfully but here are some alternatives to consider:

* [Ganssle big-bang article from 1991](http://www.ganssle.com/articles/auart.htm)
* [Steve Justin github](https://github.com/SteveJustin1963/tec-BIT-BANG)

**2022-12-29** Debugging

Works pretty well.  Added a two-stage RC low-pass filter on +360  (R=200 5W, C=100uF).  Changed the Cathode supply (nominally -1500V) to a clip and like it pretty well at half way up the chain, so around -800V.  That way we stay in the linear range of the deflection amps.

The focus is a lot better at -1500V though or even -1200V so maybe some work on the deflection amps to improve linearity would be helpful.

Input voltage range is about 3V pk-pk (+/-1.5V) for a reasonable full scale.  Probably the drive circuit should be powered by +/-5V with gain/offset POTs.

![prototype photo](https://github.com/eshazen/scope-clock/blob/main/pix/overview2_800V_sm.jpg)

Thinking about Z80 logic.

Looking at 5V, parallel interface DACs with 8/10/12 bits.  8 bits would be fine with gain/offset adjust pots, so probably we should just go with the DAC08 and call it a day.  

Another option:  MAX503 (MAX530) is a nice 10-bit (12-bit) option with a buffered voltage output.  Can do +/-2.048V with no op-amp.  Settling time ~25us though (13kHz BW).  This would connect directly to the LED port on the retro-25 CPU.

**2022-12-27** Debugging

HV and LV working.  Diff amp working with gain of ~60.

"Brilliance" adj not working, but transistor Q1 is ECB whereas layout is "EBC".  Patched up PCB.

Need to put a bleeder resistor on the 1.4kV.

**2022-12-22** Catching up

PCBs received for CRT bias [schem](https://github.com/eshazen/scope-clock/blob/main/hardware/anderson_crt/anderson_crt.pdf) and deflection amp [schem](https://github.com/eshazen/scope-clock/blob/main/hardware/deflection_amp/deflection_amp.pdf). Bias board assembled.  Waiting on parts for deflection amp.

Draft power supply schematic, footprint, placement [git](https://github.com/eshazen/scope-clock/tree/main/hardware/psu)

Meanwhile, power supply.  +360V current is about:

     2mA for CRT
    15mA for defl
    12mA for each side of diff pair
	30mA total

Built 2x multipler using 1n4007 diodes and 100uF 400V caps from EDF.
Input again 175V winding on Antek.  Load with 15k.
Voltage is 20-25% high.  Put 220 ohm in series with input, comes out
about right (1/8W input resistor burns, not surprising).  Seems to work.

Built 8x negative Cockroft-walton using 1n4007 diodes and 47uF 400V
caps from eBay.  Input is 175V winding on Antek xfrmr.  Load with 1.2M
resistors.  About 1500V observed with 120VAC input.

