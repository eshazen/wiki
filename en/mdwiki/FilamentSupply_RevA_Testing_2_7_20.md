# FilamentSupply_RevA_Testing_2_7_20
## Filament Supply Rev A testing 2/7/20

*Setup:* For this test the voltage input of the Filament Supply was connect to the outputs of the LV Mixer and the HV Pulser. The LV Mixer and HV Pulser were operating under normal conditions on a 1khz frequency.

*Measurements:* It is important to remember the clips of oscilloscope connect to Earth Ground. To prevent shorts and unintended damage to the oscilloscope, the clips of both scope probes were attached to the outside of the BNC connectors on the Filament Supply. The outsides of these connectors connect to Earth Ground through the Filament Supply. The lead of Channel 1, yellow, was connected to the top of the load. The Top of the load floats at Vin. The lead of Channel 2, red, was connected to the Bottom of the load. By taking the difference between voltages at Channel 1 and Channel 2 the voltage across the load was measured. This measurement setup was confirmed with a multimeter as well. Whats most important for the behavior of the Filament Supply is that the voltage across the load (proportional to the load current) stays fixed despite the pulsing of the input voltage. This means the measured voltage at the bottom of the load, channel 2, should mirror the shape of the input voltage, channel 1, but at a fixed voltage separation.

## HV Mixer

<a href="http://gauss.bu.edu/svn/tof-system/Gallery/2020-2-7/HVPulser.jpg"><img src="http://gauss.bu.edu/svn/tof-system/Gallery/2020-2-7/HVPulser.jpg" width="15%"></a>
<a href="http://gauss.bu.edu/svn/tof-system/Gallery/2020-2-7/HVFall1.jpg"><img src="http://gauss.bu.edu/svn/tof-system/Gallery/2020-2-7/HVFall1.jpg" width="15%"></a>
<a href="http://gauss.bu.edu/svn/tof-system/Gallery/2020-2-7/HVFall2.jpg"><img src="http://gauss.bu.edu/svn/tof-system/Gallery/2020-2-7/HVFall2.jpg" width="15%"></a>
<a href="http://gauss.bu.edu/svn/tof-system/Gallery/2020-2-7/HVRise1.jpg"><img src="http://gauss.bu.edu/svn/tof-system/Gallery/2020-2-7/HVRise1.jpg" width="15%"></a>
<a href="http://gauss.bu.edu/svn/tof-system/Gallery/2020-2-7/HVRise2.jpg"><img src="http://gauss.bu.edu/svn/tof-system/Gallery/2020-2-7/HVRise2.jpg" width="15%"></a>
[BR](BR.md)These results are not exactly as expected but they may be explainable. For the HV Pulser the ON signal is used as part of the control for the output waveform. In the Firmware used for this test, the ON signal was either fixed HIGH, fixed LOW, or alternating HIGH/LOW. In the expected usage of the HV Pulser this signal goes HIGH before the NEG signal, stays HIGH for some time, goes LOW, then the POS signal goes LOW for one clock and the cycle repeats. In the next round of testing a switch will be used to modify the ON signal to the desired behavior and hopefully that will fix the rise and fall times of this signal. The fluctuation of the Vin coming from the HV Pulser is also assumed to be present because of the absence of a clamping circuit present in the original design of the HV Pulser. For the purposes of these tests the overshoot of Vin doesn't matter so this can be ignored for now. It is also possible that the HV Pulser and Filament Supply are interacting in a negative way but for now I'm assuming these behaviors can be fixed by modifying the Firmware used for testing and eventually adding a clamping circuit to the HV Pulser.

[BR](BR.md)On the bright-side. The bottom of the Load still followed the Vin at a fixed distance which is the desired behavior of the Filament Supply

## LV Mixer

<a href="http://gauss.bu.edu/svn/tof-system/Gallery/2020-2-7/LVMixer.jpg"><img src="http://gauss.bu.edu/svn/tof-system/Gallery/2020-2-7/LVMixer.jpg" width="15%"></a>
<a href="http://gauss.bu.edu/svn/tof-system/Gallery/2020-2-7/LVFall.jpg"><img src="http://gauss.bu.edu/svn/tof-system/Gallery/2020-2-7/LVFall.jpg" width="15%"></a>
<a href="http://gauss.bu.edu/svn/tof-system/Gallery/2020-2-7/LVRise.jpg"><img src="http://gauss.bu.edu/svn/tof-system/Gallery/2020-2-7/LVRise.jpg" width="15%"></a>
[BR](BR.md)This test went exactly as expected. The bottom of the load remained a fixed 2V below the input Voltage despite the pulsing input.
