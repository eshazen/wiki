# ChenLab
PCB design for animal cage monitoring and control.

 * GitHub:  https://github.com/KremerMichael/chen-lab-PCB
 * Schematics:
   * http://ohm.bu.edu/~hazen/ChenLab/CageBoard_RevA_schematic.pdf
   * http://ohm.bu.edu/~hazen/ChenLab/CageBoard_RevB_schematic.pdf

Rev A is a Git tag: [RevA](https://github.com/KremerMichael/chen-lab-PCB/releases/tag/RevA)

Additions for Rev B:

 * Add two new solenoid driver circuits (J5, J11 outputs)
 * Change most parts to thru-hole
 * Add indicator LEDs
 * Add new 3-terminal connections for Lick Sensor and Beam break (J16, J17, J18)

Note that RevA is a tag in git.

This is a carrier for a NI [USB-6501](https://www.ni.com/en-us/support/model.usb-6501.html) module.
We should use the "OEM" flavor which has a ribbon connector already mounted.

Off on an adventure to try to get the software working under Linux. See [ComediDebugging](ComediDebugging.md) for more info.
