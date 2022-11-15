# PiezoInductorBoards
According to the expert (Thomas Witzel):

```
I would recommend something like the coilcraft 1812 series chokes at 3.3 microHenry.
If you must use different ones, make sure the self-resonance frequency is well above
128 MHz and of course non-magnetic cores. I would choke every single line of the cable.
```

Here's a part number:  Coilcraft 1812CS-332XJLC (sold by Mouser)

The Chokes should be placed every 30 inches or so in the cable run, starting with
one set right at the piezos.

To me this suggests 3 PC board designs:

*Piezo inductor board*

This board will mount on the back of the piezo holder.  It should have
sets of 3 solder pads for the wires from each piezo (5 piezos in case we expand),
sets of 4 inductors for each piezo, and sets of two twisted pair solder points
for each piezo.

Partial schematic:
http://gauss.bu.edu/svn/mri-stimulator/InductorBoard/trunk/piezo_board.sch

*Inline inductor board*

This should provide two sets of 20 solder pads with 20 inductors, staggered
so that a relatively narrow board can be spliced in line in a cable.

*Cable connector board*

This should provide a set of 20 solder pads to terminate the 10-pair cable
and convert to a DB-25 connector.

http://gauss.bu.edu/svn/mri-stimulator/InductorBoard/trunk/inductor_pcb.pcb
