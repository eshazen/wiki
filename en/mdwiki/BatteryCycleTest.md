# BatteryCycleTest
For nEDM we would like to operate the batteries in a mode where
they discharge (supply load current) for 1000 seconds, and charge
for about 1200 seconds.  To simulate this with batteries we have
on hand, we propose the following:

## PS-1223

This is a 12V 2.3Ah battery.  The [data sheet](http://www.power-sonic.com/site/doc/prod/80.pdf)
a charge procedure:

```
  Cycle Applications: Limit initial current to 690mA. Charge until battery voltage
  (under charge) reaches 14.4 to 14.7 volts at 68°F (20°C). Hold at 14.4 to 14.7
  volts until current drops to under 23mA. Battery is fully charged under these
  conditions, and charger should be disconnected or switched to “float” voltage.

```
Proposed test:

 * Connect battery to bench supply with current limit set to 690mA through series sense resistor
 * Connect supply to AC through solid-state relay
 * Connect load (24 ohm 10W power resistor) to battery through relay
 * Attach a linear temperature sensor to the battery
 * Connect computer DAQ board:
   * Digital outputs to control relays (2)
   * Analog inputs to measure charge current and battery voltage
   * Analog input to measure battery temperature

Write test software to charge battery to 1200 seconds, then discharge for 1000 seconds
in a cycle, monitoring all analog quantities periodically (every 10s?)

## Software
[link to current software](http://ohm.bu.edu/~cdubois/Minor%20programs/Battery_stuff.tar.gz)

