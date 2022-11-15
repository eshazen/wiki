# Interconnect_Board
DRIFT digitizer prototype interconnecton board

Back to main [DRIFT_Electronics](DRIFT_Electronics.md)

This is an ExpressPCB "Mini Board" with one Hirose 100 pin connector
and four standard 20 pin ribbon cable headers (0.1" spacing, 2 rows)

### Documentation

 * [Schematic](http://joule.bu.edu/~hazen/DRIFT/digitizer_interconnect_sch.pdf)
 * [PCB layout](http://joule.bu.edu/~hazen/DRIFT/digitizer_interconnect_pcb.pdf)
 * [Pinouts](http://joule.bu.edu/~hazen/DRIFT/s3e_pinout_notes.pdf)
  FPGA signals to digitizer board connections

### Layout Sketch

[image:InterconnectLayout](image:InterconnectLayout.md)

### Power Connector Pinout

Pin 1 is the square pin.  Pins 2 and 3 must be connected together to 3.3V

```
  1   -1.0V
  2   +3.3V
  3   +3.3V
  4   GND

```
### Ribbon cable (20 pin) pinout

```
  1      -1V power (solder hole for wire)
  2      GND
  3      +3.3V power (solder hole for wire)
  4      GND
  5      +1.8V power (solder hole for wire)
  6      GND
  7      SEL1 - individual
  8      COM0 - bussed
  9      SEL2 - individual
  10     SEL4 - individual
  11     SEL3 - individual
  12     COM2 - bussed
  13     TRIG - bussed
  14     COM3 - bussed
  15     DATA - individual
  16     COM1 - bussed
  17     GND
  18     GND
  19     CLK1 - individual
  20     CLK2 - individual

```
### Hirose 100 pin connector pinout

```
  "A" row

```
```
    1-5      n.c.
    6-45     FPGA (use for bussed and individual connections)
    46       GND
    47       n.c.
    48       GND
    49, 50   n.c.

```
```
  "B" row

```
```
    1        n.c.
    2        GND
    3, 4     n.c.
    5-45     GND
    46       n.c.
    47       GND
    48-50    n.c.

```
