# CellStretcher
# Description

This device is used to controller stretching of heart tissue on a custom-made apparatus. The original device used a variable-speed motor with a timer, and could operate at a fixed speed for a fixed period of time. The new micro-controller based device built in the EDF allows programmable time in the stretched and relaxed positions up to 99 minutes in 0.1 second intervals. A commercial micro-controller module was used. We packaged it in a transparent box for water resistance and durability, and wrote custom control software in C

[image:cellcontroller](image:cellcontroller.md)

The Cell Stretcher Controller manipulates the mechanical movements of the cell stretcher apparatus by controlling the timing of the apparatus''s motor.  To operate the controller the user must input two time interval values.  Each of these values directly correspond to the amount of time that will elapse when the apparatus is in either a relaxed or contracted state.

This design is based on the AVR-MT-128 development board from OLIMEX Ltd. for the ATMEGA128 microcontroller.


[image:timing](image:timing.md)

# Documentation

 * [User Manual](http://ohm.bu.edu/~pbohn/Cell_Stretcher/Documentation/EDF_Cell_Stretcher_Controller_User_Manual.pdf)
 * [All Project Documentation](http://ohm.bu.edu/~pbohn/Cell_Stretcher/Documentation)

