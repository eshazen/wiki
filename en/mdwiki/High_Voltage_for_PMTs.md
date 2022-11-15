# High_Voltage_for_PMTs
This page describes a project to develop an inexpensive programmable high-voltage supply system for PMTs.  This is currently generic R&D but may develop into a system used for i.e. Super-Kamiokande or the propose Long Baseline Neutrino Experiment (LBNE) at Homestake.

## Target Specifications

(from LBNE requirements document... take with a grain of salt!)


|Voltage Setting | 1500-2500V | 1V steps | Groups of 16 within 300V range |
|------- ------- | ---------- | -- ----- | ------ -- -- ------ ---- ----- |
|Ripple | <100mV at PMT base | | |
|Voltage Readback | | | |
|Current Readback | | | |

The proposed PMT for LBNE requires no more than 1800V, so a range of 1500V-1800V is surely adequate.
Current requirement is under discussion but likely ~ 100uA per channel.

A modularity of 16 channels with individually adjustable outputs is forseen.

## First Prototype

 * [PMT_HV_Test_Log](PMT_HV_Test_Log.md)
 * [PMT_HV_Test_Software](PMT_HV_Test_Software.md)
 * [PCB Design](http://ohm.bu.edu/~hazen/LBNE/HV_Supply/)
   * [Pico_Tester_ECO_sch.pdf](http://ohm.bu.edu/~hazen/LBNE/HV_Supply/Pico_Tester_ECO_sch.pdf)

This is a test board to characterize the Pico 12VV2 DC/DC converter.  It consists of a two-stage op-amp driver circuit to provide the necessary 0-12V @ 1A maximum input to the Pico, with a choice of feedback options.  Voltage may be set by a pot or external signal.  An SHV connector for the PMT cable and signal coupling capacitor are provided in case we want to connect an actual PMT.

## Candidate Components

 * Pico Electronics [VV series](http://www.picoelectronics.com/dcdclow/pe66_67.htm)
 * Supertex [LR8](http://www.supertex.com/pdf/datasheets/LR8.pdf)
 * ST micro VB408 (discontinued).  See [this circuit](http://www.changpuak.ch/electronics/VB408.html)
  This is a nice idea, but draws way too much standing current for use as-is.

