# Release_Notes
*'5 June 2007*

First "working" version which reads out waveforms.
To compile:

```
   make clean; make

```
To select a channel, initialize, and read out a waveforem with
automatic (random) trigger:

```
   ./drift.exe
   drift> w 2 4          set channel number 4 (equals "Channel 1" on box)
   drift> i 15           initialize digitizer, threshold = bit 15
   drift> a              automatic capture of 1 waveform
   drift> t              readout trace to file ''trace.dat'

```
You can then view the waveform using [Gnuplot](http://www.gnuplot.info/)
Simply start gnuplot and enter the command *'plot "trace.dat"*.

For triggered operation, enter the command *'i <bit>* where <bit> is
a bit number from 1-12.  The trigger threshold will be 2**<bit>.
For example, if <bit> is 9, then the trigger threshold will be 512.

The command sequence for triggered operation:

```
  drift> i 9              for ezample
  drift> n                start acquisition, wait for trigger
  drift> t                read trace starting 150 samples before trigger point

```


