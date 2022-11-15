# DosiRackMountHardwareDebug
## ADC ECO List

 * Change R25 to 20k
 * Connect `PWR_EN` to `VADJ`

*2018-04-12*

 * `PWR_EN` not driven on ADC board.  Trace accessible on bottom layer.
   * Input V:  TPS54428 1.6V - 18V.  LP3874 2 - 7V.
   * So, can use `VAdj`.

Power up.  Draws around 220mA on 12V.  All voltages OK except 6V is about 5V.

Looking at R24/R25.  It's wrong, programmed for 5V.  To fix, replace R25 with 19.4k (20k is ok).

On proto, put 100k in series with R25.
