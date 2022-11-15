# ThermalNeutronDetector
Goto [ThermalNeutronDetector](ThermalNeutronDetector.md) &bull; [PreampDesign](PreampDesign.md) &bull; [NeutronElectronicsDatabase](NeutronElectronicsDatabase.md) &bull; [ElectronicsTestLog](ElectronicsTestLog.md)

This page documents a electronics for a thermal neutron detector being developed for Steve Ahlen starting in Oct 2010.
The ultimate goal is to build a replacement for the existing detector technology based on the now scarce 3He isotope.

The final detector must be 2m x 30cm x 12cm.  It is anticipated that it will use 6Li foils as the active material, with HV wires at < 1200v in a drift chamber configuration for readout.

[ElectronicsTestLog](ElectronicsTestLog.md)


### Prototype II Chamber

 * Wire frame PCB (integrated HV and readout)
   * Schematic &ndash; [SCH](http://ohm.bu.edu/~hazen/Ahlen_Neutron/Proto2/compact_readout.sch)
  [PDF](http://ohm.bu.edu/~hazen/Ahlen_Neutron/Proto2/compact_readout_sch.pdf)
   * Layout &ndash; [PCB](http://ohm.bu.edu/~hazen/Ahlen_Neutron/Proto2/compact_readout.pcb)
  [PDF](http://ohm.bu.edu/~hazen/Ahlen_Neutron/Proto2/compact_readout_pcb.pdf)
  [Mech](http://ohm.bu.edu/~hazen/Ahlen_Neutron/Proto2/COMPACT_READOUT_MECH%20Model%20(1).pdf)


### Prototype I Chamber

 * Mechanics
   * Preliminary drawing &ndash; [PDF](http://ohm.bu.edu/~hazen/Ahlen_Neutron/Proto1/Prototype1_overall_2010-10-19.pdf)
&bull; [DWG](http://ohm.bu.edu/~hazen/Ahlen_Neutron/Proto1/Prototype1_overall_2010-10-19.dwg)
   * [Assembly Cartoon](http://ohm.bu.edu/~hazen/Ahlen_Neutron/AssemblyCartoon.pdf)
   * [Faraday Cage Cartoon](http://ohm.bu.edu/~hazen/Ahlen_Neutron/FaradayCageCartoon.pdf)
 * [Readout_PCB](Readout_PCB.md)
 * [HV_Board](HV_Board.md)
 * [Archive](http://ohm.bu.edu/~hazen/Ahlen_Neutron/Proto1/)

### Electronics

 * [Bill of Materials](https://docs.google.com/spreadsheet/ccc?key=0AoryuXWBXWRNdFR5ZmV2N2xGczk5d0UwQXdyaVRnQmc&usp=sharing)
 * [PreampDesign](PreampDesign.md)
 * [NeutronElectronicsDatabase](NeutronElectronicsDatabase.md)
 * [PreampBatteryPower](PreampBatteryPower.md)
 * [USBReadout](USBReadout.md)
 * [HV_EMCO_Supply](HV_EMCO_Supply.md)
 * [SignalProcessing](SignalProcessing.md)

### Meeting Notes

 * [Thermal_Neutron_Meeting_2010-10-19](Thermal_Neutron_Meeting_2010-10-19.md)
 * [Thermal_Neutron_Meeting_2010-10-12](Thermal_Neutron_Meeting_2010-10-12.md)
 * [Thermal_Neutron_Meeting_2020-10-05](Thermal_Neutron_Meeting_2020-10-05.md)

If the wire pitch is 5mm and we want to readout every wire, then the preamp pitch must match.  This likely implies thin "hybrid-style" preamp boards mounted vertically on a motherboard.

### Documents

 * [Proposal Text](http://ohm.bu.edu/~hazen/Ahlen_Neutron/ARI_Li__2010_proj_descr.pdf)
 * [DRIFT Electronics](http://ohm.bu.edu/cgi-bin/edf/DRIFT_Electronics) page -- see esp [slides](http://joule.bu.edu/~hazen/DRIFT/HazenWireReadout.pdf) and [schematic](http://joule.bu.edu/~hazen/DRIFT/drift_c_sch.pdf)

### Voltage Regulator
 * [+/-5V Regulator](http://ohm.bu.edu/~vryoung/Voltage_Regulator/)

