# WFDBatteryPowerTest
This page describes a test battery power system for a CAEN VME WFD (i.e. V1724).
See [TWiki page](https://nedm.bu.edu/twiki/bin/view/Main/BatteryRegulatorCircuits)

## Documents

 * Current Power Supply Schematic &ndash;  [ExpressSCH](http://ohm.bu.edu/~eob/WFD_Battery_Test.sch)
 * Power Supply Bill Of Materials [(Google Spreadsheet)](https://spreadsheets.google.com/ccc?key=tbRC2EzND5jvA2t97cLVXLw&hl=en) [(csv)](http://spreadsheets.google.com/pub?key=tbRC2EzND5jvA2t97cLVXLw&single=true&gid=0&output=csv)
 * [Design Description Google Document](http://docs.google.com/Doc?docid=0AVkcEtLoMLBZZGQ1aG5mN2pfMjNjejV6Mjlkcw&hl=en)
 * Proposed power supply schematic &ndash; [PDF](http://ohm.bu.edu/~hazen/nEDM/WFD_Battery_Test.pdf) &bull; [ExpressPCB](http://ohm.bu.edu/~hazen/nEDM/WFD_Battery_Test.sch)


## Basic Specs

 * Provide +5V at 4.5A, -12V at 0.2A and +12V at 0.2A from batteries for 2-3 hours.
 * Provide a shielded enclosure to hold one VME module, with an appropriate (separate?) enclosure for
the batteries
 * AC-powered charger for the batteries

Suggest starting with a 6V battery (i.e Power-sonic [PS-6580](http://www.power-sonic.com/site/doc/prod/78.pdf) battery, and using an LDO regulator built with i.e. LT1575 controller and i.e. IRL3303 HEXFET.  See [Linear Tech App note 69](http://ohm.bu.edu/~hazen/DataSheets/LinearTech/AppNote69.pdf)

The +/-12V could come directly from power-sonic PS-1223 (2.3AH 12V) batteries.

Charging notes on PS-6580:

*'Cycle Applications*: Limit initial current to 17.4A. Charge until battery voltage
(under charge) reaches 7.20 to 7.35 volts at 68°F (20°C). Hold at 7.20 to 7.35
volts until current drops to under 580mA. Battery is fully charged under these
conditions, and charger should be disconnected or switched to “float” voltage.

“Float” or “Stand-By” Service: Hold battery across constant voltage source of
6.75 to 6.90 volts continuously. When held at this voltage, the battery will seek its
own current level and maintain itself in a fully charged condition.


## Related Battery Web Links
 * [Smart Gauge](http://www.smartgauge.co.uk/)
 * [Comparing Marine Battery Technologies](http://www.vonwentzel.net/Battery/)
 * [Jerome Industries](http://www.jeromeindustries.com/SealedLA.htm)






