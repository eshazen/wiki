# RoblyerAPDTest
## * _APD Mounting and Amplification Boards_ *

This page contains information on an APD receiver module for the [Roblyer_dDOSI](Roblyer_dDOSI.md) project. This box should allow for easy lab testing of the module with an SMA single-ended 50 ohm output. The Avalanche Photodiode Testing Device mounts either an avalanche photodiode or an APD receiver and outputs the received signal through an SMA jack so that it can be read on a oscilloscope or network analyzer. In the case of the receiver the differential signal from the receiver is converted to an unbalanced signal by a [balun](http://ohm.bu.edu/~tnadov/apda/v2/data/balun.pdf), and in the case of the raw APD the signal is amplified by 40dB. The bias voltage across the APD can regulate with temperature according to the specific properties of the APD and can be set to any value between 0V and 500V.


 * [RoblyerAPDEnclosureDetails](RoblyerAPDEnclosureDetails.md) -- details on various enclosures and wiring.
 * [APDHighVoltageFirmware](APDHighVoltageFirmware.md) programming information

----

## Design Information for Transimpedance Amplifier Rev 3==

### Overview
This is our third revision of the Transimpedance Amplifier board. The only change has been adding a [bias T](http://ohm.bu.edu/~tnadov/apda/v5/data/bias_t.pdf) between the amplifier and the APD. This will address the issue in the last revision that there was no signal path for DC in the APD biasing circuit. Hopefully, it will also remove the non-linearity in the 100MHz range.

### Usage
Insert the APD and apply 300-500V across the high voltage connector and 5V across the power connector. Both HV and power are now connected with polarized clips, so it is no longer possible to insert them incorrectly. Non-conductive tape must be placed over the unused pin receptacles when an APD is inserted to prevent the unused high voltage input pin from shorting to the grounded case of the APD. The mounting holes for standoffs are grounded and will ground the board to any metal case it is mounted in. Size and mounting locations remain consistent for the new revision of the Transimpedance board.

### Layout and schematic

 * [Schematic](http://ohm.bu.edu/~tnadov/apda/v5/design/apda.sch) ([PDF](http://ohm.bu.edu/~tnadov/apda/v5/pdf/apda_sch.pdf))
 * [Layout](http://ohm.bu.edu/~tnadov/apda/v5/design/apda.pcb)  ([PDF](http://ohm.bu.edu/~tnadov/apda/v5/pdf/apda_pcb.pdf))

### Differences from Rev 2

 * Bias T addecd

### Modifications

 * None, yet

### Testing

 * N/A

### Issues

 * Clear high pass filtering attenuating signals under 100MHz

----

## Design Information for Transimpedance Amplifier Rev 2==

### Overview
This is our second revision of the Transimpedance Amplifier board. The only substantial change made was changing the amplifier used from a [MAX3665](http://ohm.bu.edu/~tnadov/apda/v2/data/preamp.pdf) to a [HMC799LP3E](http://ohm.bu.edu/~tnadov/apda/v4/data/preamp.pdf). This new chip has a higher maximum input current and should not suffer from the clipping issues we encountered with the first amplifier.

### Usage
Insert the APD and apply 300-500V across the high voltage connector and 5V across the power connector. Both HV and power are now connected with polarized clips, so it is no longer possible to insert them incorrectly. Non-conductive tape must be placed over the unused pin receptacles when an APD is inserted to prevent the unused high voltage input pin from shorting to the grounded case of the APD. The mounting holes for standoffs are grounded and will ground the board to any metal case it is mounted in. Size and mounting locations remain consistent for the new revision of the Transimpedance board.

### Layout and schematic

 * [Schematic](http://ohm.bu.edu/~tnadov/apda/v4/design/apda.sch) ([PDF](http://ohm.bu.edu/~tnadov/apda/v4/pdf/apda_sch.pdf))
 * [Layout](http://ohm.bu.edu/~tnadov/apda/v4/design/apda.pcb)  ([PDF](http://ohm.bu.edu/~tnadov/apda/v4/pdf/apda_pcb.pdf))

### Differences from Rev 1

 * Amplifier changed
 * New bypass capacitor configuration to match reference design for new amplifier
 * Balun removed as this amplifier has a single ended output
 * Switched output connector from vertical SMA to horizontal SMB
 * Added indicator LED to show when board has power

### Modifications

 * Inductor connecting output of APD to ground to create signal path for DC.

### Testing

 * N/A

### Issues

 * Adding inductor creates results in non-linear region in lower end of measured spectrum

----

## Design Information for GBA Amplifier Rev 3==

## Overview
This is our third revision of the GBA boards. Several layout mistakes have been corrected from the second board. Also, in light of tests with the second revision, an RF shield has been placed over the second stage of the amplifier. Finally two of the bypass capacitors on the high voltage line have been removed, as doing this on the second revision removed a nonlinear phenomena on the low end of the measured spectrum. No change was made to the transimpedance board, as such the extra space on the ExpressPCB miniboard was used for another revision of the VSCEL breakout board with holes large enough for pin receptacles.

### Usage
Insert the APD and apply 300-500V across the high voltage connector and 5V across the power connector. All wires connecting the HVPS board to the APD boards should be plugged in with the arrow on the side over the positive pin with the exception of the polarized clip connector which cannot be plugged in backwards. Non-conductive tape must be placed over the unused pin receptacles when an APD is inserted to prevent the unused high voltage input pin from shorting to the grounded case of the APD. The RF shield can be removed thought there is no reason to; the SMB cable which feeds through it can be easily removed or inserted without removing the shield. The mounting holes for standoffs are grounded and will ground the board to any metal case it is mounted in. Size and mounting locations remain consistent for the new revision of the GBA board.

### Layout and schematic

 * [Schematic](http://ohm.bu.edu/~tnadov/apda/v3/design/apda.sch) ([PDF](http://ohm.bu.edu/~tnadov/apda/v3/pdf/apda_sch.pdf))
 * [Layout](http://ohm.bu.edu/~tnadov/apda/v3/design/apda.pcb)  ([PDF](http://ohm.bu.edu/~tnadov/apda/v3/pdf/apda_pcb.pdf))

### Differences from Rev 2

 * Resistors re-added to the power lines into the GBAs
 * RF Shied added over second stage of amplifier
 * Smaller two bypass capacitors on high voltage line removed
 * Power line is now has a polarized clip in connector
 * Output SMA connector replaced with SMB connector.
 * Grid of through holes between ground planes to improve coupling and reduce inductance.

### Modifications

 * APD is coupled to first stage of amplifier through capacitive coupling

### Testing

 * N/A

### Issues

 * Return of non-linear region in lower end of measured spectrum
 * HV connector is still non-polarized
 * Unmounting board is tedious and necessary for testing various boards or switching APDs

----

## Design Information for GBA Amplifier Rev 2 and Transimpedance Amplifier Rev 1==


### Overview
This is a new revision of the APD mounting boards boards. Compatibility has been kept with first prototypes with regard to mounting hole and connector locations. This revision was made in an attempt to reduce noise in the signal chain for the GBA boards. This was done by replacing the power delivery passives on the board with pre-assembled bias-T blocks. The APD Receiver mounting board has been replaced with a second APD mounting board with a transimpedance amplifier instead of gain blocks.

### Usage
For either of the boards, insert the APD and apply 300-500V across the high voltage connector and 5V across the power connector. All wires connecting the HVPS board to the APD boards should be plugged in with the arrow on the side over the positive pin. Non-conductive tape must be placed over the unused pin receptacles when an APD is inserted to prevent the unused high voltage input pin from shorting to the grounded case of the APD. The mounting holes for standoffs are grounded and will ground the board to any metal case it is mounted in. Size and mounting locations for the receiver mounting board have been maintained on the transimpedance board, and remain consistent for the new revision of the GBA board.


### Layout and schematic

 * [Schematic](http://ohm.bu.edu/~tnadov/apda/v2/design/apda.sch) ([PDF](http://ohm.bu.edu/~tnadov/apda/v2/pdf/apda_sch.pdf))
 * [Layout](http://ohm.bu.edu/~tnadov/apda/v2/design/apda.pcb)  ([PDF](http://ohm.bu.edu/~tnadov/apda/v2/pdf/apda_pcb.pdf))

### Schematic Sketches

 * [Gain Block Amplifier Schematic](http://ohm.bu.edu/~hazen/Roblyer/PreampV2/Preamp_I.jpg)
 * [Transimpedance Amplifier Schematic](http://ohm.bu.edu/~hazen/Roblyer/PreampV2/Preamp_II.jpg)

### Differences from Rev 1

 * Fixed APD footprint mirroring on Gain Block Amplifier board.
 * Replaced L/C on gain block outputs with Mini-Circuits [TCBT-2R5G+](https://www.minicircuits.com/pdfs/TCBT-2R5G+.pdf) integrated Bias-T
 * Added 3 bypass caps in parallel (100pF, .01uF, 1uF) to GND on DC ports of Bias T and also on bias side of APD to reduce noise from power and bias voltages.
 * Board thickness is now 0.8mm (0.031 in). 50 ohm trace widths have been adjusted accordingly.
 * Board II socket is now the same as Board I (APD instead of APD Receiver). A Maxim transimpedance amplifier similar to the one in the receiver has been added to the board for amplification

### Modifications

 * Gain block amplifier Board 1 (GBA1) has had the traces from power to C13 and C16 cut and replaced with two 1/4W through hole 18Ω resistors
 * The power and high voltage connectors on GBA1 have been bent by 90° to prevent the attached power cables from blocking the lid of the large silver enclosure
 * A shield of copper tape has been soldered over the entire signal path of GBA1 to protect it from noise.
 * The sockets for TO-5 compatibility on GBA1 have been removed on the suspicion that they were acting as antennas.
 * Gain block amplifier Board 2 (GBA2) has had the traces from power to C13 and C16 cut and replaced with two surface mount 18Ω resistors.
 * A ring of solder mask on GBA2 has been scraped off surrounding the output and second amplifier. A cylindrical copper tape shield has installed over that ring to prevent the output from transmitting back to the input.

### Testing

 * [APD_Amplifier_Output_Test](APD_Amplifier_Output_Test.md)

### Issues

 * Problematically high oscillation without copper tape shield and 50 resistor to input of first stage
 * Missing 18Ω resistors on power traces
 * Non-linear region in lower range of measured spectrum unless the smaller two HV bypass capacitors are removed.
 * Connectors are too high and make shutting enclosure difficult
 * SMA connector is tedious to unscrew

----

## Design Files for GBA Amplifier Rev 1 and APD Receiver Rev 1==

### Overview
The first of these two boards is for mounting the APD receiver. This board breaks out the pins of the receiver and convert the differential output of the internal amplifier to a single ended signal. The second board mounts an APD and provides 40dB of gain on its output signal with two 20dB gain block amplifiers.

### Usage
Insert the APD and apply 300-500V across the high voltage connector and the power voltage across the power connector(3.3V for the APD Receiver board, 5V for the GBA board). All wires connecting the HVPS board to the APD boards should be plugged in with the arrow on the side over the positive pin with the exception of the polarized clip connector which cannot be plugged in backwards. Non-conductive tape must be placed over the unused pin receptacles of the GBA board when an APD is inserted to prevent the unused high voltage input pin from shorting to the grounded case of the APD.

### Layout and schematic

 * [Schematic](http://ohm.bu.edu/~tnadov/apda/v1/design/apda.sch) ([PDF](http://ohm.bu.edu/~tnadov/apda/v1/pdf/apda_sch.pdf))
 * [Layout](http://ohm.bu.edu/~tnadov/apda/v1/design/apda.pcb) ([PDF](http://ohm.bu.edu/~tnadov/apda/v1/pdf/apda_pcb.pdf))

### Modifications

 * There is a via under C10 that has been drilled out.
 * R4 does not connect to ground, resistor has a small wire connecting it to the ground plane.
 * The socket on the APD preamplifier board is backwards.
 * The four mounting holes on the preamp board have been manually connected to the ground plane on the board.

### Testing

 * N/A

### Issues

 * High noise on both boards
 * via under C10 connecting it to ground
 * No thermal pad to ground at R4 keeping it from connecting to ground
 * backwards socket for APD
 * connectors can be plugged in backwards and interfere with shutting enclosure

----

## Design Information for HV Supply Board==

### Overview
The HV supply board provides a programmable 0-500V biasing voltage from a high gain voltage converter. It is controlled by a [ATTINY87](http://ohm.bu.edu/~tnadov/hvps/v1/data/attiny87.pdf) microcontroller that receives commands over UART from a USB connection and sets the output of a SPI DAC using a simple control loop.

### Usage
To use this board, first connect it to a PC with a microUSB cable and to a 6V power supply. Instructions and commands for communicating with the microcontroller can be found in the [APDHighVoltageFirmware](APDHighVoltageFirmware.md)  programming information. The board will produce a HV bias at its output.

### Layout and schematic

 * [Schematic](http://ohm.bu.edu/~tnadov/hvps/v1/design/HVPS.sch)
 * [Layout](http://ohm.bu.edu/~tnadov/hvps/v1/design/HVPS.pcb)

### Modifications

 * 3 pin 5V breakout soldered to bottom side of the board for powering the APD boards
 * Transistor was wired backwards on PCB, traces to it have been cut and resoldered to the correct configuration
 * High voltage supply outputs have been crossed
 * Jumper on the FTDI chip has been removed completely
 * 5V wire connected to VCCIO on the FTDI chip
 * Power supply is routed backwards, wires in the wall power supply have been crossed to address this
 * 10K resistor on the reset line has been removed and shorted
 * Trace leading to the 3.3V output pin on the FTDI chip has been cut
 * 2M resistor on voltage divider from high voltage line replaced with 200K resistor
 * Two holes drilled beneath the power jack connector so that it can fit onto the board
 * The CKDIV8 fuse on the attiny87 has been set to off
 * There is a 2 pin 100 mil spaced header near the power jack that can be used as an alternate method for providing 6V to the board.

### Testing

 * N/A

### Issues

 * Transistor was wired backwards
 * HV output was backwards
 * FTDI chip was trying to power the board
 * Power supply was routed backwards
 * 10k resistor on reset line was inhibiting programming
 * Missing holes underneath the power jack to allow it to be soldered on flush with the board
 * Difficult to power by batteries
 * Very large time constant on HV output
 * ATTINY87 is very non-standard and not supported well
 * Connectors interfere with shutting the box and can be plugged in backwards

----

## Datasheet Index

### GBA Board v3

 * [Hittite HMC478MP86](http://ohm.bu.edu/~tnadov/apda/v3/data/gba.pdf)
 * [Bias-T Junction](http://ohm.bu.edu/~tnadov/apda/v3/data/bias_t.pdf)
 * [SMB Coaxial plug (dimensions)](http://ohm.bu.edu/~tnadov/apda/v3/data/smb.pdf)
 * [RF Shield (dimensions)](http://ohm.bu.edu/~tnadov/apda/v3/data/shield.pdf)
 * [RF Shield Base (dimensions)](http://ohm.bu.edu/~tnadov/apda/v3/data/shield_base.pdf)

### GBA Board v2

 * [SMA Coaxial plug (dimensions)](http://ohm.bu.edu/~tnadov/apda/v2/data/sma.pdf)
 * [Hittite HMC478MP86](http://ohm.bu.edu/~tnadov/apda/v2/data/gba.pdf)
 * [Bias-T Junction](http://ohm.bu.edu/~tnadov/apda/v2/data/biast.pdf)

### GBA Board v1

 * [SMA Coaxial plug (dimensions)](http://ohm.bu.edu/~tnadov/apda/v1/data/sma.pdf)
 * [Hittite HMC478MP86](http://ohm.bu.edu/~tnadov/apda/v1/data/gba.pdf)

### Transimpedance Board v2

 * [Hittite Transimpedance Preamplifier](http://ohm.bu.edu/~tnadov/apda/v4/data/preamp.pdf)
 * [SMB Coaxial plug (dimensions)](http://ohm.bu.edu/~tnadov/apda/v4/data/smb.pdf)

### Transimpedance Board v1

 * [RF Transformer](http://ohm.bu.edu/~tnadov/apda/v2/data/balun.pdf)
 * [SMA Coaxial plug (dimensions)](http://ohm.bu.edu/~tnadov/apda/v2/data/sma.pdf)
 * [Maxim Transimpedance Preamplifier](http://ohm.bu.edu/~tnadov/apda/v2/data/preamp.pdf)

### APD Receiver Board v1

 * [APD receiver](http://ohm.bu.edu/~tnadov/apda/v1/data/apd/APD_reciever.pdf)
 * [RF Transformer](http://ohm.bu.edu/~tnadov/apda/v1/data/balun.pdf)
 * [SMA Coaxial plug (dimensions)](http://ohm.bu.edu/~tnadov/apda/v1/data/sma.pdf)

### High Voltage Power Supply Board

 * [ATTINY87 Microcontroller](http://ohm.bu.edu/~tnadov/hvps/v1/data/attiny87.pdf)
 * [AVR programming cable](http://ohm.bu.edu/~tnadov/hvps/v1/data/AVR_programmer.png)
 * [MCP4921 DAC](http://ohm.bu.edu/~tnadov/hvps/v1/data/DAC.pdf)
 * [Q05-5 DC/HVDC Converter](http://ohm.bu.edu/~tnadov/hvps/v1/data/DC_HVDC_converter.pdf)
 * [Wall Plug Power Supply](http://ohm.bu.edu/~tnadov/hvps/v1/data/6_W_wall_plug.pdf)
 * [Barrel Jack Plug](http://ohm.bu.edu/~tnadov/hvps/v1/data/SMT_connector.pdf)
 * [FTDI Breakout Board Layout](http://ohm.bu.edu/~tnadov/hvps/v1/data/FTDI_breakout.pdf)
 * [BHS103 N-MOSFET](http://ohm.bu.edu/~tnadov/hvps/v1/data/transistor.pdf)

## Diodes

 * [SAR 1500H4 Photodiode](http://ohm.bu.edu/~tnadov/apda/v2/data/apd/APD_1500-3000.pdf)
 * [S6045 Series](http://ohm.bu.edu/~tnadov/apda/v2/data/apd/APD_S6045.pdf)
 * [S8890 Series](http://ohm.bu.edu/~tnadov/apda/v2/data/apd/APD_s8890.pdf)
 * [S11519 Series](http://ohm.bu.edu/~tnadov/apda/v2/data/apd/APD_s11519.pdf)

### App Notes, Etc

 * [ANE03](http://www.eoc-inc.com/femto/ane03.pdf) "DC Path for Fast Photodetectors"


