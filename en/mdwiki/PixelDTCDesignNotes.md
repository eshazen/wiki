# PixelDTCDesignNotes
## Aurora 64/66 Input

 * Introduction to 10 GbE 64b/66b: [10GbE_CI49.pdf](http://ohm.bu.edu/~hazen/CMS/InnerTracker/10GbE_Cl49.pdf)
   * See esp page 23 on for scrambler/gearbox details
 * 8b10b vs 6466 coding: [8B10B_Coding.pdf](http://ohm.bu.edu/~hazen/CMS/InnerTracker/8B10B_Coding.pdf)

## On-board RAM

DAQ output estimate for one DTC is about 400 Gbit/s

Maximum (component) DDR4 speed is 2400 Mb/s

So, R/W of all data would require 333 bits and is therefore completely excluded.  We will not be buffering
the data in RAM.

## DAQ Outputs

DAQ document ([DocDB](https://cms-docdb.cern.ch/cgi-bin/DocDB/ShowDocument?docid=13356)https://cms-docdb.cern.ch/cgi-bin/DocDB/ShowDocument?docid=13356 DocDB]) describes various DTH modules.

*DTH400:*  16 (or 24) inputs (25 or 16 Gbps) and 400 Gb/s output

*DTH1200:*  48 (or 72) inputs (25 or 16 Gbps) and 1200 Gb/s output

In the document, Table 2.2 says we have the following for the inner tracker:

```
 4  BE crates
 2  DTH1200 per crate
 8  DTH1200 per subdet
 24 D2S links per crate
 96 D2S links per subdet
```

The document also says that there are 4 crates with 6 boards per crate.
They calculate the output b/w based on 72 inputs at half-capacity
or 72x10/2 = 360 Gb/s.

This requires 4x100 Gb/s output per board, or 16 links at 25Gb/s.
The DAQ document does not address whether these are bidirectional links,
but I think we can assume a minimum of one return fiber per 4 output fibers.
