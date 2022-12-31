# Scope Clocks

This is a silly project to develop a CRT clock using mostly vacuum tubes for the analog circuitry.  See [ScopeClockNotes](ScopeClockNotes.md) for other's projects.  
See [ScopeClockBuildLog](ScopeClockBuildLog.md) for blow-by-blow build information.

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
* [PCB layout (png)](https://github.com/eshazen/scope-clock/blob/main/hardware/deflection_amp/deflection_amp_pcb.png)
* [PCB layout 3D (png)](https://github.com/eshazen/scope-clock/blob/main/hardware/deflection_amp/deflection_amp_pcb_3D.png)

## Power Supply

Designed around an Antek AS-1T175 I had around.  (2x115V, 2x175V, 2x6.3V, 100VA).

* [Schematic PDF](https://github.com/eshazen/scope-clock/blob/main/hardware/psu/psu.pdf)

* 8-stage Cockroft-Walton multipler on the 175 (simulated ~1.3kV output with 6V pk-pk ripple).
* Voltage doubler on the other 175 (simulated ~340V).
* 5V and 3.3V on first 6.3V winding
* 2nd 6.3V for CRT filament.

## Display control

* CPU from calculator [git](https://github.com/eshazen/retro-25/tree/master/hardware/cpu/RevA).
* MAX503/530 DAC.  Needs 1 address bit and 8 bit data with strobe.
* UART with FT232 USB interface.  Thinking of IM6402 since it's dead simple.  Needs a 16X clock.
* Buttons and encoders

Z input could be easily implemented via the opto-isolated intensity control input.
