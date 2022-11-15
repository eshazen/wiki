# IR_Proximity_Sensor
This page describes ideas for an IR proximity sensor.

For a simple proximity sensor, one can drive an IR LED with a modulated
signal which matches the subcarrier frequency of an inexpensive reciever
designed for IR remote control applications.

For example, the Sharp GP1UW70QS (stock at Digi-Key) works at a subcarrier
frequency of 40kHz.  If an LED is driven with an on/off modulated
square wave of this frequency, the same on/off pattern should be output
by the reciever when light is reflected into the receivers photo-detector.

For the proposed application (low-power proximity-controlled LED light)
the best solution would probably be a microcontroller with a wake-up
interrupt which would power the proximity sensor briefly at a rate
of a few Hz, and illuminate the LED lamp when a signal is seen.

### PCB Design

#### Rev 3

Notes:  The IR sensor is obsolete.  Switch to the GP1UW701QS0F (lead free)
which is stocked now but is a 38kHz part.  *'NOTE:  Needs updated firmware*

 * [IR_Sensor_Rev3.sch](http://joule.bu.edu/~hazen/GaitTimer/IR_Sensor_Rev3.sch)

#### Rev 2 PCB

 * [IR_Sensor_Rev2.sch](http://joule.bu.edu/~hazen/IRdet/IR_Sensor_Rev2.sch)

#### Rev 1 PCB

   * [Schematic](http://joule.bu.edu/~hazen/IRdet/ir_sensor_sch.pdf)
   * [Layout](http://joule.bu.edu/~hazen/IRdet/ir_sensor_pcb_legend.pdf)

 * GP1UW70QS IR Detector [Data Sheet](http://joule.bu.edu/~hazen/IRdet/GP1UW70QS.pdf)
   * [Sharp Web Page](http://www.sharpsma.com/part.php?PartID=722)

 * LNA2802L IR LED [Data Sheet](http://joule.bu.edu/~hazen/IRdet/LAN2802L_IR_LED.pdf)
 * ATTiny45 microcontroller [Data Sheet](http://joule.bu.edu/~hazen/IRdet/attiny45.pdf)

