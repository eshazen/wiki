# Scope Clock Build Log

Up: [ScopeClock](ScopeClock.md)

## TO DO

* Re-test with prototype firmware and new DAC board
* EEPROM programming
  * figure out what's wrong

## Working firmware spec

We have two buttons, 3 LEDs and a shaft encoder to work with (plus of
course the CRT display!)  Desirable functions:

* Time display with HV shutdown and timeout (weekly schedule?)
 * Analog vs digital display with date, possibly other text info
* Control options:
 * Possible WiFi connection via "WiFi UART for nntp update
 * Time set via buttons / encoder
 * Options set via buttons / encoder
 
## Build Log

**2024-02-06**

Re-thinking the sound.  
A [6T9design](https://diyaudioprojects.com/Tubes/6T9-Tube-Amp-Kit/)
would be cheaper, and would fit better in the confined space.  The
output transformer can be the PT-31 from AES for $20.  B+ is spec'd at
250V which is just right for a voltage doubler off the line.
Plus I have some 6T9 in stock.

**2024-02-04**

Designed side panels for 3mm acrylic and push to git as front/back/left/right DXFs.

Dreaming about sound.  Maybe [6CY7](https://diyaudioprojects.com/Tubes/6CY7-SET-Amplifier/)
amp using spare primary winding on Antek transformer with voltage doubler for B+.
There is even a 6.3V spare winding for the 6CY7 filament.
Output trans could be Hammond 125BSE.  Could use quite a bit of
the 6CY9 white PCB amp design.

**2024-01-21**

Assemble and test the new DAC board.  Test/working:

* LEDs (ok)
* Shaft encoder (ok)
* Switches (ok)
* DACs (ok)
* HV enable (ok)
* Z-axis out (ok)

Voltage regulator on CPU getting really hot so added a heatsink.

Wrote a little test suite in `software/dac_v2_tests` to test above stuff.

**2023-12-29**

More case ideas:

Hammond chassis with transformers underneath and wiring hidden.
Metal screen covering dangerous stuff.  Nice idea, but there isn't an
ideal size.  
See [hammond 1441 chassis list.](https://www.hammfg.com/electronics/small-case/chassis/1441).

Toroid is about 2-1/4 thick with wiring, so we need a 3" chassis,
chassis up on feet or mount on top.  There is a 12x10x3 aluminum model
(1444-12103) and also one from Bud (AC-413).

Everything fits on a 17 x 12 chassis flat.  Could be a 2" high since toroid is
on top.  Max height above chassis about 4-1/2 inches.

![3d_17x12](attachments/3d_wide_case.png)

![top_17x12](attachments/top_17x12.png)

This is great but the hammond chassis is $50.  How about just a metal
plate on a wood base?  Hammond chassis cover 17x12 is $20.

**2023-12-28**

Looking at a new case design.

Mounting hole sizes:

    Toroid:       0.325 (3/8)
	12V xfrmr:    0.182 (8-32)
	PSU:          0.169 (4.3mm, 6-32)
	Defl. amp:    0.177 (4.5mm, 8-32)
    CPU:          0.126 (3.2mm, 4-40)
	DAC:          0.126 (3.2mm, 4-40)

![case](attachments/clock_case_sloping.png)

![top](attachments/clock_case_top.png)

**2023-12-27**

Use `make_list.c` and `test_pattern.asm` to generate various
circles... loads of ripple.

B+ 360V on scope (on PSU board).  Looks clean, only 200mV 60Hz ripple.
Playing with circles.  Still seems to be some ripple.
Odd, since the deflection output seem pretty stable on the scope.

Looking at the -1200 supply with a 10:1 divider.  There is 30% ripple!
Investigating... maybe bad caps?  Nope.  The issue is that the
C5/C7/C9 chain has (by construction) massive ripple while the
C3/C6/C8/C10 chain is GND referenced.  So on J14 (HV select) only the
following are useful:

    2 - S7
	4 - S5
	
So, move the jumper from J14 1-4 to 1-4.  All good!  Working as
well as ever.  Some tweaking on the display lists for the hands
could help, if I can find the source code which generated it.

**2023-12-16**

Power supply seems to be working.  Connect CPU and fire up... boot
loader and UMON come up OK, though some UMON features ("R") seem to
crash. (umon is at 4800 baud on the bit-bang serial port).

N.B. running on the power supply 12V.  Check on scope and ripple is
small (<< 1V).

Fire up the clock.  It works, BUT there is terrible flicker/ripple.
Maybe something else got fried in the 5/13 event?  Need to investigate
the behavior of the deflection amp.  Need a test pattern better than
the clock, perhaps?

First thing:  check 360V B+ with scope

**2023-12-25**

How to test?  Relay must be active to turn on HV, requires 12V plus
a logic signal.  Solder a wire on J7 pin 1 which can be jumpered
to the top of R1 for bench tests.

**2023-05-14**

Replaced all diodes, rectifiers and caps in the 1200V multiplier.
Patched the R6-D1 trace under R1 where it had melted.

**2023-05-13**

Starting up again.  How/when is the HV supply supposed to be enabled?
Input on J15 has a pull-down, but is a MOSFET gate which can handle +/-20V.

CPU won't start reliably from EEPROM.  Not sure what is up.
Try reprogramming the EEPROM from `software/bootloader/eeprom-umon.hex`.
It verifies, but no improvement.

Turns out the +5V supply has huge ripple.  The "12V" out of the PS has
60Hz of close to 6V pk-pk!  Switch back to the Siglent 5V for now.
Maybe C13 needs to be much larger?

Meanwhile, SMOKE!  Try to move the voltage select jumper on J14 (1-5
to 1-4) with the HV on and there is a huge bang and caps C1, C3 and
perhaps others smoke.  Shut everything off.  Then move the jumper back
to 1-5 and power up again.  This time R1 literally catches fire, then
arcs over.  Hope it gave it's life to save the transformer!  Need to
order some new caps and try again another day.  Sigh.

**2023-02-23**

Testing PSU.  Relay has a couple of mistakes, so HV is always on!  See ECOs.
Otherwise all seems to be well.  Wired up with two surplus 12V transformers
for +12 and -5V.  Relay works.

**2023-02-19**

Power supply board and parts here!  Put together a board.  Ordered a bunch of crimp connectors and housings from DK. 

**2023-02-13**

Crashes occurring.  Could be passing 12h but maybe other times.
Some notes:  V(BAT) should be grounded if not used.

**2023-02-09***

`clock_v1.asm` works!

`rtc_fun.asm` has functions `set_rtc` and `get_rtc` for setting and retrieving the time.
This was slightly troublesome because the clock stores time as BCD and for the rest of
the logic we need integers.  Wrote generic functions `int_to_bcd` and `bcd_to_int` which
could be useful elsewhere (e.g. if we implement the alarms or something)

**2023-02-08**

Trying to get RTC working.  No luck so far.  Probably setup/hold time not being met
due to the '245 buffer being enabled by `nLED2` and BD0 being used for `SDI`.

Wired `SDI` to `LED3`.  Now all is good.  There was also a software bug which
might have been the problem, but having `SDI` as a latched output seems safer.

**2023-02-04**

Updated UMON and bootloader.  Bootloader now has 6s delay, umon updated to `umon_new`.

Fixed (?) the hardware.  nCS needs to be tied to nWR so nCS is high
when nLDAC is asserted.  It seems to work now.


**2023-02-03**

Added a '139 and '161 to the board to (in principle) allow for
automatically loading 4 bytes into the X and Y DACs with 4 successive
I/O writes.  Doesn't work.

Here is the new address table

| Q1 | A0 | Q0 | Function | Dir | Port | Zero | Comments                            |
|----|----|----|----------|-----|------|------|-------------------------------------|
| 0  | 0  | 0  | UART RxD | R   | 40   | 0    | Read UART Rx data register          |
| 0  | 0  | 1  | UART TxD | W   | 40   | 1    | Write UART Tx data register         |
| 0  | 1  | 0  | UART ST  | R   | 41   | 0    | Read UART status                    |
| 0  | 1  | 1  | LED Wr   | W   | 41   | 1    | Write LEDs                          |
| 1  | 0  | 0  | -        | R   | 40   | 2    | -                                   |
| 1  | 0  | 1  | nLDAC    | W   | 40   | 3    | Reset DAC addr, assert nLDAC        |
| 1  | 1  | 0  | -        | R   | 41   | 2    | 0                                   |
| 1  | 1  | 1  | nDAC     | W   | 41   | 3    | Write successive DAC data bytes (4) |
|    |    |    |          |     |      |      |                                     |

### EEPROM programming:

Increased retry count in fast_prog.ino from 100 to 1000, still unreliable.
Need to look into this a bit.

**2023-01-30** speed

Looking at DAC speed-up options.  Currently it takes around 250uS (1000T!) per X/Y update.  Here are a few options using OUTI and OTIR:

* Address lines with separate ports for each.  This involves bringing up some wires from the CPU board.

```
   ; output a list from HL, 4 decoded ports, separate LDAC port
loop:
   LD    C, xxH      ; set C to DAC X LSB
   OUTI              ; 16T  output DAC X LSB
   INC   C           ;  4T  point to DAC X MSB
   OUTI              ; 16T
   INC   C           ;  4T
   OUTI              ; 16T
   INC   C           ;  4T
   OUTI              ; 16T
   OUT   (xx),A      ; 11T  activate LDAC on it's own port
                     ; 87T  loop total

   DJNZ  loop        ; 13T
   ;         Total   ; 100T  25us (40kHz)
```   

Logic to sequence through 4 ports automatically.
LDAC is either another write to same port or a different one.


```
   ; output a list from HL
   OUTI              ; 16T  DAC X LSB
   OUTI              ; 16T  DAC X MSB
   OUTI              ; 16T  DAC Y LSB
   OUTI              ; 16T  DAC Y MSB
   OUT   (xx),A      ; 11T  activate LDAC on it's own port
                     ; 75T  loop total
					 
   DJNZ  loop        ; 13T
   ;         Total   ; 88T  22us (45.4kHz)            					 
```

Either of these is a huge win.  Kind of prefer the second one as it doesn't
involve modifying the CPU board.

**2023-01-29** tests and issues

Got the DACs working and connected to the CRT.
Some pretty significant issues:

* X and Y DACs need to update at the same time.
* Current software is slow, takes around 250uS to update both DACs

Some thoughts:

* route A1, A2 from the CPU board up on a couple of the lines on the
  keyboard connector, so we can do proper decoding in the '138.  This
  would speed things up a lot
* wire some logic so nCS=H and nLDAC=L to update both DACs simultaneously


**2023-01-29** line drawing, z88dk

Wrote an 8-bit version of Bresenham's algorithm in C.
Seems to work, but requires 16-bit arithmetic for the error calcs.
Maybe we should just try it in C?

Reviving Z88dk.  Went to `work/z88dk` and did a `git pull`. Then

```  
  $ sudo apt-get install build-essential dos2unix libboost-all-dev \
  texinfo texi2html libxml2-dev subversion bison flex zlib1g-dev m4 \ 
  libtemplate-perl libtemplate-plugin-yaml-perl libfile-slurp-perl ragel \
  re2c curl
```

See [forum post](https://spectrumcomputing.co.uk/forums/viewtopic.php?p=88866).

Then `$ ./build.sh -C` for a clean build.  Takes a long time.


**2023-01-28** DACs

Got DACs working.  Needed to connect GND pins on U9, fix software.
Now we have a nice range from 400H (-2.5V) to C00H (+2.5V) for both X and Y.
Umon has an 's' command to set the DACs.

**2023-01-28** working on UMON

Rewrote a bit as `umon_nobase_new.asm`.

* Added back register display/edit.
* Fixed bit-bang serial routines so they preserve register 00 bits 0-6 set with umon 'Z' commands.
* 'G' (goto) command now works like breakpoint (restore regs, push breakpoint addr to stack) so it can be used to call subroutines
* Added `F` which calls a jumptable function using stored regs, checking for end of table marked with `JP 0`.  `J` sets the jumptable start.  
* Started on history recall, only partially implmented.  `gets` now returns on `^P` and `^N` storing in buffer, and `^P` runs the previous command.  There is code to push and pop the history stack but still needs some work.

**2023-01-22** working on Z80

Built and programmed a calculator boot rom.  Modified slightly the boot loader in 
`software/bootloader/ser_19200_boot.asm` to include (for now) only UMON in the flash table.
`make` produces `eeprom-umon.hex` which is programmed using `fast_prog.ino` on the arduino programmer and `software/sio/hex_prog.c` to upload the file (4800 baud).  Command line is:

```
  $ ../sio/hex_prog eeprom-umon.hex
```  

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

