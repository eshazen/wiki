# LaserRev2Commissioning
Up to [Laser_PC_Board_Designs](Laser_PC_Board_Designs.md)

## Board Status


|*'Board* |*Status* |*Notes* |
|-------- |-------- |------- |
| 1 | OK? |U23 spare found on bench and installed  |
| 2 | Brick |Need top UC replaced (fuses botched) |
| 3 | OK |All laser drivers tested OK |
| 4 | OK |All laser drivers tested OK |

## Initial Checkout

 * Take care of Laser/TEC board ECOs:  [LaserTecV2ECOs](LaserTecV2ECOs.md)
 * Provide safe dummy loads for laser and TEC (25 ohms @ 1W resistor) on J6,J7,J8,J9 and J11,J14,J17,J20
 * Connect thermistors or 10k resistors to J12,J15,J18,J21 two each, pin 1 common.
 * Install jumper JP1 if there is only one 5V supply.
 * Install jumpers in pins 2-3 of JP2-JP9 (8 places) to use only one LASER power supply on LPWRB
 * Remove R5 and R6 to isolate I2C bus from backplane
 * Connect fans if desired to J10/J13/J16/J19 (pin 1-12V pin2-sense pin3-GND)

## Hardware TODO

 * Disconnect pins 6, 8 of J9 on backplane (remove global enable and inhibit connections).
Inhibit (pin 8) to GND shuts down supply.

## Firmware TODO

 * SC/LTC: Zero DAC on laser disable, restore on enable [partial](partial.md)
 * SC:  Keep array of DAC settings
 * SC:  Implement auto-scan of laser status [done](done.md)
 * SC:  Implement status LEDs [partial](partial.md)
 * SC/LTC: temperature setpoint in EEPROM [done](done.md)
 * SC/LTC: Firmware version somewhere [done](done.md)

not yet complete:

 * SC:  Implement boot loader for firmware updates
 * SC/LTC:  Improve LED display operation

## Test Log

*'2013-10-29, hazen*

EFUSE setting missing from SysCtrl Makefile.  Had to fix WLS_CTRL missing symbol in sysctrl.h.
Programmed 2nd System Controller board.

Laser/TEC board 2 seems good now.  Program with current firmware/fuses.


*'2013-04-01, hazen*

Look at temperature sensor with scope (J12-2 with J11-1 as GND).  See lots of narrow multi-volt transients.
Running with fans 0,1 turned off to hopefully get some baseline on the error rate.  (File ~/Rev2/test5.txt).
Things heat up quickly:

```
 >l
 0 OK ON I=1220mA T=33.5C H=59.6C Q=48.0C DT=35 TEC=-140*
 1 OK ON I=1220mA T=32.7C H=55.3C Q=47.9C DT=27 TEC=-108
 2 ERR OFF I=0mA T=33.9C H=51.3C Q=43.9C DT=39 TEC=-156*
 3 OK ON I=1225mA T=32.0C H=44.5C Q=42.1C DT=18 TEC=-72
 4 OK ON I=2255mA T=34.3C H=54.9C Q=52.8C DT=43 TEC=-172*
 5 OK ON I=2255mA T=34.4C H=53.9C Q=52.5C DT=44 TEC=-176*
 6 OK ON I=2255mA T=33.0C H=56.8C Q=50.1C DT=29 TEC=-116
 7 OK ON I=2255mA T=32.9C H=47.2C Q=45.5C DT=28 TEC=-112
 8 ERR OFF LT1 I=0mA T=30.8C H=33.2C Q=0.0C DT=0 TEC=0
 9 ERR OFF I=0mA T=22.4C H=32.3C Q=38.1C DT=0 TEC=0
 10 OK OFF I=0mA T=28.7C H=30.3C Q=35.9C DT=0 TEC=0
 11 OK OFF I=0mA T=28.5C H=29.8C Q=33.5C DT=0 TEC=0
 12 NC 0
 13 NC 0
 14 NC 0
 15 NC 0

```
```
 >h 0 11
 0:  0x0100 0x0100 0x0100 0x0100
 1:  0x0000 0x0000 0x0000 0x0000
 2:  0x0002 0x0002 0x0002 0x0002
 3:  0x0000 0x0000 0x0000 0x0000
 4:  0x0002 0x0002 0x0000 0x0000
 5:  0x0002 0x0002 0x0002 0x0002
 6:  0x0000 0x0000 0x0000 0x0000
 7:  0x0000 0x0000 0x0000 0x0000
 8:  0x0001 0x0001 0x0001 0x0001
 9:  0x0002 0x0002 0x0000 0x0000
 10:  0x0000 0x0000 0x0000 0x0000
 11:  0x0000 0x0000 0x0000 0x0000

```
Lots of 0002 values.  Should add a filter on the temp sensor input.

