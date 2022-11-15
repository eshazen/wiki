# DOSILabNoteBook
# [Roblyer_dDOS_Undersampling_dSAU](ohm) Lab Notebook

# Problems with Oscillations
28 May 2015: While bringing dDOS fully online in spring 2015, Tim Weber often noticed oscillatory behavior at higher modulation frequencies. Usually this behavior is not hugely deleterious because it is strongest at the highest modulation frequencies, and at those frequencies the signal amplitude (relative to a reference) is strongly attenuated. The effect of which is that those oscillations simply look like noise. However, occasionally we would see spectra like the following:

<img src="http://ohm.bu.edu/trac/edf/raw-attachment/wiki/DOSILabNoteBook/Screen%20Shot%202015-05-28%20at%206.03.07%20PM.png">

When we looked at the amplitudes of each channel, we saw that the reference channel (chA) was behaving erratically, and was probably responsible for the spiking in the amplitude modulation plot shown before.

<img src="http://ohm.bu.edu/trac/edf/raw-attachment/wiki/DOSILabNoteBook/Screen%20Shot%202015-05-28%20at%206.11.40%20PM.png">

Suspecting that there may be something wrong with the DDS, RF coupler, or ADC, we also tried a simple experiment consisting of a single DDS channel, split with the coupler. The coupled end was connected to channel A of the ADC and the output end was connected to channel B. If the system was behaving as intended, we would have seen an constant split ratio (approx 1:7), but instead we see the strong oscillations, especially at the highest frequencies:

<img src="http://ohm.bu.edu/trac/edf/raw-attachment/wiki/DOSILabNoteBook/Screen%20Shot%202015-05-12%20at%203.01.45%20PM.png">

# Debugging Efforts
To locate the root of the problem, Raeef Istfan and Tim Weber will run a series of tests, including:
 * DDS (on dDOS) -> ADC (on dDOS) - visualize time domain and frequency domain for each channel separately
 * DDS -> T -> ADC & ...
   * Open
   * 50 Ω terminator
   * Oscilloscope with high impedance setting
 * DDS -> Oscilloscope
 * Function generator -> ADC


