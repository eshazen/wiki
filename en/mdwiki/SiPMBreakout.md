# SiPMBreakout

The customer will be using several SiPM modules (model [SPCM-AQC4](http://www.excelitas.com/Downloads/DTS_SPCM-AQ4C.pdf) from Excelitas).  These modules have a somewhat inconvenient 72 position card-edge connector.  The manufacturer provides a breakout board ([SPCM-AQ4C-IO](http://www.excelitas.com/Downloads/SPCM-AQ4C-IO%20Interface%20board%20connections.pdf)).

 * SVN repository: http://gauss.bu.edu/svn/sipm-breakout/hardware/trunk/

They would like us to design a "smaller and better" breakout board.  Here are notes provided by the customer:

 * Integrate power regulation into the breakout board
   * Input 12V nominal (11-14V)
   * Reverse polarity protection
   * Optional:  current fuse, over-voltage protection
   * Suggest DC/DC converter Murata OKY-T/3,T/5 or GE Critical Power ABXS001A4X45
 * Want two sets of connectors with options to populate either/both
   * Set 1:  Individual lines:
     * Coax with SMA (edge mount) or MMCX for TTL discriminator outputs
     * One coax input for all gate lines (fanout on board)
     * Barrel connector or screw terminals for power in
   * Set 2:  Combined connector:
     * Use LVDS for signalling
     * Gate can be single-ended
     * Optional:  carry power
     * Could be USB-C or ribbon cable

Power requirements (from docs):


| Voltage | Current | Notes |
| ------- | ------- | ----- |
| +5V | 0.2-1A | +/- 0.25V |
| +2V | 1.0-3.0A | +/- 50mV |
| +30V | 10-40mA | +/- 1V |

According to the doc, the typical total power is 3.3W or so, so 0.3A @ 12V input.

Notes from docs on PS wiring:

 "When connecting power to the module, good grounding techniques must be observed. All ground connections for the +30V and
 +5V supplies should connect through a single point on the user’s interface. All ground pins on the card edge connector should be
 used. The +2V grounds should be connected together at a single point, but should be separate and isolated from the grounds of
 the other supplies."

# Notes

*2017-01-26* Send preliminary layout to customer

 * http://gauss.bu.edu/svn/sipm-breakout/hardware/tags/before_edits_2018-03-07/

Comments:

 * Is it possible to recess the USB (and maybe the power) connectors further. I measured the rigid part of a random USB-C cable lying around to be ~25 mm long, so in the current layout it would still stick out quite a bit.

 * Can we make all resistors 0805? Especially R1 (50Ohm / DNI) looks too small for anticipated power dissipation.
 * Can you add an electrolytic trough hole capacitor parallel to C2, e.g. 3.5mm lead spacing, 8mm diameter.
 * Can you increase the size of all large value capacitors (>=1uF) to 1206?
 * I like that you added test headers for the regulator outputs, can you also add one to the 12V rail?
 * Can you add mounting holes in the board corners, where possible?
 * Can we add some reverse polarity protection on the barrel jack connector? E.g. a series diode SK153-TPCT-ND on DigiKey.
 * We also need some warning on the silkscreen that this is not a standard USB C port.
 * Can we make the LEDs 0603?

And more comments on *2018-02-16*:

 * Ok, the footprint changes were mostly driven by what we already have in the lab, but if you have already picked specific part numbers, then let's just let them be as they are right now.
 * As for moving the USB/Power connectors and associated board edge back, can we settle on an additional 5mm/200mil? To me it looks like that should be possible without fundamentally changing the layout.

