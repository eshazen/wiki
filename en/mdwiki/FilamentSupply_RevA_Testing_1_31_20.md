# FilamentSupply_RevA_Testing_1_31_20
## WRONG TRANSISTOR USED!!! IGNORE THIS PAGE


## Filament Supply Rev A testing 1/31/20

*Setup:* The attached photos show the setup used for testing the Filament Supply. For this test 120VAC was supplied to the board through a 6-pin Molex connector from a variac. For the first test the BNC used to supply input voltage was capped with a 100ohm resistor to ground. For the other test, the input voltage was supplied across this BNC connector. A 25ohm 10W resistor was used as a test load.[BR](BR.md)<a href="http://gauss.bu.edu/svn/tof-system/Gallery/2020-01-31/Setup.jpg"><img src="http://gauss.bu.edu/svn/tof-system/Gallery/2020-01-31/Setup.jpg" width="15%"></a><a href="http://gauss.bu.edu/svn/tof-system/Gallery/2020-01-31/Load.jpg"><img src="http://gauss.bu.edu/svn/tof-system/Gallery/2020-01-31/Load.jpg" width="15%"></a>

*Testing:* The purpose of this circuit is to supply a fixed current across a given load with respect to any input voltage. In the application of this circuit the input voltage will be pulsed even to -200V. For this first round of testing the input voltage was slowly ramped up to various voltages (not pulsed). Two key measurements were taken at each input voltage: The voltage across the the load resistor with respect to the input voltage was measured with a multimeter (The positive probe of the multimeter was held at the BNC connector tied to the input voltage.) and the voltage across the sense resistor R14 with respect to the top rail of the bridge rectifier (The positive terminal of the multimeter was held at the top rail). Each measurement was take with the potentiometer in two positions, turned fully Clockwise and turned fully Counter Clock Wise.

*Results:*


|Vin (v)||Load Voltage (V)||Sense Voltage (mV)|
|--- ---||---- ------- ---||----- ------- ----|
| |Clockwise|CCW|Clockwise|CCW|
|Ground|11.4|1.5|-45|-6|
|-.8|11.5|1.95|-45|-7|
|-5|11.5|2.0|-45|-7|
|-10|11.5|2.1|-45|-8|
|-15|11.5|2.1|-45|-8|

These results look good. In the fully Clockwise position the Filament Supply is pushing more than 5 Watts of power across the load and in the fully Counter Clockwise position the power supplied drops to less than 1/5 Watt. It is worth noting that the voltage across the load in the CCW position seems to be slowly creeping up as the input voltage increases. It'll be interesting to see this effect when -200V is supplied.

The next test of the Filament Supply will be pulsing the input voltage and measuring the response of the Filament Supply.

*Notes on Load:* With this Documentation on the Filament load We can get a rough best fit logarithmic estimate for the resistance of the load.[BR](BR.md)
R = 3.69 + 3.48ln(I)
 * [Load Documentation](http://gauss.bu.edu/svn/tof-system/Documentation/Technical_Documentation/101157B1.pdf)
 * [Website](https://keisan.casio.com/exec/system/14059930226691) used to calculate regression
