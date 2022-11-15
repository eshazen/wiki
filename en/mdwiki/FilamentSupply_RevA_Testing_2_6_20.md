# FilamentSupply_RevA_Testing_2_6_20
## Filament Supply Rev A testing 2/6/20

*Setup:* The attached photos show the setup used for testing the Filament Supply. For this test 120VAC was supplied to the board through a 6-pin Molex connector from a variac. For the first test the BNC used to supply input voltage was capped with a 100ohm resistor to ground. For the other test, the input voltage was supplied across this BNC connector. A 10W resistor was used as a test load.[BR](BR.md)<a href="http://gauss.bu.edu/svn/tof-system/Gallery/2020-01-31/Setup.jpg"><img src="http://gauss.bu.edu/svn/tof-system/Gallery/2020-01-31/Setup.jpg" width="15%"></a><a href="http://gauss.bu.edu/svn/tof-system/Gallery/2020-01-31/Load.jpg"><img src="http://gauss.bu.edu/svn/tof-system/Gallery/2020-01-31/Load.jpg" width="15%"></a>

*Testing:* The purpose of this circuit is to supply a fixed current across a given load with respect to any input voltage. In the application of this circuit the input voltage will be pulsed even to -200V. For this first round of testing the input voltage was slowly ramped up to various voltages (not pulsed). Two key measurements were taken at each input voltage: The voltage across the the load resistor and the voltage across the middle pin of the potentiometer with respect to the top rail of the Filament Supply.

*Different Loads:* Because the Filament supply is designed to be a current regulator, the load current (Iload) should have the exact same linear relationship with the position of the potentiometer (Vpot) regardless of the resistance of the load. To test this characteristic of the Filament supply the potentiometer voltage and load voltage were measured at various positions of the potentiometer for two different load resistances. The following tables and charts were obtained.

1A) Load = 15 Ohm 10 W, Vin = 0V

|Vpot (mv)|Vload (V)|I-load (A)|Ptransistor (W)|
|---- ----|----- ---|------ ---|----------- ---|
|0|.05|0.00|0.04|
|50|1.45|0.10|1.15|
|100|3.00|0.20|2.08|
|150|4.39|0.29|2.63|
|200|5.98|0.40|2.94|
|267|7.95|0.53|2.86|
|308|9.08|0.61|2.58|
|315|9.49|0.63|2.43|
|335|10.04|0.67|2.20|
|340|10.09|0.67|2.18|
|354|10.57|0.70|1.94|
|362|10.85|0.72|1.79|
|374|10.87|0.72|1.78|
|380|10.84|0.72|1.80|
|450|10.84|0.72|1.80|
|520|10.52|0.70|1.97|
|1000|10.52|0.70|1.97|
|1500|10.52|0.70|1.97|

1B) Load = 25 Ohm 10 W, Vin = 0V

|Vpot (mv)|Vload (V)|I-load (A)|Ptransistor (W)|
|---- ----|----- ---|------ ---|----------- ---|
|0|0.08|0.00|0.04|
|18|0.84|0.03|0.42|
|43|2.08|0.08|0.94|
|77|3.80|0.15|1.46|
|117|5.73|0.23|1.75|
|156|7.68|0.31|1.75|
|196|9.65|0.39|1.43|
|209|10.26|0.41|1.27|
|221|10.83|0.43|1.09|
|229|11.28|0.45|0.94|
|230|11.34|0.45|0.91|
|233|11.48|0.46|0.86|
|251|11.40|0.46|0.89|
|267|11.39|0.46|0.89|
|305|11.39|0.46|0.89|
|339|11.40|0.46|0.89|
|382|11.39|0.46|0.89|
|1000|11.40|0.46|0.89|
|1500|11.40|0.46|0.89|
<a href="http://gauss.bu.edu/svn/tof-system/Gallery/2020-02-06/filament.jpg"><img src="http://gauss.bu.edu/svn/tof-system/Gallery/2020-02-06/filament.jpg" width="15%"></a>

These are great results. The position of the potentiometer has the same linear relationship with the load current despite the two load resistances being different by almost a factor of 2.
[BR](BR.md)With all of the data captured above it is possible to write the characteristic i-v relations for the Filament supply.[BR](BR.md)
[BR](BR.md)If Vpot < Vpotmax, Iload(Amps) = Vpot(Volts) x 2
[BR](BR.md)It is important to note that the maximum voltage drop across the terminals of the Filament supply is limited by the maximum voltage being supplied by the Bridge Rectifier after the transformer, the rail voltage of the system). Under resting conditions the rail voltage is about 13V. In the output loop of the Filament supply, voltage is dropped across a sense resistor, the load, and the collector-emitter junction of an NPN transistor. As the load current increases the Voltage dropped across the sense and load increase while the voltage across the collector-emitter junction decreases. At some given load current the voltage across the transistor junction can no longer decrease while drawing the necessary collector current, at this point the load current has reached its top rail and becomes fixed despite and increases in the voltage across the potentiometer. The lower the resistance of the load across the Filament Supply output, the higher this fixed saturation current is. With a sufficiently low resistance load, the maximum load current is set by the maximum voltage across the potentiometer. With a maximum potentiometer voltage of 1.5V, the maximum load current is 3A. Therefore the Filament Supply is rated for regulation of current from 0-3A.


