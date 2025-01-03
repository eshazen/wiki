# 6V6PPAmp
### Push-Pull 6V6 amp (~ 10WPC)

This could possibly be a first kit or commercial amp.  Hammond iron and tube rectification
is appealing, but relatively expensive.

 * https://diyaudioprojects.com/Schematics/DIY-Push-Pull-PP-6V6-Tube-Amplifier/
   * Note on phase splitter: https://www.bonavolta.ch/hobby/en/audio/split.htm#Paraphase
   * Some [useful notes](http://diyaudioprojects.com/Forum/viewtopic.php?f=9&t=6305)

### Parts parts parts

* Output
  * Edcor GXPP15-8K $83.54 each
  * Hammond 1608A option about $125 each
* Power
  * Hammond 272HX about $130 each
  * Edcor XPWR215 (150mA enough?) $111.84
  * Edcor XPWR225 $147.83


Seems like it might need a pre-amp stage.  Maybe the cascade tubes
"universal preamp"?

After reading a lot of negative reviews of various pre-amps, put this
on hold for now.

Notes from "Jim_O" on diyaudioprojects forum:

The original schematic showed an option to use EL84 / 6BQ5 tubes
instead of the 6V6. Just a different cathode resistor. If I had to do
it over again I probably would have used the EL84's. Beefier tube and
probably a little more output. About the only place I deviated from
the original design was the power supply. I used an Antek toroid PT
(ugly but effective) AS1T230 with two 230 vac secondaries. I connected
them in series, forming a 460 vac CT winding and fed a 2-diode
full-wave rectifier setup, feeding a CRC filter with two 250 uf
electrolytics and a 50 ohm , 10-watt resistor in between. That gave me
a little over 300 vdc B+. I used AC for the heaters. No audible hiss
or hum.

More notes from forum:

https://diyaudioprojects.com/Forum/viewtopic.php?f=9&t=7531

About eight years ago, I built my version of this amp
http://diyaudioprojects.com/Schematics/ ... Amplifier/ It sounded
pretty good, but I always felt like it could be improved. I had made
some mistakes in the 6SL7 input stage layout, and I didn't like the
method of obtaining negative feedback; routing the 6SL7 cathode ground
circuit through the output transformer secondary. This made it
difficult, if not impossible to experiment with the NFB values to
improve the sound.  While looking around Giuseppe Amato's website
http://www.vtadiy.com I noticed that several amps that he designed and
built all used a 12AX7 input and phase splitter setup. The circuit
used traditional methods for obtaining the NFB, something that would
be easy to modify. And the circuits are uncomplicated.  AES has some
neat adapter plates for installing a 9-pin Noval socket in an octal
chassis cutout. So I ordered a couple of those and a few additional
components and proceeded to disassemble everything from the volume
control up to the 6V6 power tubes. I rebuilt it using Giuseppe's
circuit, using the parts values that he designed in.  I modified my
power supply to obtain the voltages he specified. Only other component
values different from the old circuit are 470uf bypass capacitors on
the 6V6 cathode resistors.  After finishing the assembly, I spent an
evening testing and adjusting the NFB to obtain the best sound that my
ears liked, settling on a 2.4K resistor and 330pf capacitor for the
feedback circuit.  IMHO opinion, the sound improved considerably from
the original version. Smooth and refined tone with an excellent
soundstage. Low cost modification that was well-worth the effort.

https://www.vtadiy.com/home/tube-amplifiers/il-terzo-12ax7-el84/

