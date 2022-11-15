# MuSun
# WFD Synchronizer

This board synchronizes a fast NIM logic signal with a 100MHz clock.  Here are a few notes
on the circuit design which may be useful for debugging:

Before installing J5 and J6, measure the power supply voltages on the right pin (square hole)
of each.  For J5, the voltage should be -2V.  Adjust this with the pot P1.
For J6, the voltage should be -5.3V.  When these values are correct, solder wire jumpers
in J5 and J6.

Apply a 100MHz clock signal to J1 (1V peak-to-peak is good).  Using an oscilloscope, check that
you see a 100MHz square wave on R3 and R4.

Apply a logic pulse (longer than 10ns) to J2.  You should see the same pulse, synchronized
to the 100MHz clock, coming out of J3.  Note that J3 must be terminated in 50 ohms.
The logic level on J3 may be adjusted a bit using the pot, but don''t set the voltage more
than 500mV above or below -2V on J5.


 * [Synchronizer_SCH.pdf](http://ohm.bu.edu/~hazen/MuSun/Synchronizer_SCH.pdf)
 * [Final_Schematic.sch](http://ohm.bu.edu/~hazen/MuSun/Final_Schematic.sch)
 * [Synchronizer_PCB.pdf](http://ohm.bu.edu/~hazen/MuSun/Synchronizer_PCB.pdf)
 * [Final_Layout.pcb](http://ohm.bu.edu/~hazen/MuSun/Final_Layout.pcb)

## Errors

Q1 has pins the collector and base swapped on the footprint:
 * The trace connecting the pad of Q1 to R25 must be cut.
 * The trace connecting the pad of Q1 to R26 must be cut.
 * Wire the pad of Q1 formerly connected to R25 to R26 (the side closest to Q1)
 * Wire the pad of Q1 formerly connected to R26 to R25 (the side closest to Q1).

