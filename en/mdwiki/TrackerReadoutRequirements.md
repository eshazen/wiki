# TrackerReadoutRequirements
## Timing

Bunches are separated by 11ms.  Normal operation will have 12Hz of spills but for special dedicated g-2 running we should support 24Hz.

 * 2 tracker stations
 * 1000 straws (channels) per station
 * 10 hits/fill/tube  (*not* uniform!)
 * 8 bytes per hit

Assuming we read out in the 11ms between bunches, the data rate for a 16-channel TDC would be 8*16*10 = 1280 bytes / 11ms = 115kB/s.
This is average.  If we want i.e. a factor of 5 safety this would be 580kB/sec or about 5Mb/sec.  The largest detector has 4 TDCs
per side, so if all shared a readout link this would be 20Mb/sec.

A total of 18 such links would be needed per tracker station, or 36 total.  The total estimated bandwidth for one tracker station
would be 580k * 58 = 33.6MB/sec.  With a 5X safety factor this becomes 168MB/sec.  Half of this is 84MB/sec for each side, which
plausibly fits in 1GbE.  So, at a minimum we would have one 1GbE cable per side per station (4 total).

It is probably more conservative to double the number of GbE links.  A module (VME?) could be designed with 6-8 links and
one GbE output.

Each station would have about 9 straw detector assemblies.  One preliminary design allocates the straws as follows:


| *'Station* | *Straws* | *ASDQs* | *TDCs* |
| ---------- | -------- | ------- | ------ |
| 1 | 32 | 4 | 2 |
| 2 | 64 | 8 | 4 |
| 3 | 96 | 12 | 6 |
| 4 | 96 | 12 | 6 |
| 5-9 | 128 | 16 | 8 |
| Total | 928 | 116 | 58 |

