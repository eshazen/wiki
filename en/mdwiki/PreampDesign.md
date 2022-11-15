# PreampDesign
Goto [ThermalNeutronDetector](ThermalNeutronDetector.md) &bull; [PreampDesign](PreampDesign.md) &bull; [NeutronElectronicsDatabase](NeutronElectronicsDatabase.md) &bull; [ElectronicsTestLog](ElectronicsTestLog.md)

This page describes a low-noise pre-amp for one wire.

## Design

Original Design using SST4117
 * Preamp Schematic &ndash; [SCH](http://ohm.bu.edu/~swd/wire_chamber/preamps/preamp_1c.sch) &bull; [PDF](http://ohm.bu.edu/~swd/wire_chamber/preamps/preamp_1.pdf)
 * Preamp Layout &ndash; [PCB](http://ohm.bu.edu/~hazen/Ahlen_Neutron/Proto1/preamp_b.pcb)
 * <em>Required ECO</em> to fix pre-amp power supply pinout &ndash;  [PDF](http://ohm.bu.edu/~hazen/Ahlen_Neutron/Proto1/preamp_ECO.pdf)

Summing amplifier can be built from a standard PCB as follows:

```
  Install connectors, plus only:
    C2, C8, C10, C12, C13
    U4
    R2, R4, R13, R15, R16

```
```
  Install a wire from J1-1 to U4-2 (solder to pad where R12 goes?)

```
Revised Design &ndash; SST4117 replaced with LMP7721

 * Preamp Schematic &ndash; [SCH](http://ohm.bu.edu/~swd/wire_chamber/preamps/preamp_3.sch) &bull; [PDF](http://ohm.bu.edu/~swd/wire_chamber/preamps/preamp_3.pdf)
 * Preamp Layout &ndash; [PCB](http://ohm.bu.edu/~swd/wire_chamber/preamps/preamp_3a.pcb) &bull; [x4 PCB](http://ohm.bu.edu/~swd/wire_chamber/preamps/preamp_3a_x4.pcb)

Miniaturized low power design

 * Preamp Schematic &ndash; [SCH](http://ohm.bu.edu/~swd/wire_chamber/preamps/preamp_4.sch) &bull; [PDF](http://ohm.bu.edu/~swd/wire_chamber/preamps/preamp_4.pdf)
 * Preamp Layout &ndash; [x8 PCB](http://ohm.bu.edu/~swd/wire_chamber/preamps/preamp_4_vsmall_x8.pcb)
 * Preamp BOM &ndash;  [PDF](http://ohm.bu.edu/~swd/wire_chamber/preamps/mini_preamp_BOM.pdf) &bull; [CSV](http://ohm.bu.edu/~swd/wire_chamber/preamps/mini_preamp_BOM.csv)

Miniaturized summing amp

 * Summing Amp Schematic &ndash; [SCH](http://ohm.bu.edu/~swd/wire_chamber/preamps/summing_amp.sch) &bull; [PDF](http://ohm.bu.edu/~swd/wire_chamber/preamps/summing_amp.pdf)
 * Summing Amp Layout &ndash; [PCB](http://ohm.bu.edu/~swd/wire_chamber/preamps/sum_amp_vsmall.pcb)
 * Summing Amp BOM &ndash;  [PDF](http://ohm.bu.edu/~swd/wire_chamber/preamps/mini_summing_BOM.pdf) &bull; [CSV](http://ohm.bu.edu/~swd/wire_chamber/preamps/mini_summing_BOM.csv)

## Parts Info

The biggest problem is the JFET.  The 2n4117 (SST4117 SMT version) is a unique low input current part
designed for electrometer applications which is going obsolete.  Vishay no longer makes the SMT version;
the thru-hole parts are in stock here and there, but have disappeared from Vishay''s website.

Calogic seems to be an alternative supplier, and still lists the SST4117, though it is not in stock anywhere.

 * [SST4117](http://ohm.bu.edu/~hazen/DataSheets/Vishay/SST4117-Vishay-1.pdf)

We could modify the layout to use the thru-hole part, or see if we have any SST4117 from DRIFT.
Possibly we could substitute 4118 or 4119, though those aren''t much more available.

Another interesting alternative is an op-amp like the LMP7721 or LMC6001.

