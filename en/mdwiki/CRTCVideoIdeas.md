# CRTCVideoIdeas

See [the bible](http://edf.bu.edu/svn/edf/EricHome/Z80System/documents/crt_controller_handbook.pdf) by Gerry Kane (warning, large file!)

Here are some thoughts on the chips he describes:

*DP8350* is fixed-timing (e.g. 24x80).  Includes much of the dot timing.  Provides full memory addressing logic and provision for a line buffer.  National/TI have quite a bit of literature:

 * http://www.bitsavers.org/components/national/_appNotes/AN-0243.pdf
 * https://www.ti.com/litv/pdf/snoa611

*8275* expects a CPU to fill line buffers.  (used for ETC Idea or Vision)?  Not memory-mapped.

*6845* is basically a bunch of counters, providing character address, HS and VS and cursor control.

Can use as bit-map display by using character row as extra address bits.  This would result in funny address mapping but could easily handle e.g. VGA resolution with 8 bit depth (300k pixels).

Idea:  make a hybrid bit-map/character display.  Send MA to two RAMs, one with character output, another with bitmap output.  Use RAMDAC to combine character and bitmap data.
