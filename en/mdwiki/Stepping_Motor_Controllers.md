# Stepping_Motor_Controllers
This page documents various stepping motor controllers built in EDF
over the years.


### New Super-K Power Box

This box is designed to be driven by the Hytec 2256 VME module, or any other source
of step/direction pulses

 * [Hytec_Notes](Hytec_Notes.md)
 * Schematic [PDF](http://joule.bu.edu/~hazen/SteppingMotors/step_motor-rev2_sch.pdf)
  [ExpressPCB](http://joule.bu.edu/~hazen/SteppingMotors/step_motor-rev2.sch)
 * [Stepping_Motor_Design_notes](Stepping_Motor_Design_notes.md)
 * Finished Layout 6/30/06
   [ExpressPCB](http://joule.bu.edu/~hazen/SteppingMotors/step_motor-rev2.pcb)
 * [StepMotor_Nov07a.zip](http://joule.bu.edu/~hazen/SteppingMotors/StepMotor2a_Nov07.zip)
  Updated CPLD design which de-energizes motor when not stepping
   * [step_cpld.zip](http://joule.bu.edu/~hazen/SteppingMotors/step_cpld.zip)
 * [SuperK_Box_Rev2](SuperK_Box_Rev2.md)
 * [Project1.zip](http://joule.bu.edu/~hazen/SteppingMotors/Project1.zip)
  project for testing stepping motors from PC parallel port.
  See [Visual_Basic_Stepping_Motor_Notes](Visual_Basic_Stepping_Motor_Notes.md)

### Old Power Box for MACRO/Super-K

This is a Bud box with a 12V power supply, a PCB and 3 connectors (DB15, DB25 and 20 pin header).
It provides power switching electronics for a 5V motor.

 * [PCB Schematic](http://joule.bu.edu/~hazen/stepping_motors/power_box_sch.pdf)
partly-legible original!  Component references may not be 100% correct.
 * [ExpressPCB file](http://joule.bu.edu/~hazen/stepping_motors/power_box.sch)
  (no PCB layout done)

## Commercial Modules

 * [Hytec 2256](http://www.hytec-electronics.co.uk/2256.html)
  step/direction outputs for 4 motors.  No power drive electronics.
  [User Manual](http://joule.bu.edu/~hazen/DataSheets/Hytec/2256_User_Manual_IssueC.PDF)

### El-Batanouny Lab

Three-motor control in rack-mount box.  Uses 3 "power box" boards,
wired to a DB-25 connector on the rear panel.

 * [Documentation](http://joule.bu.edu/~hazen/stepping_motors/elbat_new_box.pdf)
   * Revised 10 Feb 2006

### Control Basics

The Airpac motors we have lots of from a surplus lot are configured like this:

:http://joule.bu.edu/~hazen/SteppingMotors/stepper1.gif

This is the standard step sequence:


| |A|B|C|D|
| |-|-|-|-|
|1|ON|-|-|ON|
|2|ON|-|ON|-|
|3|-|ON|ON|-|
|4|-|ON|-|ON|

### Other Links

 * [Jones on Stepping Motors](http://www.cs.uiowa.edu/~jones/step/index.html)
   * Suggest L298 and LMD18200 chips (Digi-Key has both)

