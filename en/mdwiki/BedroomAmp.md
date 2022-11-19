# BedroomAmp

## Amplifier

### 6CY7 Amp

A low power, simple option:  *1 W/ch*

 * As built:  https://github.com/eshazen/6cy7-amp
 * Updated design: https://www.cascadetubes.com/the-6cy7-v2-0-zebrawood-amp/
   * http://diyaudioprojects.com/Tubes/6CY7-SET-Amplifier/ 6CY7 SET]
   * ([forum](http://diyaudioprojects.com/Forum/viewtopic.php?f=9&t=5222))

Original designer measured 1.25W/ch with Edcor iron.  As built with
the MPS transfomers and minimum-7's, it is OK for background listening
(with iPhone as source) but not quite up to e.g. the 6T9 "boombox"
("The maximum rated power output is about 4W with only a Watt or two
of good output.")

Suggest in forum [here](http://diyaudioprojects.com/Forum/viewtopic.php?f=9&t=5222&start=80) to use an alternative output transformer, the [GXSE5-55K](https://www.edcorusa.com/gxse5-55k).  Another alternative would be OT8SE from [https://www.musicalpowersupplies.com/].  $25 ea on eBay from stock with $10 shipping.


Notes:  "Check your plate dissipation. If it's above 5.5W then drop the B+ a little. If not, then leave it alone. My guess is that you're probably fine." (add 100 ohms in B+ if needed)

Rough cost estimate:

```
2  6CY7            $ 6.00    $ 12.00
1  6CA4            $15.00    $ 15.00
1  PT190.2 USA     $55.95    $ 55.95  Musicalpower
1  156L            $15.07    $ 15.07  First filter inductor
2  155H            $15.07    $ 30.14  Second filter inductors
2  OT8SE           $24.95    $ 49.90  Output transformers
                             $178.06  Total above
```

Ordered PT and OT's from MusicalPowerSupplies.com on 12/29

## Speakers

 * Cheap full-range driver like [TubeBoomBox](TubeBoomBox.md).  Those drivers are still $20 each.  1.2lb
 * Other candidates:
   * https://www.parts-express.com/tectonic-tebm65c20f-8-3-1-2-bmr-full-range-speaker-8-ohm--297-2156 ($14) 1.65lb
     * 0.216 ft3 with 1" dia port 2" long
   * https://www.parts-express.com/dayton-audio-nd90-8-3-1-2-aluminum-cone-full-range-neo-driver-8-ohm--290-210 ($19) 0.55lb
     * BEST ANSWER: I would recommend a 0.165 cubic foot enclosure with a 1" diameter, 3" long port for a tuning frequency of 57 Hz.
     * BEST ANSWER: Full range speakers are typically weak on high frequency response. Assuming these speakers are not being under driven by you amplifier, they will almost certainly benefit by the addition of tweeter. It seems your speaker is stereo so you will need to add a tweeter to each channel. You can use a compact tweeter like Dayton ND20FA or ND16FA. You will need to add some type of high frequency filter to the tweeter - even a single capacitor with value around 2.2uf or 3.3uf should be enough for a low power setup. You will most likely need to reverse the polarity on the tweeter to bring it in better phase with the full range driver. In case the tweeter is too loud, consider adding a 2 or 3 ohm audio grade resistor in series with the capacitor. If you're up to it, you can build a full 2-way crossover.
   * Tang Band W5-2143 5" full range ($61 each).  Calculator https://www.micka.de/en/index.php#ideal box design [here.pdf](http://ohm.bu.edu/~hazen/TubeAmp/Speakers/TangBand-W5-2143-vented-box.pdf)


 * Minimus-7 are running $75-$100 a pair shipped on eBay


