# FrontPanelBoard
This page has documentation for the front panel board on the APOLLO blade service module.  This is a small PCB which provides a reset/control button, USB console interface and uSD card.

 * Photos: http://ohm.bu.edu/~hazen/APOLLO/gallery/FP/
 * Git: [FP](https://gitlab.com/apollo-lhc/apollosm-fp-hw) [SM](https://gitlab.com/apollo-lhc/apollosm-hw)
   * (obsolete) [SVN](http://gauss.bu.edu/svn/common-atca-blade.hardware/Blade_FP))

## Notes for Rev D

Restarting January 2022

 * Rev C schematic: [Blade_FP.pdf](http://gauss.bu.edu/svn/common-atca-blade.hardware/Blade_FP/tags/RevC_asBuilt/Blade_FP.pdf)
 * Schematic page for the SM Rev2a FP board interface [](attachments/)
   * J207 is 1.8V only and these six GPIOs go directly to the Zynq!
   * J40 signals LED_SCL, LED_SDA, LED_RST, and FP_BUTTON are 3.3V and go directly to the Zynq and can be GPIOs
   * J46 signals can ONLY be used for an SD card (you can use the ground pins)
 * [FrontPanelDisplayTest](FrontPanelDisplayTest.md) -- proposed board to test out displays

Proposed changes:

 * Remove the SD card and associated circuitry.
 * Add the new SM connector for more I/Os
   * This is a third header connector next to the existing two
 * Possibly re-think the display... replace LEDs with a small OLED screen?
 * Maybe add a small GPIO connector

Parts:

 * Possible displays:
   * !DigiKey 3837-ELW0501AB-ND (OLED 0.5 inch class with flexi cable)
   * !DigiKey 516-1173-5-ND (4 character 5x7 matrix LED) Broadcom HCMS-2903
     * !DigiKey A803AR-ND right-angle socket
 * 1S7BE_0305S6U - 3.3V/5V DC/DC converter

Display options (below).  I think the 4-character 5x7 matrix is probably the best.  It's footprint is a convenient DIP-12 of standard size.  Unfortunately the nice right-angle socket probably doesn't fit (have to double-check) so we would need to make an additional small right-angle PCB to hold the display.

The OLED screen is cool but availability of the displays and in particular the connectors is iffy.

<img src="https://ohm.bu.edu/~hazen/APOLLO/WebStuff/display-options.png" width="350">
