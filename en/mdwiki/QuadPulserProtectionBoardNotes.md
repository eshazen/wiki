# QuadPulserProtectionBoardNotes
*2017-07-14, Eric*

 * Use vias to connect +1, -4 to diode pins (Done)
 * Add 2 capacitors from -1 to GND and from +4 to GND (4 total).
  These should be thru-hole 0.1uF (Done)
 * Fix the footprint for the SMA connector.  The hole size is currently the same as the pad size, and it should be at least .020 larger. (Done)
 * edit all the silkscreen text to be the same size, right-side up
  and placed on the board so as not to overlap anything. (Done)
 * Add an overall legend on the silkscreen: (Done)

```
G-2 Quad Pulser
Input protection board
edf.bu.edu
D. Barnes  2017-07
```

 * Get quotes for 3-4 day turn (Sunstone, Advanced) for 6-10 pieces (Done)
 * Find parts, make a BOM, make a DigiKey order

*2017-07-21, Hugo*
 * Check caps C4, C7. (The DRC doesn't like C4's connection; C7 doesn't look too much better.)
 * Touch up the silkscreen.
