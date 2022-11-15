# Mu2eClockSynth

This gizmo accepts a 10 or 20MHz reference clock and provides two sets
of (4) ECL-level differential programmable outputs.  It is powered by an
external 5V supply via a MicroUSB connector.  There are a total of (8)
differential ECL outputs provided on J1-J8.

## !Connectors/Pinouts

### Power Input

Power is provided on J9, a MicroUSB (phone charging) type cable.
NOTE:  This must *not* be connected to a computer because the ground must float; use
only a plug-in phone charger.


| *Pin* | *Function* |
| ----- | ---------- |
| 1 | +5V (isolated) |
| 2 | n/c |
| 3 | n/c |
| 4 | n/c |
| 5 | GND (isolated) |

### Signal Input

The reference frequency should be 10MHz or 20MHz and provided on J10 (BNC).
The input is 50 ohm terminated and AC coupled.  It requires a 1-3V peak-to-peak square or sine wave input with approximately 50% duty cycle.

### Outputs

Outputs are negative ECL, DC coupled, provided on J1-J8.  The pinout should be directly compatible with
any CAEN digitizer clock input.


| *Pin* | *Function* |
| ----- | ---------- |
| 1 | GND |
| 2 | Out+ |
| 3 | Out- |

The output frequency is set according to the table below.


| *JP2/JP4* | *JP1/JP3* | *Mult* | *Out/10MHz* | *Out/20MHz* |
| --------- | --------- | ------ | ----------- | ----------- |
| L | L | 4X | 40MHz | 80MHz |
| L | - | 5.3125X | 53.125MHz | N/A |
| L | H | 5X | 50MHz | N/A |
| - | L | 6.25X | 62.5MHz | N/A |
| - | - | 2X | 20MHz | 40MHz |
| - | J | 3.125X | 31.25MHz | 62.5MHz |
| H | L | 6X | 60MHz | N/A |
| H | - | 3X | 30MHz | 60MHz |
| H | H | 8X | 80MHz | N/A |

Notes:

The jumper set JP1/JP2 controls the outputs J1-J4.  The jumper set JP3/JP4 controls the outputs J5-J8.

"L" or "H" means install a jumper between the middle pin and the upper or lower pin.
"-" means do not install any jumper (or "park" the jumper so it doesn't connect any pins).

Both sets of outputs are fed by the common BNC input

### LEDs

The blue LED (D2) indicates that the 5V USB power is present.  The green LED (D1) indicates
that the 3.3V regulated power derived from the 5V is present.

## PCB Documentation

The PCB layout was done with [ExpressPCB](http://www.expresspcb.com)
 * Schematic:  [SCH](http://ohm.bu.edu/~hazen/mu2e/ClockSynth/synth_v1.sch) [PDF](http://ohm.bu.edu/~hazen/mu2e/ClockSynth/synth_v1_pcb.pdf)
 * PCB Layout: [PCB](http://ohm.bu.edu/~hazen/mu2e/ClockSynth/synth_v1.pcb) [PDF](http://ohm.bu.edu/~hazen/mu2e/ClockSynth/synth_v1_pcb.pdf)

### PCB Errors

 * Resistors R1-R16 should be connected to -3.3V, not GND (Doh!).  Omitted them and installed thru-hole ones on the back wired to 3.3V on the as-built boards.
 * USB connector shield can't be grounded on the board otherwise 3.3V is shorted to GND and the regulator shuts down.  Cut the end off the USB cables and soldered the power wires to the input (across C6).
 * Output 3-pin connector pinout is end-wise reversed.  Pin 1 is GND, pin 3 should be GND to match CAEN standard

Here is the specification we were given:

```
We have the following CAEn units that need either 40 or 50 MHz:

WFD (all need 50 MHz driver frequency, I think ECL of some form)
DT5730, 500 MHz, desk top   3-102203-4 connector, LVDS/ECL/PECL/LVPECL (100 ohms ac-coupled)
DT5720, 250 MHz, desk top   (same)
V1724, 16 MHz, VME          (same)
V1720, VME, not sure of frequency  (same)

TDC (needs 50 MHz driver frequency, I think ECL of some form)
V1290N  two 3M 3408-5202  Not clear if Ac- or Dc- coupled
```
