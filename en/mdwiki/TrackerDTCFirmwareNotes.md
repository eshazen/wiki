# TrackerDTCFirmwareNotes
## Things not to forget

 * In-line calibration (pass ToT values through LUT in real time) is desirable
 * Would like option to send/check BcN from chip

*2019-09-04*

See https://indico.cern.ch/event/834995/contributions/3499262/attachments/1898255/3132468/Apollo-Update.pdf

And https://espace.cern.ch/Tracker-Upgrade/Pixel_electronics/Shared%20Documents/Services/ITServices_Appendix_Draft.pdf

Hitmap encoding confirmed:

 * First AA: 10, 11 or 0 (01)
 * optional left tree 3-14 bits
 * optional right tree 3-14 bits

DTC connections


| DTC  | Read Out         | MFB | LpGBTs Z+/- |
| ---  | ---- ---         | --- | ------ ---- |
| #1   |  L1              | 3   | 30 / 24     |
| #2   |  L2+ 1 TFPX  dd  | 4   | 44          |
| #3   |  L3+ 2 TFPX  dd  | 6   | 60          |
| #4   |  L4+ 2 TFPX  dd  | 6   | 54          |
| #5   |  3   TFPX    dd  | 6   | 60          |
| #6   |  2   TEPX    dd  | 4   | 48          |
| #7   |  2   TEPX    dd  | 4   | 48          |

<a href="http://gauss.bu.edu/svn/cms-tracker/Figures/DTC_mapping.png"><img src="http://gauss.bu.edu/svn/cms-tracker/Figures/DTC_mapping.png" width="300"></a>

*2019-08-07*

Count of complete encoded hitmaps with length less than or equal to:


| Length | Count |
| ------ | ----- |
| 4      | 1     |
| 5      | 6     |
| 6      | 16    |
| 7      | 30    |
| 8      | 53    |
| 9      | 94    |
| 10     | 167   |
| 11     | 298   |
| 12     | 515   |
| 13     | 849   |
| 14     | 1357  |
| 15     | 2147  |

A block RAM (18K) configured as 4k x 4 could decode 12 in giving a 4-bit code out.

Single LUT could decode 6 bits giving a 2-bit code out (4, 5, 6, many)
A slice (6 LUTs) could decode 7 bits giving 3-bit code out.

*2019-08-06*

Hit mask decoding.  See: http://gauss.bu.edu/svn/cms-tracker/Reference/scramble/trunk/

`encode -p` produces an encoding table (use `-c` for CSV format) in `encoding_table.csv`.

`decode_stage.pl` creates a decoding tree using LUTs by splitting the encoded stream into chunks of specified length.

