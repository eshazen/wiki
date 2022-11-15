# Stepping_Motor_Design_notes
Back to [Stepping_Motor_Controllers](Stepping_Motor_Controllers.md)

See [drawing](http://joule.bu.edu/~hazen/SteppingMotors/board_outline.pdf)
board outline.  This is the outline for the existing PCB in the power box.

*'Component Notes:*

 * U1 is a Xilinx CPLD.  It comes in a PLC-44 package, which is in ExpressPCB
  as "SMT LCC - 0.050 pitch - 44 pin".
 * X1 is a 14 pin DIP oscillator
 * Q1-Q5 are in TO-220 packages.  Leave room for heatsinks.
 * R11 and R12 are 25W resistors mounted on box.  Put thru-hole pads for wires
  on the PCB.
 * Place bypass caps near each power pin of U1 and X1.
 * J3 and J5 are SIP header strips.  Hole size should be at least .035 in to
  accommodate square posts.
 * J3 and J5 need not be accessible when the box is closed, so location is unimportant.

 * Use reasonably fat traces for the 12V path through the power transistors
  to J2 and to R11 and R12 (about 1A is flowing when the motor is on)
 * U1 requires good grounding and VCC connections.  Suggest a copper pour
  under the chip for VCC, and elsewhere for GND on both sides.
  Route traces with enough space for good GND fill coverage.


