# RoblyerDOSIRackMountDesignNotes
Up: [RoblyerDOSIRackMount](RoblyerDOSIRackMount.md)  Ref:  [ADS42LB69](http://www.ti.com/lit/ds/symlink/ads42lb69.pdf) data

[RoblyerDOSIRackMountOlderNotes](RoblyerDOSIRackMountOlderNotes.md) for older notes

## Notes

*Clocks:*  Currently clocks run from mezzanine to carrier for ADC e.g. on H4/H5 (CLK0M2C).
This should be OK for the !PicoZed FMC board too.

## GPIO ECO List

 * protection diodes are all backwards
 * Done 2019-07-22

## ADC ECO List

 * Change R25 to 20k
 * Connect `PWR_EN` to `VADJ`
 * Separate gain settings on two PGAs using shift register with reset (74HC595 which has storage register)
   * 1727-3327-1-ND (DHVQFN package)
 * Swap inputs and outputs on U11
 * Either remove PRSNT_M2C signal or connect JTAG TDO-TDI for bypass (jumper?)
   * Only matters for standard FMC carriers, not ours!

 * ECO done 2019-07-22

### DDS ECO List

 * AGND to DGND needs a jumper!  (prototype:  tiny wire between GND of C85 and C88 between the DDS chips)
 * Fix the `PWR_EN` somehow to supply 5V?  Suggest U5/U6/U3/U12 (5V input) all default to 'on' while `PWR_EN` just controls U2 and U4.
 * Serial interface changes:
   * Assign 'SPARE' (LA04_N) as "device select".  Route to one `nCS`, invert to other.  Wire to mux to select MISO output.
     * U8 and U9 (level shifters) have spare channels, can use for `nCS`.
     * U10 (level shifter) also has a spare channel
     * Add 74LVC1G157 (1727-3491-1-ND) MUX and 74LVC1G04 (296-11600-1-ND) powered on VAUX to drive the nCS and read the MOSI
 * Resistor R28 was assembled with a capacitor. It should be a 1.58 kOhm resistor

 * ECO done 2019-07-22

### Carrier ECO List

 * Card detect for SD card not working.  Just ground it.

<img src="http://ohm.bu.edu/~hazen/DOSI/carrier_sd_card_wire.jpg">

 * Crystals on SI chips installed 90 degrees from correct orientation

### DDS Work Log

 * Schematic: [dds-board.pdf](http://gauss.bu.edu/svn/botlab.dosi/hardware/trunk/DDS/dds-board.pdf)
 * DDS data sheet: [ad9910.pdf](http://www.analog.com/media/en/technical-documentation/data-sheets/ad9910.pdf)

*2019-07-23*

Schematic review notes:

*ADC Board*:

 * Ground unused inputs on U11, U12, U13 (done)

*DDS Board*:

 * PDF schematic missing DDS pages (fixed)
 * D2.5V is not used, delete it (done) (othis was copied from old design)


*2019-07-22*

Requested and got refreshed data for all 4 boards from Newgrange.
Added to SVN:  http://gauss.bu.edu/svn/botlab.dosi/hardware/trunk/FromNGD

Believe that Rev A SVN tag is "as built" for current prototypes:
http://gauss.bu.edu/svn/botlab.dosi/hardware/tags/RevA

Made a trunk copy just in case:
http://gauss.bu.edu/svn/botlab.dosi/hardware/branches/EricSavePreRevB

Extensively cleaned up trunk so we mostly just have the new DSN files to edit as Rev B.

 * ASD, DDS, GPIO edits completed (not checked)

*2019-07-18*

Meeting with Darren and Matt.  Decided to go ahead with ECOs as listed above.  Changes- would like separate gain on the two PGAs on the ADC board, so suggest a shift register with a reset signal.  No changes to carrier board.

*2019-07-11*

 * *NOTE:* on DDS schematics, DIFF_x0 and DIFF_x2 are used, DIFF_x1 is omitted
 * There are 8 signals `SPARE[0:7]` currently wired to J9.  They're 2.5V on bank 13.
These could be used to add two additional signals to each DDS (logically, on DIFF_x1)

*2019-05-31*

Both DDS chips output as expected when connected to the DDS1 FMC connector

*2019-04-04*

Carrier board prep for hardware tests.  First, double-check all pinouts and measure voltages.
Create spreadsheet [Carrier_FMC_Pinout.ods](http://gauss.bu.edu/svn/botlab.dosi/Docs/SystemDocs/Carrier_FMC_Pinout.ods) starting from g-2 version and double-check against Carrier and board schematics.



*2019-01-24*

Finally Dan's linux builds using 2015.4 with downgraded ssh library.  Using that for now.
Use MakingBootableCard recipe to make boot-able card and copy files over.   Change switches
on PicoZed per below (SW both to pin 1), with SD card detect ECO applied it boots now.
Ethernet works too.

<img src="http://ohm.bu.edu/~hazen/DOSI/picozed_switches.jpg">

Create new SVN branch:  http://gauss.bu.edu/svn/botlab.dosi-firmware/branches/Carrier_test/

Update XDC and TOP to reflect correct pinout (we hope).  Note that there are only two LEDs.
Nothing done for I2C for clocks or DDS yet.  Try building to see if we can talk to the LEDs.

Next thing is to talk to the Si5340 chips over SPI so we can program the clocks.
Best bet is probably C bit-banging on the zynq.  SeeHere's a web page with some
simple examples:

https://www.maximintegrated.com/en/app-notes/index.mvp/id/4184

Stopping for today.  Build fails with errors captured in `...branches/Carrier_test/build_log.txt`.
There is no simple oscillator on the carrier and thus no obvious way to inject a clock to run the logic.
This would be needed to program the SiLabs things.  I think we'll have to glue down an oscillator
somewhere.


*2019-01-22/23*

Start testing first carrier (number 101).  Solder power wires on.  No jumpers or mezzanines installed.
Apply 12V.  All DC voltages OK on J1.  Draws ~200mA on analog meter.

Buy new PicoZed 7020 overnight from Avnet (where did ours go??).  Plug it in with uSD card from the FMC carrier.  It boots!  Plug in Ethernet and get encouraging messages and blinking lights (but there is not ssh client :( )

Preparing to use Dan's old PetaLinux stuff from last time.  Installing Vivado 2015.4.  Installing petalinux 2015.4
Rename Ethernet using XilinxVivadoUbuntu instructions.  Replace `/bin/sh` link to *dash* with one to *bash*.
Check out code from `http://gauss.bu.edu/svn/botlab.dosi-firmware/trunk/`.  Edit Makefile for Vivado paths and try to build.  Fails eventually with

```
WARNING: No tftp server found - please refer to "PetaLinux SDK Installation Guide" for its impact and solution
INFO: Checking component...
INFO: Generating make files and build linux/device-tree
INFO: Generating make files for the subcomponents of linux/device-tree
INFO: Building linux/device-tree
[INFO ] build system.dtb
[ERROR] Error: /home/hazen/work/botlab.dosi-firmware/trunk/os/zynq_os/subsystems/linux/configs/device-tree/pl_dma.dtsi:1.1-9 Label or path amba_pl not found
[ERROR] make[1]: *** [system.dtb] Error 255
ERROR: Failed to build linux/device-tree
Makefile:239: recipe for target 'os/zynq_os/images/linux/system.dtb' failed
make: *** [os/zynq_os/images/linux/system.dtb] Error 255
```

Trying again with `make clean; make` saving log file for Dan.  Still fails.

```
[INFO ] generate linux/u-boot configuration files
[INFO ] update linux/u-boot source
[INFO ] build linux/u-boot
[ERROR] make[4]: *** [tools/lib/rsa/rsa-sign.o] Error 1
[ERROR] make[3]: *** [tools] Error 2
[ERROR] make[2]: *** [sub-make] Error 2
[ERROR] make[1]: *** [/home/hazen/work/botlab.dosi-firmware/trunk/os/zynq_os/build/linux/u-boot/u-boot-plnx/u-boot] Error 2
ERROR: Failed to build linux/u-boot
make: *** [os/zynq_os/images/linux/u-boot.bin] Error 255
Makefile:267: recipe for target 'os/zynq_os/images/linux/u-boot.bin' failed
```

According to the web it's best to use 16.04.  Sigh.  Installing that under VBox.

Also trying another thing:  `sudo apt install libssl1.0-dev` to downgrade SSL and launch another build.
Worked!  Not too happy about the ssl downgrade so may just move to the VM.

*2018-05-15*

Making a quick attempt at getting something out of the DDS.  Set up for external clock (Jumper removed) with ARB making 25MHz (maybe add a crystal for next time?).  Hack `dds_decoder.cxx` which reads output log from server.  Write output script file with commands for `dds_conf` from the decoder.

It works!  Sine wave output looks slightly jittery but the freq is reasonable.
Using `dsau_client3.py` script, starts at 25MHz and goes up in steps of 1MHz.

*2018-05-08*

Making a [branch](https://ohm.bu.edu/svn/DOSI/branches/DesktopDummy2018)
branch of the server to run on desktop to understand AD9910 register settings.
It seems to work.  Taking a break now until someone can help me with the matlab/python
client code.  Going to check the carrier schematic.

 * https://www.silabs.com/documents/public/reference-manuals/Si5341-40-D-RM.pdf
 * https://www.silabs.com/documents/public/data-sheets/Si5341-40-D-DataSheet.pdf

Carrier checking notes:

 * All Zynq 7020 user banks (13, 34, 35) are HR, and therefore REQUIRE VCCO=2.5V normally (for on-chip termination).
This is the way the carrier is currently wired.

```
  Zynq LVCMOS25 levels:    V(IL) Max=0.7V  V(IH) Min=1.7V.  V(OL)Max 0.4V  V(OH)Min 2.1V
  Si5341 I/O levels (1.8V) V(IL) Max=0.54V V(IH) Min=1.26V  V(OL)   ~0V    V(OH)   ~1.8V
                    (3.3V)           1.0V            2.31V  V(OL)   ~0V    V(OH)   ~3.3V
```

Doesn't look as if we can just use the 1.8V mode of the Si5341 without a level shifter at 2.5V.
What all is on Bank 13?  CKIN, CKOUT (to/from clocks page), SPARE signals to header, SPI signals.
If I read correctly LVDS _outputs_ require the correct 2.5V so there is no option to change.
So I guess we need a level shifter at least on the SDO.

*2018-05-07*

PMOD pins:

```
  PMOD1 <= dds_control.MOSI1;
  PMOD2 <= dds_control.MOSI2;
  PMOD3 <= dds_control.SCLK;
  PMOD4 <= dds_control.MRST;
  PMOD7 <= dds_control.IORESET;
  PMOD8 <= dds_control.IOUPDATE;
  PMOD9 <= MISO;
  PMOD10 <= '1';
```

Probe on SDO output of AD9910 (trace leading to pin 2 of U10).  Looks to be open circuit.  Hmm.

Aha!  IORESET and IOUPDATE were mistakenly assigned to bits 2, 3 of the control reg as duplicates of SCLK and MRST.  Resynthesizing.

To talk to serial interface, first write '2' to CFR1, then issue I/O_UPDATE.  Then it works!

Starting to reverse-engineer the server software to come up with some register settings.  Start with [dsau_client.py](https://ohm.bu.edu/svn/DOSI/trunk/embedded-software/client/dsau_client.py).  There are some commands which are pretty obvious:

```
dsau.send(("wa%u\n" % nsweep).encode()) # send number of sweep
dsau.send(("wb%u\n" % nstep).encode())  # send number of steps
dsau.send(("wc%u\n" % nsample).encode())# send number of samples
dsau.send(("wd%f\n" % dsweep).encode()) # send sweep delay
dsau.send(("we%f\n" % minf).encode())   # send starting freq (only for same sweep)
dsau.send(("wf%u\n" % stepsize).encode()) # send step size
# 1 = same sweep, 2 = independent sweep, 3 = ramp
dsau.send(("wh%u\n" % 1).encode()) # send sweep type
# send independent starting frequencies (only for independent sweep)
dsau.send(("wi%f,%f,%f,%f,%f,%f\n" % (led_start_freqs[0], led_start_freqs[1],
                                      led_start_freqs[2], led_start_freqs[3],
                                      led_start_freqs[4], led_start_freqs[5])).encode())

dsau.send(("wk%u,%u\n" % (ramp_limit_upper, ramp_limit_lower)).encode()) # send ramp limits
dsau.send(("wl%u,%u\n" % (ramp_step_incr, ramp_step_decr)).encode()) # send ramp increments
dsau.send(("wm%u,%u\n" % (ramp_rate_pos, ramp_rate_neg)).encode()) # send ramp step time

# start sweep
dsau.send("s\n".encode())
```

In the server, the a/b/c etc are decoded and put into `DOSI_settings`.  If the command is 's' `DOSI_takeData()` is called, or if the command starts with 'w' `DOSI_configure()` is called.



*2018-05-04*

Synthesized updated firmware.  Working on software.  Since nCS is grounded on the DDS chips and SCK is common, we have to write to registers in parallel on the two chips (though the values can be different).  This suggests a data structure with all the register values and an "update" method which just blasts new values to all of the regs.  Current software is [here](https://ohm.bu.edu/svn/DOSI/trunk/embedded-software/dsau-server/).

Wrote new software to support dds, including *dds_conf* CLI tool.  Read all zeroes from regs, but `MISO` was not wired in the firmware.  Resynthesize with debug pins on PMOD connected also.

*2018-05-03*

Power up, almost 1V difference AGND/DGND!  Solder a jumper across right end of C85/C88 in the middle of the board.  Now all V's are good, current 80mA.

Problem:  PWR_EN must be 5V, which the Zynq can't supply.  Cut the trace next to J3-1 on the top and solder 7k/5k resistor divider to supply PWR_EN from the 12V for now.

The DDS chips' serial interfaces are wired in a daisy-chain.  This looks bad.  Changed the per [ECO doc](http://gauss.bu.edu/svn/botlab.dosi/Docs/DDS_Test/DDS_ECOs.pdf).

 * cut `PWR_EN` trace to make an FMC signal available.
 * cut `SDO2SDI` so the daisy-chain is disconnected
 * wire J3-1 (old `PWR_EN`, FMC `LA04_P`) to `SDI` of 2nd DDS.

This should allow us to talk to both DDS, but only read back the 2nd one.  Probably OK for prototype.

Rearranged firmware SVN.  ADC test is now here: [branches/ADC_test](http://gauss.bu.edu/svn/botlab.dosi-firmware/branches/ADC_test/) and DDS test firmware is now here: [branches/DDS_test](http://gauss.bu.edu/svn/botlab.dosi-firmware/branches/DDS_test/).  Made changes to support DDS serial I/F.

## ADC Work Log

*2018-05-03*

Change to 'SAME_EDGE' ddr mode and expand RAM to 4096 words (set ADDR_BITS = 12 in adc_cap.vhd).  Preparing to test actual ADC data.  Working on software to move ADC data capture to new class `CaptureADC`.

Build at 12:48.  Add memory buffer size as power of 2 at 0x108.  Swap odd/even bits in HDL.

*2018-05-02*

Data looks pretty good, except behaving as if clock is inverted (odd/even bit swap, shifted by one word).  Verify that each bit works using "single pattern" mode.  Aha!  The problem is that the 'SAME_EDGE_PIPELINED' mode in the IDDR messes up the bits.  Switch to 'OPPOSITE_EDGE' mode and resynthesize.  Hmm, or maybe not.  Let's see.

Nope. Fix bit scramble in software for now and the ramp mode looks perfect!  Enough for today.

*2018-05-01*

Preliminary ADC interface built.  See http://gauss.bu.edu/svn/botlab.dosi-firmware/trunk/register_map/register_map.pdf

```
0x104 - input data channel A
0x105 - ADC capture memory address
0x106 - capture control bit 0 - enable Ch A  bit 1 - enable Ch B
```

*2018-04-19*

ADC R/W interface now works, thanks to Chris!

No ADC output clock.  `CLKOUT_P/N` seem to be floating.  Try various things including firing up the board with external power and signal generator clock in.  Clock in to ADC looks fine, just no output.  Try fiddling with registers 0x14 and 0x15.  *Bingo*!  writing a 1 to register 15 turns the clock on.

Status checkpoint:

 * Clock works, but must do the following at power-up on the zynq:
```
  # ./adc_conf x
  # ./adc_conf w 0x15 1
```
 * Can read the clock frequency as follows:
```
  # ./adc_conf c
  200
  200
  200
   ...
```
 * Current firmware is in a tag at http://gauss.bu.edu/svn/botlab.dosi-firmware/tags/2018-04-18/
 * Software is at http://gauss.bu.edu/svn/botlab.dosi/software/Zynq/

This script toggles all outputs at a low rate, looks OK on the scope:

```
root@zynq_os:/work# cat loop2.sh
while( true) do
  ./adc_conf w 0xf 0x11 >/dev/null
  usleep 10
  ./adc_conf w 0xf 0x22 >/dev/null
  usleep 10
done
```

Data capture implemented in trunk but not working.  Tried to route adc_monitor record to multiple blocks but I'm not sure the tools are smart enough to figure out that each signal is driven by only one block.  In any case, this firmware doesn't work at all... e.g. the control register at 0x100 is not read/write for some reason.

Probably this is all until I get back from CERN.



*2018-04-18*

Zynq software repo created at: http://gauss.bu.edu/svn/botlab.dosi/software/Zynq/

Program `adc_ctrl.cxx` can in principle access the ADC serial registers.

JTAG chain broken when ADC card installed.  This is because "PRSNT" is asserted low but
didn't jumper TDI to TDO on the ADC card. *Cut the trace* on the bottom of the FMC carrier
next to R104 on the bottom size, thus disabling the "FMC PRSNT" signal.

Still, the ADC serial I/F doesn't work.  The signals are easy to probe:

<img src="http://ohm.bu.edu/~hazen/DOSI/adc_probe.png">

All look fine except SDOUT is always high.  Look at schematic.  Rats!  _U11_ (level shifter) direction is wrong :(  Chris is cutting the traces so we can probe... now the SDOUT looks ok on the scope, so he is performing surgery.

<img src="http://ohm.bu.edu/~hazen/DOSI/cross-wires.png">

*2018-04-17*

Using perl script [make_adc_init.pl](http://gauss.bu.edu/svn/botlab.dosi/Docs/ADC_Test/make_adc_init.pl) to generate a tool script, able to produce plausible-looking serial data:

<img src="http://ohm.bu.edu/~hazen/DOSI/scope1.jpg">

Building new version with probe pins on PMOD JA and actual connections to FMC connector.


*2018-04-12*

 * `PWR_EN` not driven on ADC board.  Trace accessible on bottom layer.
   * Input V:  TPS54428 1.6V - 18V.  LP3874 2 - 7V.
   * So, can use `VAdj`.

Power up.  Draws around 220mA on 12V.  All voltages OK except 6V is about 5V.
Looking at R24/R25.  It's wrong, programmed for 5V.  To fix, replace R25 with 19.4k (20k is ok).

### 2018-04-05
Prep for ADC board checkout on !PicoZed FMC carrier with !PicoZed 7020.

Created pinout table [pinout_tbl.txt](http://gauss.bu.edu/svn/botlab.dosi/Docs/ADC_Test/pinout_tbl.txt) and constraints file [adc_pins.xdc](http://gauss.bu.edu/svn/botlab.dosi/Docs/ADC_Test/adc_pins.xdc).

Looking at serial interface spec for [ADS42LB69](http://www.ti.com/lit/ds/symlink/ads42lb69.pdf) ADC.  See page 46.
Interface can be conveniently bit-banged.

*Initial Firmware*

Generate a clock on CLKP/CLKN (up to 250 MHz).

Allow tool access to control interface, pins: (GAIN0..5, SDATA, RESET, SEN, SCLK)
and one input (SDOUT).

Sample data DDR on all inputs using CLKOUTP/N.