A Xilinx _slice_ (see [UG574](https://www.xilinx.com/support/documentation/user_guides/ug574-ultrascale-clb.pdf)) can implement a 64x8 LUT.  (A KU15P has ~64K slices, VU9P has about 148K slices.)

See RD-53B encoding below.

<img src="http://ohm.bu.edu/~hazen/CMS/InnerTracker/web/RD53B_encoding.png">

Worst-case is example (c) with one pixel hit to encoded output is '0000' and TOT are disabled.  This can result in a new compressed Hmap every 6 bits of input.  Also, note that the effective input rate can be 1.28 Gb/s times four or 5.12 Gb/s.

Looking briefly at 64/67 coding.  See for example:

 * https://www.alexforencich.com/wiki/en/scripts/matlab/enc64b67b

*2019-03-27*

 * https://github.com/d1vanov/Simple-FFT
 * PIX mtgs: [3/6](https://indico.cern.ch/event/798916/) [1/31](https://indico.cern.ch/event/793114/)

*2019-03-26*

Looking at 64/66b scrambler:

http://gauss.bu.edu/svn/cms-tracker/Reference/scramble/trunk/scrambler_figures.pdf

Write a C simulation:

http://gauss.bu.edu/svn/cms-tracker/Reference/scramble/trunk/scramble3.cpp

This simulation runs pseudo-random data through the scrambler/descrambler
with errors introduced, and measures the time to recover correct data.
For errors at fixed spacing >> 64 bits, the time to recover is 2 or 3 words.

Add histogramming to the code to histogram the time in bit periods between
the last introduced error and the first correct code.  The maximum is 185,
which is (64+64+58).  (58 is the length of the scrambler shift register).

Tentative conclusion: ''After any sequence of bit errors, the scrambler recovers
after at most 186 bits''.

*2019-03-04*

Working out readout using:

   * [Roberto's Slides](https://indico.cern.ch/event/800821/contributions/3329329/attachments/1804786/2944867/RB_20190301.pdf) from 2019-03-01
   * [RD53B Manual Draft](https://indico.cern.ch/event/800821/attachments/1801048/2937708/RD53B_Main.pdf)
   * [RD53A Manual](http://cds.cern.ch/record/2287593/files/%20RD53A_Manual_V3-42.pdf)


Downlink:

   * 160Mb/s with 16-bit *frames* (frame rate 10MHz or 4xBX).  Each *frame* contains two *symbols*.
   * 54 possible symbols (to maintain DC balance).  32 Data symbols, 15 trigger symbols and 7 extra symbols.
   * There are 3 *fast commands* which occupy a single frame:  *Clear*, *PllLock* and *Trigger*.
   * *Trigger* command is sent as {*Trig_NN*, *Any Symbol*}.  The first symbol with *_NN* from 1 to 15 specifies a mask for the 4 possible BX which may contain triggers.
   * The second symbol assigns a tag (6 bits, one of the 54 valid symbols) expanded to 8 bits internally.  The extra two bits specify the BX number (0-3) offset.  One "short" tag may expand in the chip to up to 4 extended tags based on the number of BX which contained triggers.
   * The extended tags are taken from a "bag" (storage memory) of tags, where each tag is marked as "in use" until the data with the corresponding tag is returned by the chip.

Uplink:

   * 1 to 4 Aurora 64/66b 1.28Gb/s encoded lanes forming a Simplex Aurora Channel
     * Data has strict alignment (same data type on all lanes)
   * Channel may contain:  *Pixel Data*, *Service Data* or *No data*
   * *Pixel Data*: continuous _stream_ of frames each starting with *01* header with 64b data
   * *Service Data*: Single frame with `10` header with 64b data
   * *No data*: Standard Aurora idle frame with `10` header

RD53 chip layout (reference)

   * 8x8 pix "cores" each 400um x 400um
   * 336 rows (H) x 432 columns (W) for CMS (ATLAS is a bit different)
   * 42 core rows x 54 core columns
   * Also defined _quarter-core_ with 4x4 pixels

Pixel Data Stream Format:

   * Each frame uses MSB = *1* to flag start of stream (so each Frame has 63b pixel data)
   * Stream starts with 8b (internal) tag followed by a header:
     * ccol (1-55, 6 bits).  Values 56 or greater (binary 111xxx) indicates an internal flag (e.g. event boundary)
     * qrow (0-191, 7 or 8 bits:  see page 11 in  [manual](https://indico.cern.ch/event/800821/attachments/1801048/2937708/RD53B_Main.pdf)) and also Table 5 on page 12
     * 1 bit "neighbor" (two neighbor quarter-cores hit in same ccol)   Means that neither ccol nor qrow is repeated
     * 1 bit "more hits" (more hit quarter-cores in the current ccol).  Means that ccol is not repeated for subsequent hits
   * Hit map (variable length 5 to 30 bits, binary tree encoded)
   * ToT's (4 to 64 bits).  4 bits per qcore hit

See [Slides](https://indico.cern.ch/event/800821/contributions/3329329/attachments/1804786/2944867/RB_20190301.pdf) (esp pages 7, 8...) for some nice figures






*2018-11-16*

Aurora decoders:
 * "Yarr" part of YarrPixDAQ (Timon Heim)
 * MSU Thesis: http://cds.cern.ch/record/2631488/files/CERN-THESIS-2018-100.pdf?subformat=pdfa&version=1

*2018-11-09*

Pixel meeting, with useful slides:
[RB_20181109.pdf](https://indico.cern.ch/event/759748/contributions/3205273/attachments/1750293/2836075/RB_20181109.pdf)

Details are still evolving, but the following seems to be true:

 * A stream always starts on a 64b boundary with NS=1
 * Streams are variable-length, and the receiver must decompress the data to find the tags which indicate potential event boundaries.  On error, what to do?  (event boundaries lost)
 * Up to 4 chips can be daisy-chained to one output stream.  These will be interleaved as 4 virtual channels but within each virtual channel the events are contiguous


*2018-11-05*

Reading [B-encoding-r6-1.pdf](http://ohm.bu.edu/~hazen/CMS/InnerTracker/B-encoding-r6-1.pdf).  Summary:

 * Data sent using Aurora 64b66b encoding on 1-3 streams per chip
 * Each Aurora frame starts with NS (new stream) bit.
 * Data is in streams, which always start on a 64b frame where NS=1
 * Each stream starts with an 8b tag followed by data and 11b internal tags
 * A stream contains the full data for an integer number of hits
 * A stream can contain fractional or multiple events
 * Streams end when there is no data to send or getting near 64b boundary

Stream format (preliminary)

 * NS=1
 * 8 bit tag
 * 6 bit ccol (integer 1-55)
 * compressed data...
 * orphan '0' bits to end of 64b frame

Event boundaries and such are not covered and not decided.  They will be negotiated
somehow with the CDAQ folks (maybe we will even be invited to the discussions?!)


*2018-10-31*

See [slides](https://indico.cern.ch/event/759745/contributions/3151128/attachments/1737639/2811006/IT_uDTC_status_update_19Oct2018.pdf) from recent [IT DAQ](https://indico.cern.ch/category/5221/) meeting.

### RD53A chip general

See manual: http://cds.cern.ch/record/2287593/files/%20RD53A_Manual_V3-42.pdf

 * Serial interface
   * Input is 160Mbps, 16-bit frame stream (4BX/frame) hamming coded
     * Cmds:  ECR, BCR, pulse, Cal, WrReg (long, short), RdReg, Noop, Sync
   * Output is 1.28Gbps 4-lane Tx (1-4 lanes used) with Aurora 64b/66b encoding.

Above controlled through eLinks on LpGBTX ASIC.
