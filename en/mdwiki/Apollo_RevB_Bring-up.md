# Apollo_RevB_Bring-up

# Bring-up
<img src="320px">
<img src="320px">
## Physical
 * Enclustra 7 series fits
 * Enclustra USP series fits
 * Slides into 1-U shelf.
 * SSD fits (needs standoff)
 * CM mech model fits
## Base resistance

| | R |
| | - |
| 12V0 | 10k |
| 3V3 STBY | 64 |
| 3V0 | 25k |
| 4V5 | 25k |
| 1V8 | 1.3k |
| 3V3 | 365 |
| 1V8Z | 3.8k |
| 3V3Z | 3.4k |
| 3VZ | 25k |
| 4V5Z | 12.8k |
| -48VA | 36k |
| -48VB | 36k |

## Power up
 * Nothing installed: 48V @ 0.06A  (1A trip, 0.5A limit)

   3V3 STBY OK

 * Adding 12V en jumper: 48V @ 0.12A (same trip/limit)

   3V3 STB OK

   12V  OK

 * Changing CLPD JTAG port to local power for test. (swap R640 & R641)

   Yay! the CPLD came up on the boundary scan

   Moving the CPLD JTAG back to Zynq

## New IPMC FW
   * IPMC didn't explode.
   * Seems like the blue LED is red...
   * Adding ESM for network access

   * 2020-10-08
   * latest fw isn't working, going back to modified no shelf FW
   * IPMC FW with 12V on gives 0.13A on 48V
   * ESM required ECO to pull EN high (connected it via R249)
   * networking not working.  Unknown.
   * try to power up zynq supplies via wire between R208 and 12V (proper turn on for 12V->4.5/3V converter)
   * with this installed all misc and zynq 4.5,3.0,3.3,1.8 supplies come up. ~370mA

## Build SDCARD
   * Dan fix this!

## Booting 7 series Zynq
   * Powered up with FW.  Using 0.43A on 48V
  *


## Si 5344
 * SCLK AND SDA were swapped, fixed in FW
 * xtal was installed incorrectly

## INA3221
 (7-series)

 | Supply | voltage (V) | current (mA) |
 | ------ | ------- --- | ------- ---- |
 |1V8     | 1.792       | 266          |
 |3V3     | 3.240       | 1,176        |
 |3V3 STBY| 3.264       | 884          |
 |1V8 Z   | 1.8         | 0.8          |
 |3V3 Z   | 3.256       | 556          |
 |12V Z   | 11.984      | 260          |
I convert: I = ((reg/8) * 40*(10^-6V) )/(0.05 ohms)
