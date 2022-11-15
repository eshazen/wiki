# LaserTecV2ECOs
Up to [Laser_PC_Board_Designs](Laser_PC_Board_Designs.md)

Assembly changes:

 * Remove R5, R6
 * R105, R118, R131, R144 - change from 10.0k to 35k (+/-10% ok)
 * Install wire jumpers from pins 2-3 of JP2-JP9 (8 places).
 * Install wire jumper across JP1

Proposed PCB ECOs:

 * Add test point for current limit set (R47 etc).
 * (Add photodiode readout)
 * Add hardware "laser on" indication
 * Add low-pass filter on temp sensor inputs

Notes:

Resistor values R105,107,108 set temperature window.  Default values won''t work.
Details depend on thermistor but a good start would be to change them as follows
for a modest range around 25 deg C:

Pot R47 sets current limit for laser shutdown.

Laser won''t turn on unless the following are true:

```
  I_SHUTDOWN - backplane INTERLOCK must be at 0V (needs connector or resistor if no system controller)
  EN0/1/2/3 - must be logic ''1' from backplane (pull-down 10k on Laser/TEC)
  L_SHDN - uC output PD7 must be ''0'

```

