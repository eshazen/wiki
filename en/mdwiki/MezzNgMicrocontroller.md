# MezzNgMicrocontroller
Up to AtlasMichiganMezzCard or MezzNgBreakoutBoard

The Mezzanine board contains an Atmel ATMega88 microcontroller (very similar to that used on the Arduino).
It is loaded with firmware (available here: [rev1.2](http://gauss.bu.edu/svn/atmega-family-cli/projects/ATLAS-MichMezzTester/branches/rev1.2/)) which implements a simple command-line interface.  ASD and TDC settings are loaded by default from EEPROM on power-up, and may be reset at any time by typing serial commands through a terminal, or using python code (see [MDT-ASD Configuration](MDT-ASD_Configuration.md)).

The interface is old-fashioned asynchronous serial 9600/N/8/1 on the pins formerly used for TDI and TDO of the ribbon cable.

At power-up, a default configuration for TDC and ASDs is loaded from EEPROM.

*Known Bugs* in v1.2 firmware:

 * The ASD *TOT* (time-over-threshold) bit gets reset occasionally when other parameters are set.  It is suggested to explicitly reset this parameter after changing others.  (this may be a subtle ASD logic bug)

### Command Format

<command> [<argument>...]

Where <command> is a word beginning with a letter (upper/lower case are equivalent) and <argument> are numbers or text strings separated by whitespace.

Numeric arguments are assumed decimal unless they have a prefix "0x" in which case they are hexadecimal.  They are 16 bit integers, so 0xffff (65535) is the largest permitted value.

A prompt character '$' indicates that the interface is ready for a new command.

### LED command

There is an LED on the board which flashes 3 times at power-up if the EEPROM data is loaded successfully,
or 10 times if EEPROM is empty/corrupted.  The LED may also be controlled via a command.

```
  LED 1    turn LED on
  LED 0    turn LED off
```

### ASD command

This command allows setting and display of ASD chip parameters.  By default the command operates on all 3 ASD chips together.
ASD parameters are named as detailed here: [MDT-ASD Configuration](MDT-ASD_Configuration.md).

```
  ASD D                                        display all current settings
  ASD <param>                                  display one parameter on all 3 ASDs
  ASD <param> <value>                          set one parameter on all 3 ASDs
  ASD <param> <asd> <value>                    set one parameter on one ASD (0..2)

  example:  ASD DISC1 100                      set main discriminator threshold to 100
```

### TDC command

This command allows read/write of TDC configuration registers.  Note that the TDC has a total of 14 registers numbered 1 to 14.
Registers 0 and 15 are displayed but not used.  TDC registers are accessed by number only

```
  TDC D                                  display all registers
  TDC W <reg> <value>                    set register (1..14) to value
  TDC R                                  reset TDC

  example:  TDC 3 0x1000                 set register 3 to hex 1000
```


### EEPROM command

Configuration of ASD and TDC can be stored in EEPROM to load at power-up.
If the message "ERR EEPROM" appears it means that the EEPROM contains invalid data,
and must be restored using the "EEPROM W" command.

```
  EEPROM W                write current settings to EEPROM
  EEPROM R                read current settings from EEPROM
```