*Notes on Load:* With this Documentation on the Filament load We can get a rough best fit logarithmic estimate for the resistance of the load.[BR](BR.md)
R = 3.69 + 3.48ln(I)
 * [Load Documentation](http://gauss.bu.edu/svn/tof-system/Documentation/Technical_Documentation/101157B1.pdf)
 * [Website](https://keisan.casio.com/exec/system/14059930226691) used to calculate regression

*Different Voltages:* The Filament Supply is also designed to float at input voltages of up to -200V. To test this an input voltage was supplied to the Filament Supply and the same voltage measurements across the load and potentiometer were taken. If the Filament Supply is operating as intended then the measurements should be the same regardless of the input voltage.
[BR](BR.md)2A) Load = 25 Ohm 10 W, Vin = -.8V

|Vpot (mV)|Vload (V)|I-load (A)|Ptransistor (W)|
|---- ----|----- ---|------ ---|----------- ---|
|0.00|0.08|0.00|0.04|
|28.00|1.35|0.05|0.65|
|52.00|2.59|0.10|1.12|
|75.00|3.73|0.15|1.44|
|122.00|5.98|0.24|1.77|
|175.00|8.61|0.34|1.64|
|221.00|10.86|0.43|1.08|
|223.00|10.93|0.44|1.06|
|254.00|11.39|0.46|0.89|
|280.00|11.39|0.46|0.89|
|500.00|11.40|0.46|0.89|
[BR](BR.md)2B) Load = 25 Ohm 10 W, Vin = -5V

|Vpot (mV)|Vload (V)|I-load (A)|Ptransistor (W)|
|---- ----|----- ---|------ ---|----------- ---|
|0.00|0.07|0.00|0.04|
|26.00|1.24|0.05|0.60|
|63.00|3.14|0.13|1.29|
|118.00|5.81|0.23|1.76|
|178.00|8.71|0.35|1.62|
|220.00|10.81|0.43|1.10|
|223.00|10.93|0.44|1.06|
|247.00|11.39|0.46|0.89|
|281.00|11.39|0.46|0.89|
|500.00|11.39|0.46|0.89|
[BR](BR.md)2C) Load = 25 Ohm 10 W, Vin = -10V

|Vpot (mV)|Vload (V)|I-load (A)|Ptransistor (W)|
|---- ----|----- ---|------ ---|----------- ---|
|0.00|0.07|0.00|0.04|
|42.00|2.04|0.08|0.93|
|81.00|3.98|0.16|1.50|
|121.00|5.90|0.24|1.76|
|172.00|8.47|0.34|1.66|
|210.00|10.30|0.41|1.26|
|229.00|11.22|0.45|0.96|
|242.00|11.40|0.46|0.89|
|268.00|11.40|0.46|0.89|
|500.00|11.40|0.46|0.89|
[BR](BR.md)2D) Load = 25 Ohm 10 W, Vin = -15V

|Vpot (mV)|Vload (V)|I-load (A)|Vrail (V)|Ptransistor (W)|
|---- ----|----- ---|------ ---|----- ---|----------- ---|
|0.00|0.07|0.00|13.43|0.04|
|36.00|1.76|0.07|12.89|0.78|
|76.00|3.76|0.15|12.54|1.32|
|119.00|5.86|0.23|12.26|1.49|
|158.00|7.77|0.31|12.04|1.32|
|193.00|9.49|0.38|11.88|0.89|
|208.00|10.24|0.41|11.80|0.62|
|225.00|11.06|0.44|11.73|0.28|
|243.00|11.37|0.45|11.48|0.03|
|259.00|11.39|0.46|11.49|0.02|
|296.00|11.39|0.46|11.50|0.03|
|500.00|11.39|0.46|11.50|0.03|
[BR](BR.md)As expected the relationship between the voltage on the potentiometer and the load current remained fixed at multiple input voltages. The next test of the Filament Supply will be pulsing the input voltage and measuring the response of the Filament Supply.

*Rail Voltage:* While taking voltage measurements on many parts of the board and interesting effect was noted on the rail to rail voltage of the Filament Supply. The rail voltage is measured across the two capacitors across the bridge rectifier on the Filament Supply. These rails float with respect to the input voltage.
[BR](BR.md)3A) Load = 25 Ohm 10W, Vin = 0V

|Vpot (mV)|Vrail (V)|
|---- ----|----- ---|
|0.00|13.45|
|33.00|12.94|
|67.00|12.62|
|107.00|12.32|
|164.00|12.01|
|205.00|11.85|
|214.00|11.79|
|220.00|11.75|
|230.00|11.73|
|266.00|11.48|
|316.00|11.47|
|362.00|11.47|
|500.00|11.47|
[BR](BR.md) As the Voltage across the potentiometer increases, the voltage across the rails of the Filament Supply decreases. This trend also follows the behavior of the load current. At some point, when the load current becomes saturated, the rail voltage also becomes fixed. This behavior does not have a negative impact on the performance and functionality of the Filament Supply but it is worth noting that it impacts the calculation for the power dissipated across the transistor. As the rail voltage decreases, the power through the transistor decreases. For the sake of thermal performance this is actually a good thing as long as the Filament Supply can still supply the necessary load current.

**Note:* For Table 2D the voltage across the rails was measured and the power dissipated by the transistor was calculated with respect to the change in rail voltage. For all other tables, the power dissipated by the transistor was calculated with respect to a fixed 13.4V across the rails of the Filament Supply. The dissipated power varies by less than half a Watt between these two calculations so the assumption is being made that the changing rail voltage can be disregarded.
