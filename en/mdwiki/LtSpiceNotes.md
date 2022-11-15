# LtSpiceNotes
After some trouble I figured out how to use a vendor-supplied SPICE module in LTSPICE.
I think this is it:

1.  Find the LTSPICE library directory.  On my computer it is in
    ~/.wine/drive_c/Program Files (x86)/LTC/LTspiceIV/lib

2.  Get the SPICE model you want, e.g.

  http://www.nxp.com/products/rf/transistors/bipolar/oscillators/6_ghz_gt_12_ghz_x_ku_low_band/BFG425W.html

  In the "All Models (zip)" archive find the file "BFG425W_SPICE.PRM" and save it.

  Rename it to e.g. BFG425W.lib and put it in the .../lib/sub directory.

  Edit it like so:
```
    * Filename:  BFG425W.lib
    .SUBCKT BFG425W 1 2 3
```
  The filename probably is just a comment,
  but the SUBCKT name must match what's in the .asy file below

3.  Go to the .../lib/sym directory.  Copy a symbol which matches your model, e.g.
```
  $ cp npn.asy BFG425W.asy
```
4.  Edit e.g. BFG425W.asy like so:
```
    SYMATTR Value BFG425W
    SYMATTR Prefix X
    SYMATTR SpiceModel BFG425W.lib
    SYMATTR Value2 BFG425W
```
    The prefix "X" specifies a spice subcircuit invocation.
    The "Value2" property is the subcircuit name.

Now you should find a new component BFG425W when you use the place component function.
