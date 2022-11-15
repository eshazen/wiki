# LEDArrayController
(Project on hold as of 1/5/18)

 * Paper: http://ohm.bu.edu/~hazen/LedArray/LED%20array%20and%20controller.pdf

```
My name is Mikel Garcia-Marcos and I am an Associate Professor of
Biochemistry at the medical campus. I am writing to inquire about a
possible project. I would like to recreate something identical or very
similar to what is described in the attached manuscript (scroll down
to "Support Protocol 1: Construction of programmable LED light device"
on page 10 and the related Figure 2 on page 27).


Basically, I would like to build an array of LED lights that fits the
dimensions of a small plate used for culturing cells and that can be
controlled in terms of intensity and duration of "on" and "off"
cycles.
```


## Parts cost / sourcing


|= Qty =|= Item =|= Price Ea=|= Total =|= Link =|
|- --- -|- ---- -|- ----- ---|- ----- -|- ---- -|
| 1 | Arduino Uno | $22.00| $22.00| |
| 1 | !SainSmart LCD / keypad shield | $11.00| $11.00| [link](https://www.sainsmart.com/products/lcd-keypad-shield-for-arduino-duemilanove-uno-mega2560-mega1280) |
| 1 | !BuckBlock Luxdrive LED driver | $18.00| $18.00| [link](https://www.ledsupply.com/led-drivers/buckblock-dc-led-driver?gclid=CjwKCAiA693RBRAwEiwALCc3u3W5YCNsb5PZpmAPolBVqn0dGDXfce29f38SyyW-Y3BnuC8cVgZtMxoCHYoQAvD_BwE) |
| 12 | 470nm LED module | $6.00| $72.00| [link](https://www.luxeonstar.com/470nm) |
| 1 | Power supply 15V 1.5A | $18.00| $18.00| [link](https://www.digikey.com/product-detail/en/cui-inc/SWI24-15-N-P5/102-3629-ND/5415100) e.g. |
| 3 | TIP120 darlington | $0.85| $2.50| [link](https://www.digikey.com/product-detail/en/on-semiconductor/TIP120TU/TIP120TUFS-ND/1052473) e.g. |
| 1 | Other misc parts | $10.00| $10.00| |
| 1 | Custom PC board | $100.00| $100.00| ExpressPCB Miniboard (lot of 3) |
| | Total (est) | | $250.00| |

## Reference

 * Heatsinks:  https://www.luxeonstar.com/130mm-x-70mm-1.5-degree-cw-alpha-heat-sink
 * Thermalloy:  https://www.digikey.com/product-detail/en/aavid-thermalloy/645002F00000G/HS509-ND/6558793
 * Trays:  https://mx.vwr.com/assetsvc/asset/es_MX/id/7830342/contents

The original Arduino software uses analogWrite() to set the intensity.  This is implemented using PWM on the Arduino at 490 or 980 Hz depending on the pins.  6 pins are available so 6 LED groups can be controlled independently (with modifications to the software which currently supports only 3 channels)

A mystery is that in the original design one LED controller is apparently shared by 3 groups of 12 LEDs.  Perhaps only one group is ever on at once?  Need to discuss with the customer.
