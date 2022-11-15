# HVPulser_RevA_Testing_1_16_20
## HVPulser Rev A testing 1/16/20

*Setup:* The attached photo shows the setup used for testing the HVPulser. The BASYS3 FPGA connects to the ToF Adapter across its onboard PMOD connectors. The ToF adapter board then connects to the HVPulser with a DB15 cable. The ToF Adapter is supplied with +5V, -6V, and +3.3V on an 8 pin mini-fit jr connector, these voltages are also carried across the DB15 to the HVPulser. The ToF Adapter is also supplied with a switching voltage on a 2 pin mini fit jr connector. Nominally this switching voltage is -200V but for this round of testing -20V was supplied.[BR](BR.md)<a href="http://gauss.bu.edu/svn/tof-system/Gallery/2020-01-16/Testing_Setup.jpg"><img src="http://gauss.bu.edu/svn/tof-system/Gallery/2020-01-16/Testing_Setup_small.jpg" width="15%"></a>
 * under these conditions the 5V supply drew ~250mA, the -6V supply drew ~200mA, and the 3.3V supply drew <10mA. No load was placed across the output of the HVPulser so the -20V switching supply drew no current.

*Control Signals:* Using test points on the ToF Adapter the wave forms for the positive end of the HV_pos and HV_neg ECL signals were captured [BR](BR.md)<a href="http://gauss.bu.edu/svn/tof-system/Gallery/2020-01-16/HV_POS+.jpg"><img src="http://gauss.bu.edu/svn/tof-system/Gallery/2020-01-16/HV_POS+_small.jpg" width="15%"></a> <a href="http://gauss.bu.edu/svn/tof-system/Gallery/2020-01-16/HV_NEG+.jpg"><img src="http://gauss.bu.edu/svn/tof-system/Gallery/2020-01-16/HV_NEG+_small.jpg" width="15%"></a>[BR](BR.md)These signals fit the expectations of ECL logic standards.

The HV_pos signal is used to control the High-Gate (connected to output and ground) of the switching circuit and the HV_neg signal is used to control the Low-Gate (connected to output and switching voltage 'nominally -200v') of the switching circuit. When the high gate is on the output swings to ground and when the low gate is on the output swings to the switching voltage. the switching of the HV_pos and hv_neg signals can then be used to swing the output. These two pictures show the control signals displayed above and output waveform to demonstrate this. [BR](BR.md)<a href="http://gauss.bu.edu/svn/tof-system/Gallery/2020-01-16/HV_out_and_pos.jpg"><img src="http://gauss.bu.edu/svn/tof-system/Gallery/2020-01-16/HV_out_and_pos_small.jpg" width="15%"></a> <a href="http://gauss.bu.edu/svn/tof-system/Gallery/2020-01-16/HV_out_and_neg.jpg"><img src="http://gauss.bu.edu/svn/tof-system/Gallery/2020-01-16/HV_out_and_neg_small.jpg" width="15%"></a>

The HV_on signal is used to control a fixed current supply on the HVPulser. The current supply supplies ~3mA but this can be changed by adjusting the value of R14 (resistor connected to collector of NPN Q2). The current can be calculated by dividing 1.5V by the value of R14. The effect of this current supply will be discussed in the output section of this write up.

For this test signals were run at a 1Mhz frequency clock on the FPGA. The HV_on signal was fixed at logic 1. The HV_pos signal was held at logic 0 and set to logic 1 for 1us every 8us. The HV_neg signal was held at logic 1 and set to logic 0 for 1us every 8us. This table demonstrates the test waveform.[BR](BR.md)

|Time (us)|1|2|3|4|5|6|7|8|
|---- ----|-|-|-|-|-|-|-|-|
|HV_on|1|1|1|1|1|1|1|1|
|HV_pos|0|0|0|0|1|0|0|0|
|HV_neg|1|0|1|1|1|1|1|1|

 * Note: the HV_neg signal is inverted. A logic 0 for HV_pos activates the Low-Gate and switches the output to the supply voltage. A logic 1 for HV_pos closes this gate. for sake of clarity here are control truth tables for the signals.[BR](BR.md)

|HV_pos|High Gate|
|------|---- ----|
|0|OFF|
|1|ON|


|HV_neg|Low Gate|
|------|--- ----|
|0|ON|
|1|OFF|


|HV_on|Current Supply|
|-----|------- ------|
|0|OFF|
|1|ON|
 * It is critically important that at no point both gates are active in order to protect the HVPulser PCB from over current. this means *at no point should HV_neg be a logic 0 while HV_pos is a logic 1.* All other conditions are safe.

*Output:* The following wave form was captured from the output of the HVPulser[BR](BR.md)<a href="http://gauss.bu.edu/svn/tof-system/Gallery/2020-01-16/HV_out.jpg"><img src="http://gauss.bu.edu/svn/tof-system/Gallery/2020-01-16/HV_out_small.jpg" width="15%"></a>[BR](BR.md)The output rests at 0V and switches to the supply voltage as expected. During testing the supply voltage was changed from -20V to -30V and the low end of the output moved 1:1 with the supply to -30V. The output was recored with a 100ns rise time and a 50ns fall time.[BR](BR.md) <a href="http://gauss.bu.edu/svn/tof-system/Gallery/2020-01-16/HV_out_rising.jpg"><img src="http://gauss.bu.edu/svn/tof-system/Gallery/2020-01-16/HV_out_rising_small.jpg" width="15%"></a> <a href="http://gauss.bu.edu/svn/tof-system/Gallery/2020-01-16/HV_out_falling.jpg"><img src="http://gauss.bu.edu/svn/tof-system/Gallery/2020-01-16/HV_out_falling_small.jpg" width="15%"></a>
