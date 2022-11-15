# 500MSPS_Prototype
This page describes a possible prototype using the new ADS5463 FADC
operating at (up to) 500MSPS.
Back to [Fast_WFDs](Fast_WFDs.md)

*'Clocking*

The clock input is differential, with self-biasing DC levels.
Best driven with 50% duty cycle, AC-coupled differential input.

Options:
 * 1GHz sine wave on-board oscillator, PECL divide-by-two
 * External 500MHz or 1GHz sine wave input
 * PLL frequency multiplier from (i.e.) 10MHz reference input

 * [Vectron](http://www.vectron.com)
  i.e. [CO-286W](http://www.vectron.com/products/xo/co286w.htm)
   * _'As of 4/5/07:_ CO-286W 2-4pcs 1,620.00ea; 100pcs @ 444.00
12 wks lead time

 * Crystek [CVCS0-914](http://www.crystek.com/vcxo/vcxo-description.htm#CVCSO-914)
  1GHz SAW.  ~$115 at Digi-Key.  Sine output.

*'Analog Input*

The [THS4509](http://focus.ti.com/docs/prod/folders/print/ths4509.html)
looks like a good bet.

