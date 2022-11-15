# TubeBiasMonitor
Built a board.  4x INA128 instrumentation amp input plus 2X single-ended inputs, all powered on 24V.

INA128 can run up to 36V, LM358 up to 32V.  SRPP offset voltages are around 45V or higher, so maybe with the divide-by-two inputs it would be better run on 28V or even 30V.

 * Design: http://edf.bu.edu/svn/edf/EricHome/TubeAmp/BiasMon/bias/
 * Schematic: http://edf.bu.edu/svn/edf/EricHome/TubeAmp/BiasMon/bias/tags/RevA/bias.pdf

*11/8/20*

Stuffed board, trying to test.  Completely screwed up the programming connector.  It's a 2mm pitch numbered wrong.
Managed to wedge in a 2x3 header, can maybe fix the pinout with a knife.

```
  MISO (18) -- 1   2 -- VCC
   SCK (19) -- 3   4 -- (17) MOSI
  nRST (1)  -- 5   6 -- GND
```

Now I can at least download blinky light firmware :)



Box:

 * Hammond 1590BB (metal) https://www.hammfg.com/part/1590BB
 * Hammond 1591B.  https://www.hammfg.com/electronics/small-case/plastic/1591t
   * Would require board < 2.89" wide board

INAs would measure the four bias voltages.  Additional channels would measure the
DC offset from GND of the cathode circuits on each side.


