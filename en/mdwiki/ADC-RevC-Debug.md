# ADC-RevC-Debug
*2017-12-20*

I guess no one has time to write anything down :(

Board 4/90656 is working with DC/DC removed and external 2.3/3.8/5V supplied.
Checking status of various resistors.

 * R160 is 1k (pull-up on SEQ_EN).  This should be redundant with R173 which pulls up to the (now external) 5V

Power up board above and check currents.  With "blinky light" firmware only:

```
  5V:  27mA
3.7V:  1.4A  (250mA before FPGA loads)
2.2V:  200ma
```

*2017-11-08*

After rework of all boards yield is only 2/10 working.

_Mod to force enable of 5V converter:_

 * Cut enable trace.  Under "R" of "R147" legend on back below U17
 * Install pull-up at R161 on back under U11

This should bring up +5V (measure at TP4) at power-up.

_Mod for external 3.7V:_

 * Cut through copper area left of U17.  Cut left of "C" and "R" of legends C61 and R159 on top.
 * Scratch solder mask somewhere in area left of cut and attach external 3.7V wire

_Mod for external 2.2V:_

 * Cut trace at pin 8 of U8 on top (2.2V input to 1V regulator)
 * Cut trace on R pin of R156 on top.
 * Add 1uF capacitor between pins 7 and 8 of U8.

...this is getting too ugly, I give up!

*2017-11-02*

Yield of assembled ADC boards is ~ zero (0/5 work from batch of 8 assembled).

Send all 8 boards back to ABC with new LTM4622A.  They replaced two and sent
them back.  One had the regs rotated 90 degrees :(

Other board (90655) 2.2V works, 3.7V doesn't  Cut copper left of U17
to isolate 3.3V output and cut trace below U17 to disconnect PGOOD outputs.
Install 6.8k in R161.  Solder wires to 3.7V area.  Power up with external 12V and 3.7V supplies,
and now all DC levels look ok.

Idea:  Make a board to supply external voltages as required.
See e.g. TI PTH08080W which provides up to 2.25A at 0.9V to 5.5V with one resistor to set,
plus it's thru-hole.  Or PTH12000WAH which is 6A version.
