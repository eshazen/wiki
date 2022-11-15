# Assembly_Notes
Back to: [Gait_Measurement_Timer](Gait_Measurement_Timer.md)


*'Misc. Notes*

Plastic Sensor PCB Mounting Spacers: round 4-40 length .345 inches

The schematic for the IR sensor should have the correct labels
for the LEDs.

Push-button switch assignments:

1 = set hours (MOM_SWS pin 1,2)

2 = set minutes (MOM_SWS pin 3,4)

4 = reset (MOM_SWS pin 5,6)


*'Firmware*

The posted software for the IR sensor board may have the wrong
freq for the LED pulsing.  There is some confusion over 38KHz
vs 40KHz depending on which IR receiver is actually installed.
Perhaps it is necessary to test both.


*'Firmware Programming*

A hex file is needed.  *'gait_timer.hex* for the main unit
and *'gait_sensor_38.hex* for the sensor unit.

To program the sensor, ensure power is on pins 1, 2 (5V, GND) of
RJ-45:

```
  sudo avrdude -p t45 -c avrusb500 -e -U flash:w:gait_sensor_38.hex

```
To program the main unit, connect the AC adapter and turn
it on.  Then:

```
  sudo avrdude -p m8 -c avrusb500 -e -U flash:w:gait_timer.hex

```
Also, the AVR fuses must be programmed to select the 4MHz crystal
oscillator option:

```
  sudo avrdude -p m8 -c avrusb500 -t

```
```
  w lfuse 0 0xef
  q

```


