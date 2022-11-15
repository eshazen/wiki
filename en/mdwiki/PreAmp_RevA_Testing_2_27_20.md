# PreAmp_RevA_Testing_2_27_20
## PreAmp Rev A testing 2/27/20

*Setup:* The attached photo shows the setup used for testing the Pre-Amp. The BASYS3 FPGA connects to the ToF Adapter across its onboard PMOD connectors. The ToF adapter board then connects to the Pre-Amp with a DB9 cable. The ToF Adapter is supplied with +5V, -6V, and +3.3V on an 8 pin mini-fit jr connector, these voltages are also carried across the DB9 to the PreAmp. A signal generator was used to simulate an input from the MCP. Based on the expectations of the MCP, a signal 320ns wide with a peak low voltage of -20mV was used as the input signal. The input signal, boosted signal, and threshold voltage were all measured at test points on the Pre-Amp. The input to the BASYS 3 FPGA was measured directly at the PMOD connector.
[BR](BR.md)<a href="http://gauss.bu.edu/svn/tof-system/Gallery/2020-02-27/Testing_Setup.jpg"><img src="http://gauss.bu.edu/svn/tof-system/Gallery/2020-02-27/Testing_Setup.jpg" width="15%"></a>
 * under these conditions the 5V supply drew ~220mA, the -6V supply drew ~200mA, and the 3.3V supply drew <20mA.

*Results:* As seen in the photos below, the Pre-Amp successfully boosts the input signal with an adjustable gain. In the first image the threshold is below the peak of the boosted signal and the signal peak propagates to the FPGA. In the second image the threshold is set higher than the peak of the boosted signal and the signal peak does not propagate to the FPGA.
[BR](BR.md)<a href="http://gauss.bu.edu/svn/tof-system/Gallery/2020-02-27/ON.jpg"><img src="http://gauss.bu.edu/svn/tof-system/Gallery/2020-02-27/ON.jpg" width="15%"></a>
<a href="http://gauss.bu.edu/svn/tof-system/Gallery/2020-02-27/ON.jpg"><img src="http://gauss.bu.edu/svn/tof-system/Gallery/2020-02-27/ON.jpg" width="15%"></a>
 * Due to the small and variable nature of the input signal from the MCP the setup of the Pre-Amp is important and it is detailed further in [PreAmp_Setup](ohm) page.
