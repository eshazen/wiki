# TTT_Rev2

This page describes the TTTT module, the successor to the TTT.
This module essentially provides encoding and decoding of the fibre optic
protocol used by the LHC TTC system.

This version has the following enhancements:

 * Careful clock distribution to FPGA
 * More (4?) fibre links
 * Gigabit Ethernet (SFP); IPBus v2
 * Substantially larger FPGA to support above requirements
 * Eliminate or move to non-front-panel connector the TTS (RJ-45 I/O)

I/O is as follows:

 * 4X SFP for TTC signalling
 * 1X SFP for Gigabit Ethernet
 * Clock in
 * Clock out
 * 3-4 NIM logic inputs (BC0, L1A, spares)
 * 3-4 NIM logic outputs (BC0, L1A, spares)

### Reference
 * [TTTT_archives.tar.gz](http://ohm.bu.edu/~hazen/CMS/TTTT_archives.tar.gz) -- hardware / firmware / software archive from [BU SVN](http://edf.bu.edu/svn/edf/TTTT/)
 * [TTTT Users Manual](TTTT_Users_Manual.md)
 * [TTTT Software](TTTT_Software.md)
 * [TTTT Debugging](TTTT_Debugging.md)
 * [TTTT TODO](TTTT_TODO.md)


 * [CMS_TTT-TTS_TTC_Tester](CMS_TTT-TTS_TTC_Tester.md) -- V1 board documentation
 * TTCci schematic:  [EDA-00650-V6_sch.pdf](http://ohm.bu.edu/~hazen/CMS/EDA-00650-V6_sch.pdf)
 * TTCex schematic:  [P1](http://ohm.bu.edu/~hazen/CMS/ttcex.1.pdf)  [P2](http://ohm.bu.edu/~hazen/CMS/ttcex.2.pdf)  [P3](http://ohm.bu.edu/~hazen/CMS/ttcex.3.pdf)

Some explanation of the CERN modules:  The [TTCci](http://cmsdoc.cern.ch/cms/TRIDAS/ttc/modules/ttcci/) is
a module developed for CMS which provides much of the same functionality we need, but is output-only.
It has both A/B electrical outputs which would drive a TTCex module, but also a high-power laser which
can drive 32 loads through a passive optical splitter.

The TTCex receives the A/B optical signals plus clock and has 10 high-power laser outputs.

The high-power laser output may be a problem.  The TTCci used a PT5343 which is obsolete.
See [Slide 8](http://indico.cern.ch/getFile.py/access?resId=1&materialId=slides&confId=12273) for
some more info.  The chosen OCP STX03 seems also to be obsolete.


