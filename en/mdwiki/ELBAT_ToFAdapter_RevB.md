# ELBAT_ToFAdapter_RevB
 * Fix footprint for U6 and U8 (SN74LVCG04), pads are too far apart and too large. It was still possible to solder but there is concerning clearance.
   * Do you mean U3 and U8?
   * I think this is still wrong.  The schematic calls for a `595-SN74LVC1G04DCKR` which is package type SC70 or [drawing](http://ohm.bu.edu/~hazen/elbat_tof/2019/dck.png) DCK. *Please fix it*

 * Fix footprint for U2 (MC100EPT25), footprint is too small. It was not possible to attach this component but this segment of the circuit is not immediately needed for testing. Possible temporary solutions could be dead-bugging the proper component to the back of the board or using another IC and dead-bugging that.
   * Fixed, OK
 * Look into removing 3.3V power supply and generating 3.3V from linear regulator
   * Verify that C8 has ESR meeting requirements [from U1 data sheet](http://ohm.bu.edu/~hazen/elbat_tof/2019/esr.png).
   * What is the power dissipation for this part?  Need a copper heatsink area on the top layer?

 * Move to female connectors
 * Shift connectors and make more room for BNC connectors.
   * Connectors very close to mounting holes.  Is this OK?
 * Remove +12V supply and LED Circuit.
 * Fix NC pin on power supply molex connector.
 * Fix Testpoint footprints (move to 1/10").
