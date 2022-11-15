# APDHighVoltageFirmware
Back to [RoblyerAPDTest](RoblyerAPDTest.md)

## Downloads

 * C source code: [here](http://ohm.bu.edu/~tnadov/hvps/firmware/0.4/)
 * Datasheet for the [ATTINY87](http://ohm.bu.edu/~tnadov/hvps/v2/data/attiny87.pdf)

## Overview

The firmware installed on the HVPS board comprises of a serial command line interface that is used primarily to set the high voltage output of the board. Features include a voltage setting control loop, voltage regulation, and continuous monitoring of output voltage.

## Setup

The serial interface can be accessed by connecting the board to a PC and using a terminal client such as [PuTTY](http://www.chiark.greenend.org.uk/~sgtatham/putty/download.html) or [minicom](http://en.wikipedia.org/wiki/Minicom)

## Usage

When the board first receives power or is reset it will send the message "HVPS X.X" when X is the version number of the firmware. It will then issue a ">" prompt to indicate that the user may type commands. From here, commands are a string of ASCII characters terminated with ''\r'. Each command consists of a series of tokens separated by tabs or spaces. The first token is a command word, which is one or more letters long and may be either upper or lower case. The following tokens will always be numbers which may be either decimal or hex (e.g. 15 or 0xF).

A list of valid commands is given below.

Commands:


| *'Command* |*Action* |*Parameters* |*Working?* |*Function* |
| ---------- |-------- |------------ |---------- |---------- |
| D _value_ |Set DAC |_value_ = 0..4095 | Y | |
| A _channel_ |Read ADC |_chan_ = 0..n | Y |Read raw ADC value 0..1023 (Note 1)|
| L _value_ |Set LEDs |_value_ = 00, 01, 10, or 11 | Y |Write LED bits (1=on) for two LEDs |
| V _voltage_ |Set voltage |_volts_ = 0..500 | Y |Set high voltage desired at 25 dec C (Note 2) |
| C |Read deg C |none | Y |Read temperature in deg C as i.e. "28.3" |
| R |Read voltage |none | Y |Readback voltage as i.e. "253.4" |
| M _voltage_ |Set voltage limit |_volts_ = 0..500 | Y |Set high voltage upper limit (Note 3) |
| P _p i d_ |Set PID parameters |_p_ _i_ _d_ | N |Note 4 |
| E |Enable PID |none | Y |Start PID (turn on high voltage) |
| X |Disable PID |none | Y |Stop PID (turn off high voltage) |
| I |Toggle continuous monitoring |none | Y |Displays an updating output voltage  when D or V command is passed (Note 5) |
| S |Status |none | Y |Display all settings etc in compact format |
| T _value_ |Temperature Regulation |Select ADC | Y |Select which ADC/ADC Receiver to regulate voltage with temperature for. |

Command Notes:







APD Temperature Regulation numbers


| 0 |Temperature Regulation off |
| - |----------- ---------- --- |
| 1 |S6045-05 |
| 2 |S8890-30 |
| 3 |S11519-30 |
| 4 |APD Receiver |

## CLI Notes

 * DAC and voltage setpoint are both forced to zero on startup.
 * The maximum voltage limit can be bypassed by setting the DAC directly
 * The control loop must be off in order to set the DAC, otherwise the voltage will revert to the setpoint
 * The HV OUT LED should not be altered when the high voltage is on for obvious reasons.
 * While the backspace key works in PuTTY, the arrow keys do not.

## Firmware notes

 * Temperature curves for APD are stored in eeprom

## Voltage Setting Calibration

This [Python script](http://ohm.bu.edu/~tnadov/hvps/test/rv.py)
Two sets of data were generated, one for a [sweep up from 0V to 500V](http://ohm.bu.edu/~tnadov/HVPS_board/0.1/HVPS_firmware/tests/voltsweepup.xlsx) and one [from 500V to 0V](http://ohm.bu.edu/~tnadov/HVPS_board/0.1/HVPS_firmware/tests/voltsweepdown.xlsx)


## Recipes for Normal Operations

```
  V 150               sets voltage to 150V (not enabled until next command)
  E                   turn on voltage
  R                   read back voltage
  X                   turn off voltage
  M 250               set maximum voltage limit (error if attempt to set above this)
  C                   read temperature in Deg C
  I                   enable continuous voltage monitoring (not implemented until E or V is pressed)
  E                   turn the voltage back on with continuous monitoring
  Q                   turn off continuous monitoring and return to the command prompt
  T 2                 Set the voltage to regulate with temperature based on the temperature curve for the S8890-30

```
