# PWMBoard
Up to [eVOLVER](eVOLVER.md)

## Design Files for Review

 * [Schematic](http://ohm.bu.edu/~hazen/BME/eVOLVER/Boards/PWM/eVolver_pwm.pdf) (pdf)
 * [Layout](http://ohm.bu.edu/~hazen/BME/eVOLVER/Boards/PWM/eVolver_pwm_layout.pdf) (pdf)
 * [Gerbers](http://ohm.bu.edu/~hazen/BME/eVOLVER/Boards/PWM/eVolver_pwm_gerbers.pdf) (individual layers, pdf)


## Reference Materials

 * [TVB_V5.pdf](http://ohm.bu.edu/~hazen/BME/eVOLVER/Meetings/2016-06-08/TVB_V5.pdf) -- Schematic of prototype PWM board

## Layout Comments

(you may need to wait for Dan to explain some of these things on Wednesday)

 * Clean up layout around U2.  Traces connecting to pads should not increase the width of the pad, nor enter the space between pads at all
 * Move two vias to the left of U2 since they cut into the 24V plane
 * Reduce the clearance on the GND power area as I have e-mailed about twice now.
 * Fix up silkscreen (all text right side up and not on top of anything else)
 * Reduce soldermask expansion


**To Do List**
 * ~~ Add datasheets to /docs~~
 * ~~ Find a 25 pin connector~~
 * ~~ Create BOM~~


**REV A neccessary changes**
 * Boston University misspelled
 * RS-485 board site .10 in too small, and too close to M3
  1. RS-485 site rotated as a solution