*'Add 2.2uF* in parallel with R103, R104 etc on all four channels of the first board.
Modify laser_test.c to turn fans on if any hot or Q temp is above 50 deg C.
Let run for a while and keep an eye on it.

*'N.B. someone changed the laser set points to 30 deg C*.


*'2013-03-29, hazen*

*'Summary:*  Saw one spurious TEMP_FAIL trip.  Possibly due to noise on the thermistor input (not filtered, doh!)
Firmware updates completed and put in svn.

Claim from BIDMC is that with channels 0-7 on the box exhibits non-understood failure modes.
Documentation [here](http://ohm.bu.edu/~hazen/Frangioni_Public/Laser/TestLogFiles/3-20-2013_Test_summary.doc)
[here](http://ohm.bu.edu/~hazen/Frangioni_Public/Laser/TestLogFiles/3-20-2013_Laser_Stability_Summary.ppt)

Run overnight with channels 0-3 set to 1200mA and 4-7 set to 2200mA.  Output at 9am:

```
 0 OK ON I=1225mA T=31.6C H=43.8C Q=34.9C DT=16 TEC=-64
 1 OK ON I=1220mA T=30.9C H=37.5C Q=34.1C DT=10 TEC=-40
 2 OK ON I=1220mA T=31.9C H=39.3C Q=33.9C DT=19 TEC=-76
 3 OK ON I=1230mA T=30.7C H=33.9C Q=32.9C DT=7 TEC=-28
 4 OK ON I=2255mA T=31.6C H=38.9C Q=39.8C DT=16 TEC=-64
 5 OK ON I=2255mA T=31.3C H=36.1C Q=38.2C DT=13 TEC=-52
 6 OK ON I=2255mA T=31.4C H=39.0C Q=35.7C DT=14 TEC=-56
 7 OK ON I=2260mA T=31.6C H=31.4C Q=31.9C DT=14 TEC=-56
 8 OK OFF I=0mA T=24.7C H=25.3C Q=0.0C DT=0 TEC=0
 9 OK OFF I=0mA T=23.9C H=24.8C Q=24.9C DT=0 TEC=0
 10 OK OFF I=0mA T=23.8C H=24.2C Q=24.4C DT=0 TEC=0
 11 OK OFF I=0mA T=23.0C H=23.4C Q=24.2C DT=0 TEC=0

```
Hmm.

*'Firmware:*  tarball Firmware directory on volta as Firmware_2013-03-29.tar.gz.
rsync from ohm and rebuild.  Seems OK.  Put into svn at:
*'https://edf.bu.edu/svn/edf/LaserBox*.

Add command ''F' to control fans.  Add command 'A' to read ADCs on system controller.
Add command ''T' to read ADC and convert to deg C.

*'2012-10-05, hazen*

Final things... fix LTC front-panel LED to correctly indicate laser "on".
Add temperature setpoint to EEPROM and set to 19 degrees by default.

*'2012-10-04, hazen*

Trying to get timer interrupts working sensibly on SC.  Check fuses:

```
  LFUSE = E1   Clock = 1MHz internal osc
  HFUSE = DE   JTAG disabled, BOOTSZ = 11  BOOTRST=0
  EFUSE = FF   (ATMega103 compatibility OFF)

```
Problem was software... it works now.  Implement laser scan at power up
and status auto-scan for front panel LED.

*'Laser/TEC:*

Proposed changes:
 * HFUSE bit 3 -> 0  (EEPROM preserved on chip erase)
Change this on the LTC.

*'2012-10-03, hazen*

Much firmware work

*'2012-10-01, hazen*

Testing channels 1-3 on board#1.
Change R118, R131, R144 to 36k.  Replace U19.  Install jumpers JP4-9 pins 2-3.
Make test gizmo with 10k resistor to substitute for laser thermistor to
bypass OVER_TEMP logic.

Power up.  Channels 2, 3 still behave badly.  Seems as if U23 and U29 are dead.
Replace U29.  No more spare parts for U23 :(

Oops.  DAC channel addresses are backwards.  Laser 0 is channel 3 etc.

Test *'board#2*.  Perform assembly ECOs.  All laser drivers now work OK.
Blue LEDs don''t work.

Work on PSU control for laser power.  Open up PSU, remove laser module,
change position of "Inhibit" switch.  Now it is normally off.
Add "P" command to system controller.  "P 1 1" turns on the laser PSU, "P 1 0"
turns it off.  "P 0 x" should control WLS PSU but it doesn''t work.

*'Blew it!*  Bricked channel 0 (and therefore the whole board) on
board#2 by programming the fuses incorrectly in the uC.  Set this board
aside.  Have to replace the uC to fix it :( :(

Board 3 commissioned and working (TECs not yet tested).
Firmware fixes:  ADC glitching cured.  Full status command ''L' implemented
in LTC and SC firmware.

*'2012-09-28, hazen*

Change R105 to 35k to fix over-temp range.  Laser turns on.
No indication of light output, but temp goes up a bit.

Running laser 1.  Fan on.  Current = 1.5A.  PWM = -64.
Temp very slowly falling at 20 deg C.

Current scaling 0.5V = 1A.
DAC is 0x000-0xFFF for 0-2.5V.

```
  0200 = 0.03V = 0.62A
  0400 = 0.62V = 1.25A
  0600 = 0.96V = 1.87A
  0800 = 1.25V = 2.50A

```
Test P-only temp regulation loop in software.  Works ~ ok.

*'2012-09-27, hazen*

```
 LT ATMega164A 16kB flash = 8k words = 0x2000  now 0x0e32
 SC ATMega64 64kB flash  = 32k words = 0x8000  now 0x1463

```
Draft [FlareLaserControlSpec](FlareLaserControlSpec.md)

Add PWM code from old firmware.  Works!  Command ''P' takes 16-bit value, +/-128.
Freq is fixed at 8kHz.

 * Positive values 0-127 give duty cycle 0-100% on PWM-.  PWM+ is L.  This HEATS the laser.
 * Negative values -1...-128 give duty cycle 0-100% on PWM+.  PWM- is L.  This COOLS the laser.

Values outside above range give 100% duty cycle.

Connect a laser assembly.  Reasonable things happen when I play with the PWM settings.

Experimenting to determine time constant of TEC assembly response.
Create new C program "laser_test" with a command to read pairs (pwm,seconds)
and log the hot / cold / Q temperature readings at 1Hz to a file.

The time constant for response to a step change in heat/cooling is something like 2 minutes.
So, a PID which updates at 1Hz or so should be plenty fast.
For testing/simulation, the PID for one channel can be run on the host computer at this rate.

Run a test under the following conditions:

 * no fan
 * TEC PS set to 3.2V
 * Set PWM to -16 for 4 minutes, then to 0 for 4 minutes

See [PDF plot](http://ohm.bu.edu/~hazen/Frangioni_Public/Laser/TestLogFiles/test1.pdf)

Working on laser.  Can''t turn it on because temp is out of range (stat = 0xd).  This is because the resistors are wrong.

*'2012-09-26, hazen*

Write laser enable code, add "E" command to SysCtrl.
Modify Laser/TEC code to deassert LC_SHDN.

Now the laser driver works!  Current is controlled linearly by the DAC.

*'2012-09-25, hazen*

Back from TWEPP.  Wire bench supply to Laser/TEC board and judiciously apply 3V with
dummy load connected to 2nd channel.  AOK, nothing hot, no current.  But, there is no
Analog -5V.

Disconnect laser and tec supplies in crate from backplane and power up.
Observe that LPWR is being pulled down to -4V even though it is disconnected from the supply.
This is consistent with current flowing through the C-E junction of Q6.

Look at channels 2, 3 which have never had laser power applied.  Same effect... I/O pins
of OPA365 are at -4.5V or so.

Remove OPA365 on channel 0 (U14).  Replace with new one, but cut output trace to Q6.
Output can draw no DC current now.  Attach bench supplies to -5V and +5V and power up carefully.
All as expected... all op-amp pins are at ~ GND.

Reconnect OPA635 output. Connect LPWR to -5V supply.  Attach dummy load and power up slowly.
AOK, no current, all laser-related voltages near zero.

Reinstall in crate with external laser supply.  AOK.  Now the challenge is to get all
the interlocks dealt with so the laser turns on...

Check inputs of U12:

```
  1 (I_SHUTDOWN) = 1  now 0
  2 (nENABLE)    = 1  now 0 under SysCtrl E command
  8 (UC_SHDN)    = 1
  3 (TEMP_FAIL)  = 1  now 0
  4 (OVER_CURR)  = 0

```
Sigh. Start with TEMP_FAIL.  No sensor, so need to short 1-2 on J12.  OK now.

I_SHUTDOWN comes from backplane INTERLOCK.  Off to the system controller.  Eeek!  This is an OR of many many things:

```
  /FAN_FAIL         0     via backplane PS control J9 - 5    OK
  TEMP_ALARM_IN     1     via backplane PS control J9 - 7    can drive L with uC
  AC_FAIL_IN        1     via backplane PS control J9 - 4    can drive L with uC
  LASER_SHUTDOWN   float  from SysCtrl uC                    drive L with uC
  INTERLOCK_SW_NC   1     J2 pin 8 (front panel)             Tied to GND
  /INTERLOCK_SW_NO  0

```

*'2012-09-13, hazen*

Power ''B' jumpered on LTB board 1 top channel.

Now working:
 * Bidirectional MODBUS communications (with some ugly 5ms delays)
 * ADCs on LTC
 * Remote reset

Laser drive circuit doesn''t work.  U14 gets hot, and inputs sit at -4V.
Cut trace to U14-3 and the R45/R48 node goes to expected V, U14-3 stays at -4V.

Jumper power on 2nd channel and repeat test -- same results :(

Double-check:
 * package markings on U14, U16 (both SOT-23).
 * orientation of U14
 * pinout of Q6

All seems OK.  One possible concern is the power-up sequence.
If the Laser power comes on before the +/-5V power, large currents
may flow through into the output pin of U14 protection circuits.

*'There should probably be a series resistor on U14 output*.


*'2012-09-11, hazen*

Give up on bootloader for now, on with hardware testing.  Current non-working version at ohm:Proj/Frangioni/LaserDriver/Firmware and ../Software/Rev2.

Need to get ModBus working.

*'2012-09-08, hazen*

Next step is bootloaders.  Here are some candidates:

 * [SSBL](http://www.hhhh.org/wiml/proj/avr/ssbl.html)
 * [KAVR](http://kavr.sourceforge.net/)

For the SC a more elaborate version (can be in C) is needed to provide remote
loading of the LT boards.

*'2012-09-07, hazen*

Working on *'System Controller*

*'Remove R5, R6 on Laser/TEC board to isolate I2C busses*.

Both SC and LT boards installed, with ribbon cable unplugged power comes on
as expected.  Make minimal firmware for SC which initializes 2nd uart at 2400 baud.
Make receiver for LT which displays digit LSB on LED... works!

*'2012-09-06, hazen*

Working on system controller.  Make blinky light thing using front-panel LED outputs (DB-9).
In order to make port G work, have to turn off ATmega103 compatibility.  Turn off JTAG for
good measure too.

```
  FUSES:  L = 0xe1  (unchanged)
          H = 0xd9  (was 0x99)
          E = 0xff  (was 0xfd)

```
Now blinky lights on DB-9 work!

*'2012-09-05, hazen*

Looking at [ATmega64A datasheet](http://ohm.bu.edu/~hazen/DataSheets/Atmel/doc8160.pdf)

Even though the SPI Programming interface re-uses the SPI I/O module, there is one important
difference: The MOSI/MISO pins that are mapped to PB2 and PB3 in the SPI I/O module are not
used in the Programming interface. Instead, PE0 and PE1 are used for data in SPI Programming mode as shown in Table 27-13.

So, the programming interface is mis-wired.  Unfortunately PE0 and PE1 are shared with UART#1,
but there are 1k series resistors.  Here is a proposed set of ECOs to fix this, along with RESET issue:

 * R8 - install 100 ohms.
 * R1 - install 10k
 * R7 - remove
 * Jumper J10-1 to J1-4
 * Jumper J10-3 to J1-1

With correctly installed fixes as above, it works (avrdude can read the chip ID).

Meanwhile, found [this thread](http://www.linuxquestions.org/questions/programming-9/serial-ioctl-221632/)
code which controls the DTR line, which we will need to operate the

*'2012-09-04, hazen*

Initial checkout of Laser/TEC board.  Install latest avr-libc and gcc-avr for Ubutuntu 10.04.

*'Add m164 support to avrdude*.  Copy /etc/avrdude.conf to ~/.avrduderc.  Copy "m128p" section
as "m128" and change signature bytes.

Now this incantation works:

```
  sudo avrdude -p m164 -P usb -c avrispmkII -U flash:w:main.hex

```
Create a blinky light program; doesn''t work.  Maybe the fuses?
Currently the fuses are:  L: 0x62  H: 0x99.  Check data sheet, seems fine.

*'Must disable JTAG*.  Set JTAGEN fuse = 1 (hfuse=0xd9):

```
  sudo avrdude -p m164 -P usb -c avrispmkII -t
  avrdude> w hfuse 0 0xd9
  avrdude> q

```
Now the blinky lights work fine!

Create DAC code from twitest.c on avr-libc page.  Works!
DAC ramps from 0..2.5V.

*'Initial System Controller Checkout*

Apply +12V to pins 30, 32 of VME.  5V is OK (need heatsink connection on VRs).
Install jumper J9 to power USB/serial thingy.

USB device enumerates correctly as (4) /dev/ttyUSBx devices.
Avrdude can''t talk to the uC though:

```
 hazen@EDF-PC-1:~/AVR/SysCtrl$ sudo avrdude -p m64 -P usb -c avrispmkII

```
```
 avrdude: stk500v2_command(): command failed
 avrdude: stk500v2_command(): unknown status 0xc9
 avrdude: stk500v2_program_enable(): cannot get connection status
 avrdude: initialization failed, rc=-1
          Double check connections and try again, or use -F to override
          this check.

```
Investigate tomorrow.


*'2012-08-31, hazen*

Order the following for test setup:

 * Test board to substitute for system controller for initial checkout.  This board provides header access to power supply, communications and WLS signals to allow checkout of the crate/backplane/PSU without commissioning the new system controller
   * Layout:  [PCB](http://ohm.bu.edu/~hazen/Frangioni_Public/Laser/ControlTest/ControlTest.pcb) [PDF](http://ohm.bu.edu/~hazen/Frangioni_Public/Laser/ControlTest/ControlTest_pcb.pdf)
   * Schematic: [SCH](http://ohm.bu.edu/~hazen/Frangioni_Public/Laser/ControlTest/ControlTest.sch) [PDF](http://ohm.bu.edu/~hazen/Frangioni_Public/Laser/ControlTest/ControlTest_sch.pdf)
 * Digi-Key order 33928003 with various parts for above, including NTC 10K thermistors (Digi-Key BC2301-ND,
   * [Vishay NTCLE100E3103JB0](http://ohm.bu.edu/~hazen/DataSheets/Vishay/ntcle100.pdf)
 * 3x SparkFun FTDI basic USB/serial adapter 5V

NOTE:  Pin 3 of U1 must be lifted and wired to pin 1 of J4.  This will allow the DTR line on the FTDI serial adapter to control the transmit enable U1.

