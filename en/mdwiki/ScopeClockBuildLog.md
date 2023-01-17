# Scope Clock Build Log

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

