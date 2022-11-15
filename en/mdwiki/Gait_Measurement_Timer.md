# Gait_Measurement_Timer
This page describes portable timer system device that is designed to measure the walking speed of a person over a fixed distance (4 meters). It consists of two IR (infra-red) sensor boxes with companion reflectors
and a central timer unit.

*'Final Design:* [Photo Album](http://ohm.bu.edu/~pbohn/GaitTimer/album/)

### Documentation

 * [New User''s Guide](http://ohm.bu.edu/~pbohn/Gait_Measurement_Timer/Documentation/UserGuide/)
 * [OLD User''s Guide](http://joule.bu.edu/~hazen/GaitTimer/UserGuide.pdf)
  [Source](http://joule.bu.edu/~hazen/GaitTimer/UserGuide.zip)
 * Bill of Materials [(pdf)](http://ohm.bu.edu/~pbohn/GaitTimer/BOM_Gait_Timer.pdf) &bull; [(xls)](http://ohm.bu.edu/~pbohn/GaitTimer/BOM_Gait_Timer.xls)
 * Firmware:
   * Timer Unit
     * [GaitTimer1.3.tar.gz](http://ohm.bu.edu/~pbohn/GaitTimer/GaitTimer1.3.tar.gz)
     * [GaitTimer1.2.tar.gz](http://joule.bu.edu/~hazen/GaitTimer/GaitTimer1.2.tar.gz)
   * IR Sensor
     * [gait_sensor_38.tar.gz](http://ohm.bu.edu/~pbohn/GaitTimer/gait_sensor_38.tar.gz)
     * [IR_Sensor_v3.tar.gz](http://joule.bu.edu/~hazen/GaitTimer/IR_Sensor_v3.tar.gz)
  (unknown version)
     * [gait_sensor_38kHz_7Apr2006.zip](http://joule.bu.edu/~hazen/GaitTimer/gait_sensor_38kHz_7Apr2006.zip)
  &bull; 38kHz version tested 5/07


#### Rev 2 System

These documents apply to the second Four systems under construction in June, 2007.
Some small changes were made to correct errors in the PCB layout.  The assembled
PC boards should be interchangeable with the Rev 1 System.

 * Timer PCB [Schematic](http://ohm.bu.edu/~pbohn/GaitTimer/timer_v2_sch.pdf)
  [CAD files](http://ohm.bu.edu/~pbohn/GaitTimer/Timer_expcb_v2.zip)
 * IR Sensor [Schematic](http://ohm.bu.edu/~pbohn/GaitTimer/IR_Sensor_Rev3_sch.pdf)
  [CAD files](http://ohm.bu.edu/~pbohn/GaitTimer/IR_Sensor_expcb_v3.zip)
 * Sensor light shield drawing [(pdf)](http://ohm.bu.edu/~pbohn/GaitTimer/shroud.pdf)
  [(dwg)](http://ohm.bu.edu/~pbohn/GaitTimer/shroud.dwg)
 * Portable Sensor box mechanical drawing [(pdf)](http://ohm.bu.edu/~pbohn/GaitTimer/sensor_enclosure_portable.pdf)
  [(dwg)](http://ohm.bu.edu/~pbohn/GaitTimer/sensor_enclosure_portable.dwg)
 * Non-Portable Sensor box mechanical drawing [(pdf)](http://ohm.bu.edu/~pbohn/GaitTimer/sensor_enclosure_non_port.pdf)
  [(dwg)](http://ohm.bu.edu/~pbohn/GaitTimer/sensor_enclosure_non_port.dwg)
 * Timer box mechanical drawing (cutouts for connectors, pcb mounting holes) [(pdf)](http://ohm.bu.edu/~pbohn/GaitTimer/Cutouts.pdf)
  [(dwg)](http://ohm.bu.edu/~pbohn/GaitTimer/Cutouts.dwg)
 * Timer box lid mechanical drawing (holes for LCD, mounting screws, switches, power LED)  [(pdf)](http://ohm.bu.edu/~pbohn/GaitTimer/panel.pdf)
  [(dwg)](http://ohm.bu.edu/~pbohn/GaitTimer/panel.dwg)
 * K&M Tripod stands for sensors [(view)](http://www.k-m.de/FLUTE-STAND.3+M556e716fb60.0.html)
 * [Assembly_Notes](Assembly_Notes.md)

#### Rev 1 System

These detailed documents apply to the first two systems delivered in January, 2006.

 * Timer PCB [Schematic](http://joule.bu.edu/~hazen/GaitTimer/Gait_sch.pdf)
  [Layout](http://joule.bu.edu/~hazen/GaitTimer/Gait_pcb.pdf)
  [CAD files](http://joule.bu.edu/~hazen/GaitTimer/gait_timer_pcb.zip)
  [ExpressPCB](http://www.expresspcb.com)
 * IR Sensor [Schematic](http://joule.bu.edu/~hazen/GaitTimer/IR_Sensor_Rev2_ECO.pdf)
  [CAD files](http://joule.bu.edu/~hazen/GaitTimer/IR_Sensor_Rev2.zip)
  [Assembly Notes](http://joule.bu.edu/~hazen/GaitTimer/IR_Assembly_notes.pdf)
 * Old Mechanical Drawings [(pdf)](http://ohm.bu.edu/~pbohn/GaitTimer/Gait_Timer_OLD.pdf)


### Design Notes

 * Measure time interval between interruption of two IR light beams
with 1ms resolution
 * Display last two measurements (with time stamps?)
 * Permit measurement of travel in either direction

A sketch of the timer unit front panel is shown below.
The display is a 20 character x 2 line Optrex 51848 high-contrast LCD with
white LED backlight.
The display control and timing functions are performed by an Atmel ATMega8
microcontroller ([Data Sheet](http://www.atmel.com/dyn/resources/prod_documents/doc2486.pdf)
and a Dallas DS1305 real-time clock
([Data Sheet](http://rocky.digikey.com/WebLib/Dallas/Dallas%20Web%20Data/DS1305.pdf)

Power will is supplied by batteries (6xAA size) inside the box, or a
"wall wart" power transformer.

The sensor units are small boxes with an IR emitter/detector pair
and a very small microcontroller to generate and receive the required
pulse train for the sensor.
A cable connects each sensor board to the timer unit.

*'Future Improvements*

When the Timer is first powered on, it should wait for a short period to eliminate the possibility of a sensor being falsely triggered before the initial test is ran.


### Front Panel Sketch

[image:gait_timer_front_panel](image:gait_timer_front_panel.md)

### Parts Options

 * Mouser 546-1455N1601BK [Cat p1334](http://www.mouser.com/catalog/623/1334.pdf)
 * Bud Econobox [Cat p1333](http://www.mouser.com/catalog/623/1333.pdf)
 * Hammond Diecast (small one for sensor) [Cat p1336](http://www.mouser.com/catalog/623/1336.pdf)
 * LMB Drawn Boxes (sensor) [Cat p1342](http://www.mouser.com/catalog/623/1342.pdf)

 * Reflectors [Cat p1305](http://www.mouser.com/catalog/623/1305.pdf)

