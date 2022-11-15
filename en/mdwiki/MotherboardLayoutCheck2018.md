# MotherboardLayoutCheck2018
*2018-03-09*

Please check carefully the whole board and move silkscreen test
so it does not overlap pads or holes.  Else it will be deleted.
See e.g. P28 and P29.

<img src="http://ohm.bu.edu/~hazen/eVOLVER/temp/silkscreen.png">

*2018-03-05*

Looks good.  A few comments:

## Silkscreen

General comment.  Many texts are only .039 high, which is very small.
If possible, increase height to 0.06 or best .07 for the small ones.
Somehow many of these got changed, as the previous version we
built had most set to .07.  Did you do some sort of global setting?

After you make this change, please check over the silkscreen carefully
and move any items which overlap other items.

Label all the USB connectors "USB PWR ONLY"
(one such label near each pair is ok)

Mark the input voltages and GND below the screw terminal input.

Mark the fan connector with "5V"

## Layout

Remove cutout on ground layer (In1) and just fill the entire plane.
Make sure clearances stay at .01.

Fill entire In2 layer with +5 and +24 areas.  Again, keep clearances
at .01.



