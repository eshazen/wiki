# FanPowerSupply
This project is a 3-phase step-down transformer to power two high-temperature fans.
It contains 3 single-phase transformers wired in a delta-wye configuration which
drops the voltage to about 100V per phase to slow the fans down a bit.

### Proposed Upgrade June 2011

The system is being upgraded to handle 4 fans.  The power supply (transformer) box
will be replaced by a 3-phase
[Variac](http://en.wikipedia.org/wiki/Variac#Variable_autotransformers)

 * [ST200 series variac mechanical drawing](http://ohm.bu.edu/~hazen/nEDM/FanControl/St100_200Mech.gif)
 * [Engineering drawing](http://instrumentation-central.com/staco/EngineeringDrawings/291-3.pdf)
 * Schematic for Variac Box: [PDF](http://physics.bu.edu/~chill90/Variac_Fan_Power_Box_Final.pdf)
&bull; [ExpressSCH](http://physics.bu.edu/~chill90/Variac_Fan_Power_Box_Final.sch)
 * Note: All switches, temperature controllers, and the variac will be mounted on the box''s front panel.  All plugs, input cables, and fuses will be mounted on the rear panel.
 * [Bill of Materials for Variac Box](http://physics.bu.edu/~chill90/EDM_BOM-Variac_Box.pdf)

### Existing system as of May 2011

 * Power Supply (transformer box) as built: [ExpressPCB](http://ohm.bu.edu/~hazen/nEDM/FanControl/Fan_Power6.sch)
&bull; [PDF](http://ohm.bu.edu/~hazen/nEDM/FanControl/FanPower.pdf)
 * [TempSwitch.pdf](http://ohm.bu.edu/~hazen/nEDM/FanControl/TempSwitch.pdf)


