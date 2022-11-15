# EDFBox
Here's a proposal for an inexpensive box with analog and digital I/O and a water-resistant case and display.

Functions:

 * Arduino shield
 * 2x16 or so character LCD
 * Small set of buttons (6-8)
 * Shaft encoder knob
 * DAC and ADC (higher quality than built-in ones)

Note that this is "almost" the ubiquitous "LCD keypad shield" but slightly re-imagined for easy mount on a flat panel, and using more robust  weather-proof switches.

Parts!

 * 800AWSP9VS2QE switch
 * 800AC1BLKCAP cap (black) or 800AC2REDCAP (red)
 * MOP-AL162A-BYFY-25J-3IN - LCD display
 * PEC11R-4220K-S0024 - rotary encoder w/ switch
 * MAX5214/5216 DAC - SPI DAC 14/16 bits buffered rail-to-rail (external reference) 5V supply - drive 10k load
 * MAX11101 ADC - SPI 14-bit SAR 5V supply
 * MAX9615 - rail-to-rail op-amp 10mA output
