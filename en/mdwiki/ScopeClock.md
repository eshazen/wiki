# Scope Clocks

This is a silly project to develop a CRT clock using mostly vacuum tubes for the analog circuitry.  See [ScopeClockNotes](ScopeClockNotes.md) for other's projects.

* Github: https://github.com/eshazen/scope-clock

Starting a project, apparently.  Ordered a 3BP1 3" CRT with P-3 phosphor on eBay.

Started a PCB based on the "Electronixandmore" design but then started looking more seriously at it and decided to scrap it for now.

Read up on the [Anderson monitor](http://www.taswegian.com/NBTV/forum/viewforum.php?f=17) in the NBTA forum and decided to do something similar.

## Reference

* Articles by [Jed Margolin](https://www.jmargolin.com/) on  [X-Y Monitors](https://www.jmargolin.com/xy/xymon.htm) and [Vector Generators](https://www.jmargolin.com/vgens/vgens.htm)

## CRT bias

* [Schematic (pdf)](https://github.com/eshazen/scope-clock/blob/main/hardware/anderson_crt/anderson_crt.pdf)
* [PCB layout (png)](https://github.com/eshazen/scope-clock/blob/main/hardware/anderson_crt/anderson_crt.pcb_layout.png)
* [PCB 3D view (png)](https://github.com/eshazen/scope-clock/blob/main/hardware/anderson_crt/anderson_crt.pcb_3D.png)

## Deflection Amplifier

Also designed an X/Y deflection circuit based on 6SN7 (or 12SN7) tubes.

* [Schematic (pdf)](https://github.com/eshazen/scope-clock/blob/main/hardware/deflection_amp/deflection_amp.pdf)

## Power Supply

Thinking of a voltage multiplier of some sort starting with a reasonable transformer voltage.  Ordered one of the Anteks below.

* [Power Transformer candidate](https://www.antekinc.com/content/AS-05T320.pdf)

Maybe a quadrupler on the 300 or 320V winding and a tripler on the second 115V winding?

## Display control

Vector graphics drive from some sort of CPU.  Maybe a Z80?
