# MotorDriverBoard
## Design

 * SVN: http://gauss.bu.edu/svn/evolver-system/Hardware/Motor_Board
 * Datasheets:
   * http://gauss.bu.edu/svn/evolver-system/Hardware/Motor_Board
   * DRV8876 H-Bridge ([data](https://www.ti.com/lit/ds/symlink/drv8876.pdf)) *leading candidate*
     * Available in a 5x4.4mm HTSSOP or 3.3mm VQFN package.

[EvolverMotorBoardReviews](EvolverMotorBoardReviews.md) -- PCB review notes for posterity

*Summary* from Brandon:

I want to build an SA board that enables individual bidirectional control of the fluidic pump array. As a secondary objective, I think it would be useful to use the same h bridge circuit to control Peltier elements
(probably small ones due to the limitation in current draw).

 * Ideally, we would use the same TLC5940 chip we used on the PWM boards to expand the control elements such that we can mix and match daisy chaining either the PWM board or this new H-Bridge (HB) Board. Additionally, consistency here would allow us to plug these boards directly into the Aux or Motherboards, without redesign and trivial recoding.

 * Each channel on the eVOLVER Motherboard was designed for ~700 mA, if I remember correctly. I would like the HB board to handle the same amount of current, obviously more is a bonus.

 * I am flexible with the motor driver

After discussion we decided to drop the TEC (Peltier) cooler option for now, unless we can manage to include some appropriate L-C filter components on the board.

## Build / Debug log

Rev 1 boards fabricated in fall 2020.  The outputs of the PWM chip are stuck low, since they are current sink (only) and the H-Bridge inputs have pull-downs.  Chris managed to solder on pull-ups on 8 of the PWM outputs.

<img src="http://ohm.bu.edu/~hazen/eVOLVER/pix/motor-rev1-res-all-rot.jpg">
<img src="http://ohm.bu.edu/~hazen/eVOLVER/pix/motor-rev1-scope.jpg">

*2020-11-19*

Testing both original PWM board and Motor board on an Arduino shield.  5V from the Arduino seems to power the logic OK.  No high voltage (24/48V) for now.

<img src="http://ohm.bu.edu/~hazen/eVOLVER/pix/motor-pwm-shield.jpg">

Wiring:
```
  D13 - GSCLK  (1k series)
  D12 - XLAT   (1k series)
  D11 - SCLK   (1k series)
  D10 - SIN    (1k series)
  D9  - SOUT
```

Wrote a couple of Arduino sketches to test [SVN](http://gauss.bu.edu/svn/evolver-system/Software/MotorBoard/Arduino/).  The shift register length measurement works, but the outputs seem to stay "off".  Checked on both the PWM and Motor boards.  The software is a bit simple-minded, and right now it does the following:

```
  pulse XLAT
  clock in all 1's or 0's 192 or 384 times
  pulse XLAT
  pulse GSCLK 8192 times
```

Maybe GSCLK needs to run continuously?  Try that using *TimerOne* library in sketch PwmTimerClock.  No difference.  Now trying the Arduino Sparkfun_TLC5940 library.
