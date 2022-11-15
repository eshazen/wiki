# BioSensorProto2Implementation
Back to main [BioCompoundSensor](BioCompoundSensor.md)

This page provides implementation details for Prototype II for the designers.

A sine wave with 16-bit precision will be pre-loaded in a 512-word block RAM on the FPGA.
A programmable *'phase increment* register controls the stimulus frequency.
At the maximum 100Hz frequency, the waveform DAC will be updated from the RAM
at 51.2kHz.  An ADC will measure the current from the reference and active devices
alternately at 51.2kHz, providing a new measurement of each at 25.6kHz.
This will be accomplished by operating the AD7682 ADC in a mode where it takes
samples alternately on two inputs.

As each sample is acquired, it will be multiplied by both the in-phase (sin)
and quadrature (cos) values retrieved from the RAM, and the results added to a 24-bit
accumulator.  Four accumulators are required (reference sin, reference cos, active sin,
active cos).  Once per stimulus cycle (maximum 100Hz) the four accumulators are zeroed
and the four 32-bit values transferred to the microcontroller.

In addition, the raw samples are stored in an additional block ram which may be read
by the microcontroller for diagnostic purposes.

# PCB Documentation
 * [Design Documentation](http://ohm.bu.edu/~pbohn/Bio_Compound_Sensor/Documentation/)
 * [Gerber Files](http://ohm.bu.edu/~pbohn/Bio_Compound_Sensor/Design_Files/Gerber/)
 * Schematic: [bill_sch.pdf](http://ohm.bu.edu/~hazen/BioSensor/Proto2/bill_sch.pdf)
&bull; [Notes](http://ohm.bu.edu/~hazen/BioSensor/Proto2/schematic.txt) &bull; [SchematicRevisions](SchematicRevisions.md)

# Firmware

## Documentation

 * Interface Protocol Specification: [PicoBlazeRequirements_App_6Feb.pdf](http://ohm.bu.edu/~hazen/BioSensor/Proto2/PicoBlazeRequirements_App_6Feb.pdf)
 * List of signals: [FPGA_signals.txt](http://ohm.bu.edu/~hazen/BioSensor/FPGA_signals.txt)
 * BioSensor How to Guide: [bio_howto_2009-04-01.pdf](http://ohm.bu.edu/~pbohn/Bio_Compound_Sensor/Documentation/bio_howto_2009-04-01.pdf)
 * List of registers: [bio_regs_Apr08.pdf](http://ohm.bu.edu/~pbohn/Bio_Compound_Sensor/Documentation/bio_regs_Apr08.pdf)

## Source Code

### Working Code

 * [PicoBlaze_2009-05-01.zip](http://ohm.bu.edu/~hazen/BioSensor/SourceCode/PicoBlaze_2009-05-01.zip)
Working version with one significant known bug in "AC" command (repeats measurements)

### Test Versions

 * ** [BioSensor Firmware](http://ohm.bu.edu/~pbohn/Bio_Compound_Sensor/Design_Files/backup_xilinix/)
 * Firmware for testing the PicoBlaze software
 * BioSensor_pcbv1 [.psm](http://ohm.bu.edu/~hazen/BioSensor/SourceCode/BioSensor_pcbv1.psm) [.vhd](http://ohm.bu.edu/~hazen/BioSensor/SourceCode/BioSensor_pcbv1.vhd)
 * [SoftwareTest_2009-03-11.tar.gz](http://ohm.bu.edu/~hazen/BioSensor/SourceCode/SoftwareTest_2009-03-11.tar.gz)
 * [SoftwareTest_2009-02-11.zip](http://ohm.bu.edu/~hazen/BioSensor/SourceCode/SoftwareTest_2009-02-11.zip)
 * [SoftwareTest_2009-02-11.tar.gz](http://ohm.bu.edu/~hazen/BioSensor/SourceCode/SoftwareTest_2009-02-11.tar.gz)

The FPGA logic (designed by Bill) will provide the following:

 * Interface to 4-output DC bias DAC
 * Interface to 2-output offset cancel DAC (may be combined with above)
 * Waveform BRAM to hold 256-sample 16-bit sinusoidal waveform
 * Logic to drive an AC DAC from above at a programmable rate (1-100Hz waveform rate,
  256Hz-25.6kHz sample rate)
 * Logic to read out at the same sample rate one multiplexed ADC reading
  the AC current waveform(s) measured on the samples.  The ADC will provide
  one or two 16-bit samples (reference and active separately, or the difference).
  The ADC outputs will go to two destinations:
   * 1. Multiply/accumulate logic which will multiply the samples by the sin and cos
  outputs from the waveform generator and accumulate a 24-bit sum.  There will
  be a total of 4 such sums (Active sin, active cos, reference sin, reference cos)
  produced once per cycle and made available to the PicoBlaze
   * 2. A block ram which can hold one complete waveform (256 samples) of 2x16 bits each.
 * A control register with bits for gain select, multiplexer settings and mode selects
 * A status register of some sort

The PicoBlaze interface will be bus-oriented, as described here: [BioDelayGenerator](BioDelayGenerator.md)
except that the address will be expanded to 7 bits.

# PCB Components

 * [DAC7564](http://focus.ti.com/lit/ds/symlink/dac7564.pdf)
 * [DAC7551](http://focus.ti.com/lit/ds/symlink/dac7551.pdf)
 * [TLV5638](http://focus.ti.com/lit/ds/symlink/tlv5638.pdf)
 * [AD7682](http://ohm.bu.edu/~hazen/DataSheets/AD/AD7682_7689.pdf)
 * 8 current-sensitive amplifiers with switchable 10x gain (wired to 4 inputs each on the ADCs)
 * 8 100x gain voltage amplifiers with offset cancel input from DAC
 * A Spartan-3AN FPGA (probably an XC3S50AN-TQ144).
 * An RS-232 interface
 * A crystal oscillator (50MHz?)
 * Voltage regulators to power everything from +4.5, -4.5V from batteries or external power
 * LEDs / buttons
 * Connectors:
   * Carrier PCB (two 12-pin headers)
   * DB-9 for RS-232
   * 2mm round coax jack (or similar) for external power
   * 4-pin Molex for battery power
   * Auxiliary connector (for i.e. LCD character display)

# LCD Display

An LCD display may be added.  We have a Digilent PMOD-CLP [(data sheet)](http://www.digilentinc.com/Data/Products/PMOD-CLP/PmodCLP_rm_RevA.pdf).  This uses the KS0066 controller from Samsung [(data sheet)](http://ohm.bu.edu/~hazen/DataSheets/Samsung/KS0066_datasheet.pdf)
operating in 4-bit mode is available
[here](http://www.aut.bme.hu/VillamosSzakiranyBSc/files/EUKs0066.pdf)


