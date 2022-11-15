# PMT_HV_Test_Log
[High_Voltage_for_PMTs](High_Voltage_for_PMTs.md)

*'2011-06-21*

Modify board:

```
  Change R12 and R13 to 1k; ground bottom end of C8
    (this makes two 20kHz RC low-pass filters in series)
  Cut trace from C8 to J3
  Add .01uF from J3 to HV output

```
See [scope traces](http://ohm.bu.edu/~hazen/LBNE/HV_Supply/ripple_2011-06-21_a.png)

```
  Channel 2 (top) is pico output (Ac-coupled)
  Channel A (mid) is top of C7 (first stage filter)
  Channel 3 (bottom) is top of C8 (second stage filter)

```
Changed C7, C8 from 0.01 to 0.1uF.  Filter cutoff freq is theoretically now 2kHz.
See [scope traces](http://ohm.bu.edu/~hazen/LBNE/HV_Supply/ripple_2011-06-21_b.png)
Note change of scale on bottom trace.

Ripple on 2nd stage (C8) decreased from ~1V p-p to ~200mV p-p.

See [additional traces](http://ohm.bu.edu/~hazen/LBNE/HV_Supply/ripple_2011-06-21_c.png)


*'2011-06-15 (hazen, damask)*

Test conditions for ripple test:

See [sketch](http://ohm.bu.edu/~hazen/LBNE/HV_Supply/test_setup.jpg)

```
  Jumper JP4 installed, JP6 out (feedback taken from Pico input)
  Output loaded with 1Meg, output voltage ~ 650V.
  Circuit modified slightly.
    R8 top end (HV divider) now connected to SHV output (after filters).
    1k inserted between JP4/JP6 and U2-2 (add feedback resistor)

```
```
  Input to Pico:  4.76V
  Output at TP1:  3.23V  (647V output)
  Load:           1MEG

```
See [scope traces](http://ohm.bu.edu/~hazen/LBNE/HV_Supply/ripple_2011-06-15.png)

```
  Channel 1:  PICO output through 47pF series, 100k to GND to scope probe
  Channel 2:  PMT output BNC
  Channel 3:  PICO input at pin 1

```
PICO spec is for 2% ripple.  2% of 650V is 13V, which is what we see!
Remove JP4, install JP6.  Reset output voltage to ~650V (it''s different with
PICO out of the feedback loop due to non-zero startup voltage of PICO).

See [scope traces](http://ohm.bu.edu/~hazen/LBNE/HV_Supply/ripple_2011-06-15_b.png)
They are essentially identical.  So, we can conclude that the ripple is not
being caused by our op-amp circuit.

*'2011-01-20, hazen, linden*

Continue testing.  Install U3 and measure HV output, TP1 and input (on JP4) at several voltages.
See [Google Spreadsheet](https://spreadsheets.google.com/ccc?key=0AlkcEtLoMLBZdE5udkxCUFJ6UnQ4ekdraG1mLUYwelE&hl=en&authkey=CJ6kq7AD)

Remove feedback wire from JP2-JP7 and install JP6 to complete feedback loop from HV divider.  It works!
Stop for now to ponder next steps.

*'2011-01-19, hazen, damask, linden*

Initial testing.  Fix a couple of issues on the board:

 * Change R11 to 100k
 * Change C11 to 1uF

First test is open-loop.  Use wire-wrap to short JP2 and connect to U2-2 via JP7 pin.  This closes the feedback loop at U2.
Confirm that HV output is present and at a plausible level.

