# Camera_Memory
Summary by e-mail to Sylvain:

<pre>

DDR2 -- 667MT/s or 800MT/s speeds.  The MT/s refers to
mega-transfers/second, where one transfer depends on the width of the
memory, but 16 bits is the widest (which we would use), so this really
corresponds to 16-bit pixels/second.

DDR3 -- 1333MT/s or 1600MT/s speeds.  More or less state-of-the-art.  We
have used this memory, but only on the more expensive Virtex-6 class FPGAs.

The most conservative would be DDR2-667.  If the data goes in and out of
the memory once, then we have a throughput of 333 Mpixels/sec or about
110 Mpixels/sec per camera.  We are digitizing at 160 Mpixels/sec, so if
we agree that for Mode 0 we discard every other frame, and for other
modes we do the binning first, then we should be OK with this memory
technology.

Another way of looking at it is that we propose to transmit the data to
the computer over a 3Gbit/sec link (300MBytes/sec).  The throughput of
DDR2-667 is about 667 MBytes/sec, or twice this amount.

</pre>


