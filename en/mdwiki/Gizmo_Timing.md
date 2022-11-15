# Gizmo_Timing
## Gizmo pulse structure

The Gizmo generates one positive and one negative going pulse, separated by 100us, every 32ms.
For the new-new-g-2, we want something closer to the order of pulses every milli-second.
To change the gizmo to do this, we first need to understand how it works.

## How to computer the Gizmo timing

The gizmo has 3 8-bit counters that are used as dividers to generate its pulses.

The first counter (U10) always starts count at 56, so it is basically a divide by 200 counter.

The second counter (U13) starts its count at 156 the first time, but until a full pulser period is completed, it is allowed to roll over.
This means it first divides by 100, but then every other division is by 256

The third counter (U12) starts its count at 127, and when it finishes, all counters are reset.
127 is chosen, so that for the first count, its output bit 7 is a zero, and then all following counts it is a 1.
This bit is used to generate the pulse that is converted (via caps on the output) to the negative and positive going pulses.

### period
Compute the total period (really alittle shy of this because the first round of counter 2 is only 100, not 256)
U10*U13*U12 = 200*256*128 = 6553600 counts
With a 200Mhz clock, we get
200*256*128/(200*10^6 hz) = 32.76800 milliseconds

### pulse separation
The two pulses are separated by an amount that is set by the first overflow of counters 1+2, which is 200*100/(200*10^6hz) = 100us for a 200Mhz clock


## Changes
If we change the first layer to be a divide by 6 instead of a divide by 200, we get

Period: 983.04 microseconds

Separation: 3 microseconds

To make this change, we need P of counter 1 to be 250 or 0b11111010

It is already wired up to have 0b00111000, so we need to jumper P bits 1,6,7 to logic 1.

Pins 4,22,23
