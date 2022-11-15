# SuperK_Box_Rev2
Notes on possible Rev 2 box/programming

*'Sept 07* &ndash; Box is installed at Superk, but there are some problems:




First item would require time-out to de-energize motor.  With current CPLD and some clever
firmware, it would be possible to generate an appropriate delay (100ms).

Second item- limit switch inputs are currently jumpered to GND with wires soldered
on the PCB.  If one of these wires was re-soldered (either to CPLD or to limit switch input)
then it could work.  Alternatively, the FAULT input is driven low by the CPLD.
It could be connected to the limit switch input through the CPLD.

*'Nov 07* &ndash; Plan to fix above problems.

Shige has fixed problem#1 with a jumper wire.

New firmware ([StepMotor2_Nov07.zip](http://joule.bu.edu/~hazen/SteppingMotors/StepMotor2_Nov07.zip)
should fix problem#1

Plan is for Jen to take a replacement board with new firmware already programmed,
and also a USB programming cable to reprogram the board which is already there.


