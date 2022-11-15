# Software_Documentation
To run the drift software and capture waveforms on the BU test computer:

First, check out the software from Subversion and compile it:

```
  $ mkdir work_dir
  $ cd work_dir
  $ svn co svn://cms1.bu.edu/WireDig
     A    WireDig/src
     A    WireDig/src/many_wf.c
     A    WireDig/src/test1.c
        ...
     Checked out revision 1.
  $ cd WireDig/src
  $ make
     cc -O0 -g -c drift.c -o drift.o
     cc -O0 -g -c myEthDBlib.c -o myEthDBlib.o
     cc -O0 -g -c digi.c -o digi.o
     cc -o drift.exe drift.o myEthDBlib.o digi.o  -lreadline -lncurses

```
Now, run it as follows:

```
  $ ./drift.exe 192.168.0.16
  drift> w 2 3                        (select digitizer channel 3)
  drift> i 15                         (initialize all channels, disable threshold)
  drift> i 3 11                       (set channel 3 threshold to 2**11)

```
After this it is initialized and you can record waveforms.  It is easiest to see them
if you open a separate terminal so you can run ''gnuplot'.

The following commands capture a triggered waveform.  The trigger occurs when the
ADC value exceeds 2**n where n is the number set above in the command "i 3 11" (i.e. 11).

```
  drift> n                            (capture a triggered waveform)
  drift> t                            (write to file trace.dat)

```
Alternatively, use the *'a* command to capture a non-triggered waveform.

```
  drift> a
  drift> t

```
You can plot these waveforms using gnuplot:

```
  $ gnuplot
  gnuplot> plot "trace.dat" with lines

```
You can zoom on part of the waveform like so:

```
  gnuplot> plot [x=1:1000](x=1:1000.md)

```
Here is a sample: [sample_trace.gif](http://joule.bu.edu/~hazen/DRIFT/sample_trace.gif)
(-100mV pulse (500mS period, 10% duty cycle) into the test input).


