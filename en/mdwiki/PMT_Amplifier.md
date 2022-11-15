# PMT_Amplifier
This page describes a NIM PMT amplifier/fanout module designed by Dan Gastler.
It consists of a motherboard which can house two pre-amp modules.
Each pre-amp has two inputs (which are summed) and three outputs.

There are two amplifier stages, which may be independently configured for gains
of 1, 2, 5, 10 by changing resistors on the PCB.  The output stage has a 50 ohm
series termination resistor, so when driving 50 ohm loads the output gain is
one half the amplifier gain.

The Texas Instruments [THS3201](http://ohm.bu.edu/~hazen/DataSheets/TI/ths3201.pdf)
Page 16 of the datasheet linked above has a table of recommended resistor values
for various gain configurations.


 * NIM Motherboard
   * Schematic: [pdf](http://ohm.bu.edu/~hazen/PMT_Amp/MotherB.pdf) &bull; [sch](http://ohm.bu.edu/~hazen/PMT_Amp/MotherB.sch)
   * ExpressPCB Layout: [MotherB.pcb](http://ohm.bu.edu/~hazen/PMT_Amp/MotherB.pcb)
 * Triple-output amplifier module
   * Schematic: [pdf](http://ohm.bu.edu/~hazen/PMT_Amp/MultiAmp2.pdf) &bull; [sch](http://ohm.bu.edu/~hazen/PMT_Amp/MultiAmp2.sch)
   * ExpressPCB Layout: [MultiAmp2.pcb](http://ohm.bu.edu/~hazen/PMT_Amp/MultiAmp2.pcb)
 * Parts List
   * [OpenOffice Format](http://ohm.bu.edu/~hazen/PMT_Amp/PartsLists.ods) &bull; [PDF](http://ohm.bu.edu/~hazen/PMT_Amp/PartsLists.pdf)


Lee Roberts has ordered 3 units with output gain of 2, 5 and 10.
There are two stages, each with 50 ohm series termination which attenuates the output 2X.
So, to get (2, 5, 10) at the output we propose that the input stage be 4X,
and the output stages be 2, 5, 10.



