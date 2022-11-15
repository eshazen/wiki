# HpCalcBuildLog
## Build log

*ECOs:*

 * D2 backwards
 * U1B clock (p11) missing
 * BUSRQ should be tied high
 * disconnect `nWE` on the flash, jumper or logic to enable

## Reference

 * https://en.wikipedia.org/wiki/Intel_HEX#Record_structure
 * http://wikiti.brandonw.net/?title=Z80_Instruction_Set

## TODO:

### S/N 1

 * Reprogram EEPROM on S/N 1:
   * Updated calculator
   * umon
   * reflect restart vectors

## Done:

 * Copy X register or stack to X11 clipboard (done, see `clip_stack` in `util`).
 * Blank / dim display after timeout (done, 10 min timeout)
 * Save/restore programs in flash (done, see `load_prog` in `util`).
 * Code in flash with serial boot loader [done]

## Serial Number 2

*2020-08-30*

All running well with custom power supply.  Fails to boot from EEPROM.
Possibly using the bad EEPROM, so switching to another.  Turned out the flash
table in the boot loader was wrong-- umon at 8100 had a size of 1000 which
overwrote the first page of the calc FW at 9000.  Doh!

*2020-08-03*

Second CPU board running UMON happily.  Edited the [boot loader](https://github.com/eshazen/retro-25/tree/master/firmware/bootloader), to have only one flash image for UMON:

```
;;;
;;; table of flash images
;;;
flashtable:
	dw	0xcafe		;magic number marks start of table
;;; second flash image (umon)
	dw	0x5000		;above the first image
	dw	0x8100		;RAM target address
	dw	0x1000		;size in bytes
	dw	0x8100		;entry point

	dw	0,0,0,0		;table ends with zeroes
```

Build a combined EEPROM image with:

```
srec_cat ser_19200_boot.hex -Intel umon.hex -Intel -Offset -12544 -Output boot_umon.hex -Intel
```

Then program into EEPROM using Arduino programmer code [here](http://edf.bu.edu/svn/edf/EricHome/HPCalcSim/software/Arduino/fast_prog/) and programmer utility [hex_prog.c](http://edf.bu.edu/svn/edf/EricHome/HPCalcSim/software/sio/hex_prog.c).

Use an Arduino as USB/serial bridge:  short RESET to GND, then wire:
```
  J2-2 to "0" on Arduino
  J2-3 to "1" on Arduino
  J2-6 to GND on Arduioo
```

Set minicom to 19200 baud and UMON boots up!  Should be able to debug all now without EEPROM emulator or other measures.

## Serial Number 1

*2020-06-03*

Update UMON to use similar serial code to calc @ 19200 baud (no macros).  Update 'B' (binary loader) to display load point and length.  Test by loading second UMON at 9100, works fine.  Also, UMON now displays end of used memory on startup.

Adding proper breakpoint/continue facilities and help command to umon.

Port NASCOM 4K integer BASIC (https://github.com/feilipu/NASCOM_BASIC_4.7) for fun!

*2020-05-26*

Added a serial server.  Waits for serial "break" then expects a command at 19200 baud:


| `I` | display memory location of stack, registers, program |
| --- | ------- ------ -------- -- ------ ---------- ------- |
| `S` | display stack registers A,B,C(X),Y,Z,T,M1,M2 |
| `R` | display storage registers R0-R7 |
| `Mdddddd` | write storage registers starting at R0 |
| `P` | display program as 7 registers |
| `Qdddddd` | write program registers starting at beginning |
| `J` | Jump to UMON if loaded at 0x8100 |

Data `dddddd` is interpreted as a stream of hex digits which are written to the specified register as sequential nibbles.  After each 14 digits a CR/LF sequence is issued.

The storage registers R0-R7 and the program registers may only be written or read sequentially starting from the first location.

*2020-05-25*

Sending break on serial port jumps to 8121H (special "save state" entry point to UMON).  State is saved and UMON restarted.  New "C" command restores state and jumps to calculator.  Also, new "H" command in UMON dumps HP calc registers as:
```
>H B757
A 916FFFFFF91900
B 21000000020000
X 91600000000981
Y 01600000000981
Z 01230000000980
T 91230000000020
1 20000000000101
2 91600000000981
>
```

Some interesting details:

A+B together control the display.
 * A has 0-9 for digits display, "F" for blank
 * B has 2 (sign) or 1 (decimal) or 0 (nothing) as flags for each digit
   * If B=2, then A has 0 for no sign or 9 for "-"
   * If B=1, then a decimal appears after the corresponding A digit

In the stack registers X/Y/Z/T:

 * Sign digits at positions 2, 13 are 0 for "+" or 9 for "-"
 * Mantissa is in positions 3-12

Values are stored normalized with mantissa in range 0 <= m < 1.

Negative mantissa indicated by "9" in position 13

Negative exponent is coded as 100-exp, so 10^-3^ is coded as 97 with the sign flag set ("9" for negative exponent)

Looking at program storage.  Added:
```
struct {
  uint16_t jump_to;		/* UMON jump address 0x8121 */
  uint16_t regs;		/* address of registers */
  uint16_t ram;			/* address of RAM */
} reg_info;
```
(currently find by looking at link map)

See this note for more info:
https://github.com/eshazen/retro-25/blob/serial/notes/internal_storage.txt

*2020-05-24*

Toolchain restored.  Thinking about serial opts (program save/load, X/stack save/load) via serial.  How to get attention of the calc for special ops?  Ideas:

 * Calc end: Use the "on/off" switch to put the calc in "supervisor" mode for all such things
 * CPU end: Use the serial line.  Send break `tcsendbreak(fd,0)` to get calc attention then a command.

N.B. right now sending break (minicom `C-A f`) registers as the key "X/Y".

X11 clipboard interface:  use `xclip` as-is via system call.

*Working*:

Create branch `serial` to work in.
Add `and 07fh` to `diskey_sw.asm` to ignore serial input.  Reload and test.  Seems to work.

Add `umon_serial()` to check serial status and return '1' if space detected.  Add a check in the main loop to wait for end of space and trigger a fake 'R/S' key press.  Reload and test.  Works.

*2020-05-22*

Desktop updated to Ubuntu 20.04.  Need to restore toolchain, which is a useful exercise.  First, *zmac* from [here](http://48k.ca/zmac.html).  Builds fine, with a few warnings.  This is used to build umon and friends, but not the calculator.

Now z88dk from [github](https://github.com/z88dk/z88dk).  Follow instructions:
https://github.com/z88dk/z88dk/wiki/installation (do _not_ just run make, or you will waste hours!)

So now the github code https://github.com/eshazen/retro-25 builds and produces a working calculator.

The EEPROM is currently programmed with a bootloader which tries for a serial load at 19200 baud for 10 seconds, then loads the calculator from EEPROM.  To load code via the serial port:
```
  press reset, then within 10s:
  hex_binary main-9000.hex 19200
```
(hex_binary is in http://edf.bu.edu/svn/edf/EricHome/HPCalcSim/software/sio/)

*2020-04-29*

Ideas for progress with program load/save port:

 * Make UMON resident with some sort of escape-to-umon via (e.g.) power switch
 * Expose emulator RAM area with pointers

*2020-04-09*

Thinking about EEPROM some more.  New idea:  Use spare '193 gate to decode `KQ5 = KQ6 = '1'` along with `nMWR` as EEPROM write.

*2020-04-08*

Got flash load working.  New program [hex_prog.c](http://edf.bu.edu/svn/edf/EricHome/HPCalcSim/software/sio/hex_prog.c) for use with Arduino [fast_prog.ino](http://edf.bu.edu/svn/edf/EricHome/HPCalcSim/software/Arduino/fast_prog/fast_prog.ino).  There are some funnies... it works at 4800 baud but not 9600 baud and there is a fair amount of debugging turned on.  Need a bit more work.

 * Save/restore memory from flash

*2020-04-07*

Working on EEPROM storage for code.  Working out some tricks with `srec_cat`.  To merge two files:
```
 $ srec_cat file1.hex -Intel file2.hex -Intel -Offset -32768 -Output out.hex -Intel
```

Merge `file1.hex` with `file2.hex`.  Subtract 0x8000 from addresses in `file2.hex`.

*2020-04-01*

Fixed switch readout with some hackery.  !Display/Keyboard now in `diskey_sw.asm`.

`umon_switches()` returns state of two switches

`umon_kbscan` returns hit flag in H and keycode in L

"Power" switch enables / disables display only.  Currently needs a button press to update the status.  PGM/RUN switch works as expected, as do running programs :)

*2020-03-31*



The switches are troublesome.  Need to think on this some more tomorrow.

*2020-03-30*

Got package from Jameco with standoffs, switches, 20MHz and 32MHz osc.  Replace Z80 with 20MHz one and osc with 32MHz, so system clock is now 16MHz.  It seems to work!  Changed nothing, and bitbang serial works at 4800 baud.  The fast loader `ser_4800_bin` now works at 19200 baud.

Loading the calculator image... it works!  Speed is completely reasonable, perhaps 20% slower than the original Z80 but eminently usable.

Need to implement on/off and p/r switches.  Currently they return keyboard scan codes.  One option:  modify kb scan to return multiple codes, then sort it out in C.

*2020-03-27*

After sleeping on this it seems better to upgrade the Arduino programmer to handle 32k addresses rather than making a mess of the CPU board.  Did this, hopefully wired according to [new_prog.png](http://ohm.bu.edu/~hazen/HPCalc/new_prog.png).  Tested with 32k memory test on the RAM, seems to work fine.

Thinking on firmware / boot loader:

 * Check keyboard for magic key presses:
   * Enter UMON
   * Binary loader
 * Otherwise, copy calculator code to RAM and run


*2020-03-26*

Working on the EEPROM write enable latch.  Can use 2nd half of '139 for I/O decode expand, but need to piggyback both a '74 and '32.  Tagged out the Rev A schematic and made the changes with notes in the trunk.

*2020-03-25*

Added `diskey.asm` to NP25-Z80 project so calculator code now self-contained.  Created stand-alone binary loader at 4800 baud `ser_4800_bin.asm` which loads at 8100H, then can load calc software quite a bit faster.  Still need to get the EEPROM going but this is an improvement.

*2020-03-24*

C version of calculator code running!  Several issues:

 * Really slow on 4MHz Z80
 * SST key not working (maybe fixed, zero code problem)
 * No R/S switch

Requires UMON to be loaded at 8100H for now to support display/keyboard.

To Do:

 * Assembly version of code and/or faster clock
 * Faster loader, maybe speed up baud rate on serial port
 * Add and support switches
 * Enable writing to EEPROM
 * EEPROM continuous memory

*2020-03-22*

Added Z, I, O commands to umon and adjusted bit timing to compensate.
Z command allows control of port zero bits 0-6 for keyboard testing.

```
  >Z 40       turns on LED
  >Z 0        turns off LED
```

Wired up keyboard and display.  Wrote initial code in [diskey.asm](http://edf.bu.edu/svn/edf/EricHome/HPCalcSim/software/umon2/diskey.asm).  New command "K" scans keyboard, returns row/col.  New command "7" updates display from selected addres.

*2020-03-21*

EEPROM is quite flaky.  Reluctant to try 2nd one.  Thinking about how to extend to 15 bits of address on the programmer so can enable data protection.  Problem is, all 14 readily-usable Arduino pins are used.  Would need to add a '374, use 7 bits for addr(high) and 8th bit to replace whatever is used to clock the FF (another address bit would be most comfortable).

Never mind all that.  Observe that nWE sometimes drifts around when write enable switch is off.  Wire 2nd contact of SPDT switch to +5.  Seems OK now.

Replace boot loader with new binary one [ser_1200_bin.asm](http://edf.bu.edu/svn/edf/EricHome/HPCalcSim/software/ser_1200_bin.asm).  Loaded in EEPROM. Protocol

```
  output '*'
  expect 0x91, 0x57
  expect addr_L, addr_H
  expect count_L, count_H
  expect data
  ...jump to addr
```

Bootloader relocates itself from EEPROM to RAM at 0xff00 and jumps there.  Load utility [hex_binary.c](http://edf.bu.edu/svn/edf/EricHome/HPCalcSim/software/sio/hex_binary.c) written which loads an Intel hex file and jumps to the start address.

Ported/updated monitor [umon2](http://edf.bu.edu/svn/edf/EricHome/HPCalcSim/software/umon2/) which supports commands:
```
 d <addr> <count>         dump memory
 e <addr> <dd> <dd>...    edit up to 16 bytes in memory
 p ...		          dump argc / argv for debug
 g <addr>                 goto addr
 b 		          binary load
```

Works fine but slow-ish.  Takes ~30s to load umon2 which is about 1k which is somehow about 300 baud equivalent.

*2020-03-15*

Struggling to debug the bit-bang serial.  7-bit counter output works.  Single string works ok-ish.  Multiple strings result in flash overwrite?

Going to cut nWE on the flash and tie high for now.

Flash seems to be getting flaky, takes multiple tries to program some bytes.  Possibly a previous crash resulted in stack overwrite, wear-out?  Added "Fix" option to programmer, trying to continue.

*2020-03-14*

Hunkered down on Coronavirus watch!  Built a simple Arduino programmer thingy and write/read monitor.  Programmed "Halt"... should delay ~500ms then halt.

```
   4:    0+10   0000  210000            ld      hl,0
   5:     -     0003            inner:
   6:   10+6    0003  2B                dec     hl
   7:   16+4    0004  7C                ld      a,h
   8:   20+4    0005  B5                or      l
   9:   24+7+5  0006  20FB              jr      nz,inner
  10:   31+4    0008  76                hlt
  11:
  12:     -     0009                    end
```

*2020-03-10*

PCBs and parts in!  Need a serial bootloader.  Provision for bit-bang serial provided on CPU.



Drafted ([bootloader.asm](http://edf.bu.edu/svn/edf/EricHome/HPCalcSim/software/bootloader.asm)) a loader which in principle acquires the baud rate using Jack Ganssle's [article](http://www.ganssle.com/articles/auart.htm) with bit-bang z80 serial code.  Current version uses LED for feedback (no serial output code).  Fits, barely! (0F6H bytes)

*2020-02-25*

!Display/Keyboard PCB ordered from JLCPCB with 2-3 day shipping.  2-3 day build time with "possible delay" due to Corona virus.

*2020-02-24*

Display/keyboard PCB just about done.  Interface:

 * 8 bits data (250ns write cycle)
 * 1 bit mode/address (latched or address)
 * 2 write strobes (one per chip)
 * 5 keyboard column outputs
 * 7 keyboard row inputs

LED data and keyboard outputs could be latched together.  If so, that would mean:

 * 8 bits output
 * 7 bits input
 * 2 decoded write strobes

Minimal CPU for this project:

 * 20 MHz Z80
 * Serial port of some sort (maybe bit-banged per [this article](http://www.ganssle.com/articles/auart.htm), [local](http://ohm.bu.edu/~hazen/HPCalc/bit_bang_serial_z80.pdf))
 * 16k EEPROM (could be slow w/wait states)
 * 32k RAM (should be fast)
 * Maybe a timer interrupt in the 1-10kHz range
 * The ports above

*2020-02-21*

Calc more or less working with semi-functional memory store/load.

Start working on `umon2` monitor in assembly as framework for assembly port of calc.

Switched to http://48k.ca/zmac.html assembler after various issues with the ones in z80pack and z88dk.  So far so good.

`umon2` now has a semi-working argc/argv parser with hex convert.  First version of memory dump ok (one line).

*2020-02-16*

Some serious bugs in Z80 version (`NP25-Z80`).  Program memory gets corrupted when a program is run.  The `NP25-hack` version is fine.  Need to patch up Z80 so it can be built under gcc for comparison.

Can build using `Makefile.unix` for unix testing.  Also added `ONLY_REG_T` option which undoes the `creg_t` hack and uses only full-size registers and RAM.

*2020-02-15*

Assemble and run in z80pack:

```
  $ z80asm -b test1.asm
  $ srec_cat test1.bin -binary -o test1.hex -intel
  $ z80sim
   ...
  >>> r test1.hex
  >>> g 0
```

C code using the emulator built-in port 01 console works!

```
#include <z80.h>

char my_getc()
{
  char a;
  a = z80_inp( 1);
  return a;
}

void my_putc( char a)
{
  z80_outp( 1, a);
}

void my_puts( char *s)
{
  while( *s)
    my_putc( *s++);
}

int main() {
  while( 1) {
    my_puts( "hello!\r\n");
    z80_delay_ms( 1000);
  }
}
```

Build and run

```
  $ zcc +z80 -vn -O3 -startup=0 -clib=new hello.c -o hello -lm -create-app
  $ srec_cat hello.bin -binary -o hello.hex -intel
  $ z80 -m 0 -f 4 -x hello.hex
```

Next step- fix the console so it has status bits, then start trying to build the NP-25.

So, it works!  Problem is, have to run the simulator at about 24MHz to get realistic speed.
Sigh... maybe it has to be re-written in assembly?

There exists a 20MHz Z80 in a DIP!  Z84C0020PEG.  Need to look at EEPROM / memory speeds.

Lots of fast RAM.  EEPROM slower, may need wait states and load to RAM.

*2020-02-14*

Rev 3306 is working.  Changed creg_t back to reg_t.

Installing z88dk in work from source.  Also build z80pack simulator in src/z80pack-1.36

See z88dk docs:  https://www.z88dk.org/wiki/doku.php?id=libnew:target_embedded

*2020-02-08*

Add Z80 branch:  http://edf.bu.edu/svn/edf/EricHome/HPCalcSim/NP25-Z80

Compiles and runs using simple Makefile still under Linux.  Starting to strip the code down to bare essentials.

*2018-12-20*

Download NP-25.  This is a hack which uses the core simulator engine from nonpareil
to run 21/25/33c/34c ROMs on an MSP430 with LEDs and buttons attached.
Looks pretty cool and if it weren't for the unfamiliar MSP430 arch
and the unposted PCB layout might be interesting to try as-is.

Get the raw simulator running with terminal I/O only, and then port
to a more familiar uC on different hardware.

 * SVN: http://edf.bu.edu/svn/edf/EricHome/HPCalcSim/NP25-hack/

As of today (12/20/2018) the np25_hack_standalone compiles and runs
taking keyboard input from the console using ncurses and has some
sort of working display.  Keyboard mapping is as follows:

```
        0-9 = 0-9
       +-/* = +-/*
        CR  = R/S
        SPC = ENTER
        a   = SST
        c   = CLX
        d   = GTO
        e   = STO
        f   = f
        g   = g
        q   = X.Y
        r   = RCL
        s   = BST
        t   = E+
        w   = RDN
        x   = EEX
        z   = CHS
```

Runs super fast.  Added a `usleep(300)` since I read somewhere the original HP-25 ran the CPU about 3kHz.  Pretty good now, within 20% of my real HP-25.  TODO:  figure out program saving/loading.

See: http://edf.bu.edu/svn/edf/EricHome/HPCalcSim/NP25-hack/README-hack.txt for some details on the software.
