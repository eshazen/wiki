# OtherTubeAmps

### 6336 SET Amp

(The latest)[https://www.cascadetubes.com/the-6336-set-amp/] from Matt at Cascade.  Clean output up to 6.3W, max 8W.

Price/parts:

| Quan | Item                | Each | Total | Notes               |
|------|---------------------|-----:|------:|---------------------|
| 1    | 6336 tube           |  $30 |   $30 | Average e-bay 11/22 |
| 1    | GZ34 tube           |  $20 |   $20 | Tube Depot          |
| 2    | 12AU7 tube          |  $20 |   $40 | New AES, T.Depot    |
| 2    | Edcor GXSE15-8-2.5k |  $70 |  $140 | Output transformer  |
| 1    | Edcor XPWR178-120   | $115 |  $115 | Power transformer   |
|      |                     |      |  $345 | Total               |

Runs hot!  The 6336 dissipates around 79W!



### Lacewood Amp

* 3.1 W/ch *

 * [V1](http://www.cascadetubes.com/the-6v6-lacewood-amp/) [forum](http://diyaudioprojects.com/Forum/viewtopic.php?f=9&t=3274)
 * [V2](http://www.cascadetubes.com/the-6v6-lacewood-amp-v2-0/) [forum](http://diyaudioprojects.com/Forum/viewtopic.php?f=9&t=5736)

```
1  Hammond 270FX   $74.24    $74.24  Power transf
1  XPWR163         $62.09            Alternate pwr tran
1  Hammond 193J    $58.83    $58.83  10H choke
1  CXC100-7H-150mA $47.01             Alternate inductor
2  Triad C-24X     $ 9.78    $19.56  1H choke
1  5U4GB           $15.00    $15.00  Rectifier
2  6V6GTA          $ 7.50    $15.00  Approx eBay price
2  GXSE10-5K       $29.84    $59.68  Output transf
                    Total   $242.31
```

## KT120/KT88/EL34 SE Amp

The KT88 ones below can allegedly handle KT120 with 300 ohm Cathode resistor.  Matt from Blueglow says:

```
Let me put an end to your suffering.

Simple build this amp http://www.diyaudioprojects.com/Schematics/Mikael-Abdellah-SE-KT88-Amplifier.htm
But remove the KT88 and insert and freshly purchased matched pair of Tung-Sol KT120s. Change the cathode
resistor to 300ohms. Nothing else has to change. Just ensure the power tranni can deliver about 300mA
because my amp consumes 112mA per tube. And you have a small current drain for the 6N1P. Also make sure
you OPTs will handle the idle current.
```

 * http://www.blueglow.net Youtube: https://www.youtube.com/watch?v=eNBgo9Md8IU  [Docs](https://drive.google.com/drive/folders/17jRI1lE_Vf9_Pq64LbT-PHy3pLpW1vuj?usp=sharing)


Also mentions a long thread on AK

 * As: [pimp my amp](http://diyaudioprojects.com/Forum/viewtopic.php?f=9&t=3915) forum thread [basic schem](http://www.diyaudioprojects.com/Schematics/Mikael-Abdellah-SE-KT88-Amplifier.htm)
 * Or: https://diyaudioprojects.com/Tubes/KT88/
 * And: http://diyaudioprojects.com/Forum/viewtopic.php?p=16391#p16391

See http://www.valvewizard.co.uk/se.html for a great tutorial on SE output stages

Tubes:
```
Rectifier 5Y3, 5U4*
Preamp  6N1P
Driver  KT88 (have them!) or 6L6, EL34, 6CA7
```

Parts:
```
1  XPWR010            $85.71    $85.71
or XPWR214            $86.00    $86.00  (360-0-360 @ 400mA, dual 6.3 CT @ 4A)
1  Hammond 193J       $60.78   ($60.78)
1  CXC125-10H-200mA   $61.37    $61.37  (alternate)
2  GXSE15-8-5K        $42.34    $84.68
or CXSE25-5K          $94      $188.    (25W, 200mA, UL tap)
```

More thoughts:

 * PS would need a bit of redesign for KT120 to handle the power.
 * XPWR214 doesn't have a 5V winding
 * 5U4 is marginal for the current draw



### "Poddwatt" Flavor

Compare price for iron and glass only:

*Junkbox amp*

 * http://diyaudioprojects.com/Tubes/Junk-Box-Audio-Amp/

Like using octal tubes, maybe pick something from here.
PT is a problem.  No Edcors quite fit the bill.  The XPWR105 at $50
does the HV but only 6.3V @ 3A.  (need 5.6A@6.3V or 2.8A@12.6V).
Hammond FT is $25 or so (e.g. 166N12).  For the same price one
could use a huge XPWR117 for $75.

```
                     Edcor   Tube Depot  AES    eBay   Total
2  GXPP10-6-10k OPT  $40.87                             $82
1  XPWR105           $51.00                             $51
1  Hammond 166N12    $25.00                             $25
2  12SL7 tube                  $14                      $28
4  6Y6G tube                                     $10    $40
                                                       $226
```

*Budget Poddwatt*

 * http://diyaudioprojects.com/Forum/viewtopic.php?f=9&t=5971

```
                     Edcor   Tube Depot  AES    eBay   Total
2  12SL7                      $7.95    $6.21            $13
4  12A6                       $5.00    $4.50   $2       $10
1  EM0850 PT         $50*                               $50
2  GXPP10-6-10k OPT  $40.87                             $82
                                                      $ 155 Total
```

Note: The EM0850 is mythical at this point and the price is a WAG

*Original Poddwatt*

```
                     Edcor   Tube Depot  AES    eBay   Total
1  set Iron          $153.76                           $154
4  JJ EL84                    $10                       $40
2  JJ 5751                    $14        $13            $26
                                                      $ 220 Total
```

### Battery Power ?!

This could in principle be battery powered.  Here's a simple boost converter which can provide 220V at 60mA from 12V input.  Including two 6CY7 heaters in series, this is about 1.85A total at 12V.  (the complete converter would need a controller, which could either be an integrated solution (e.g. MAX1771) or an AVR for example).  Could include a power-up delay, and ability to run off a 12V brick.

<img src="http://ohm.bu.edu/~hazen/TubeAmp/BatteryPower/BoostConverter.png">


