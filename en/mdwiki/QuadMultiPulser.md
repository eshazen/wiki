# QuadMultiPulser
The proposed change would allow the pulser to run in an alternative mode with a series
of STEP1 and STEP2 pulses (1-32) followed by a single DISCHARGE pulse.

See diagrams:

 * http://ohm.bu.edu/~hazen/G-2/Nam/request.001.png
 * http://ohm.bu.edu/~hazen/G-2/Nam/request.002.png

We agreed that the number of step 1/2 pulse pairs would be 1-32,
with spacing programmable and a bit mask with 32 bits to specify
the positions of the step 2 pulses.


| *Parameter* | *Bits* | *Description* |
| ----------- | ------ | ------------- |
| CHARGE_START  | 21 | delay to start of STEP1                          |
| STEP1_END     | 21 | delay to end of STEP1                            |
| STEP2_START   | 21 | delay to start of STEP2                          |
| CHARGE_END    | 21 | end of STEP1 (single-step) or STEP2 (two-step)   |
| MODE          | 1  | 0=single step 1=two step                         |
| NPULSE        | 5  | number of STEP1/STEP2 pulses 1-32                |
| MASK2         | 32 | bit mask to enable STEP2 pulses individually  |
|               |    | (bit 0 = first pulse)                            |

