# DebugLog
This serves as a log of attempts to debug the 4 Channel ADC prototype board.

\\
### Config Pin Breakout
 Date:: 11 Jul
 Attempted fix:: Move `SCLK`, `SDATA`, `SEN`, and `RESET` off the FMC Connector and to a PMOD (`JZ1`-`4`) so that config signals can be transmitted at 3.3V instead of 1.8V.
 Method:: The change was implemented and firmware was re-synthesized.
 Result:: Upon power up, register data could be read from the PMOD Connector, but the outbound differential pairs reported 0V relative to ground.
\\
### Inductor Replacement
 Date:: 14 Jul
 Attempted fix:: Replace the inductor on the bottom of the board with a 1A fuse.
 Method:: The inductor was removed and a 1A fuse was substituted in its place.
 Result:: Upon power up, the fuse remained intact, but the outbound differential pairs reported 0V relative to ground.
\\
### `SCLK` Timing Adjustment
 Date:: 17 Jul
 Attempted fix:: Change the behavior of `SCLK` to become active only when writing register data to the ADC, instead of `SCLK` being active all the time.
 Method:: The change was implemented and firmware was re-synthesized.
 Result:: Upon power up, `SCLK` was only active when writing register data, but the outbound differential pairs reported 0V relative to ground.
\\
### Config Pin Startup Behavior Adjustment
 Date:: 18 Jul
 Attempted fix:: Change `SCLK` and `SDATA` so they default to HIGH  when not in use, as reflected on the ADC datasheet.
 Method:: The change was implemented and firmware was re-synthesized.
 Result:: Upon power up, `SCLK` and `SDATA` were HIGH when not in use, but the outbound differential pairs reported 0V relative to ground.
\\
### Parallel Configuration Pins
 Date:: 19 Jul
 Attempted fix:: Use parallel config instead of serial config, in case the issue lies with the serial configuration method.
 Method:: `RESET` is tied HIGH, `CFG1` and `CFG2` are tied HIGH, `SCLK` and `SDATA` are tied LOW, and `SEN` is tied HIGH.
          The board was supplied 12V from an adjustable power supply.
 Result:: Upon power up, the outbound differential pairs reported 0V relative to ground.
