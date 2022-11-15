# AllTubeClock

Thinking to build an all-tube clock.  There are a few inspirations by others.

The most compelling is the Scientific American inspired design based on a 120kHz quartz crystal, but this provides 60Hz for driving a synchronous motor analog clock.  This design is based on AMV (asynchronous multivibrator) dividers similar to legacy TV synch oscillators.  According to the updated design, divide-by-10 is the best one can reasonably get from an AMV stage, but it only takes one tube for each divider.

For a digital display, one can take inspiration from the HP AC-4J/K/L with 4-bit counter, decoder and nixie!  One could even just buy 6 of these and modify them a bit to count from 00:00:00 to 23:59:59.

 * [Updated Sci-Am design](http://www.tronola.com/html/vacuum_tube_quartz_clock_part_i.html)
 * [HP decade counter docs](http://nixiebunny.com/hpac4/)

Here is a hybrid idea:

 * Start with AC line and divide to 1Hz using two AMV stages (two 6SL7)
 * Design 3-bit (0-5) and 4-bit (0-9) stages inspired by the HP counter.

```
  sec:  (3) 5963 tubes
 10 s:  (4) 5963
  min:  (3) 5963
 10 m:  (4) 5963
   hr:  (4) 5963
 10 h:  (2) 5963

 Total: 20  5963 tubes
```

HP use neons to decode binary to decimal and "photoconductor plate" devices to drive the nixies!
