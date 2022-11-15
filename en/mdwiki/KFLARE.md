# KFLARE
This page describes the KFLARE light source, which is essentially a compact two-channel version of the FLARE laser illumination box.
It will control two solid-state lasers using an identical control circuit to the four-channel Laser/TEC module.
It will contain an integrated system controller and interlock logic similar to that used on the full-sized system.
It will provide control for a Dolan-Jenner [LMI-6000](http://www.dolan-jenner.com/Pro/LMI-6000%20Illuminator.htm)

 * [Rev 1 PCB ECO list](https://docs.google.com/document/d/1oACdcJ_lxwMlSCY57ZWgvHj3XM4rmu6al02jB4innSw/edit?usp=sharing)
 * [Test and commissioning log](https://docs.google.com/document/d/1R-zIqDF9r5Z-W31qv6bmz-dTiTBOGQy1cjCjCuIb4aM/edit?usp=sharing)
 * [KFLARE_Operating_Notes](KFLARE_Operating_Notes.md)

 * [PCB Files](http://ohm.bu.edu/~hazen/Frangioni_Public/KFLARE/PCB_Files/)

 * [Layout_Proposal3.pdf](http://ohm.bu.edu/~hazen/Frangioni_Public/KFLARE/Layout_Proposal3.pdf)
 * [2012-11-01_KFLARE_NIR%20SOURCE%20SPECS.doc](http://ohm.bu.edu/~hazen/Frangioni_Public/KFLARE/2012-11-01_KFLARE_NIR%20SOURCE%20SPECS.doc)
 * [Layout_Sketch](http://ohm.bu.edu/~hazen/Frangioni_Public/KFLARE/Layout_Sketch.pdf)
 * [KFLARE_bootloader](KFLARE_bootloader.md)

Design Notes:

 * Output to white light source is 4 bits, _'optically-isolated_ from the system controller.
 * Voltage regulators need a bit of re-work.  Most likely +6/-6 will be supplied and 3 regulators will be needed:
   * +5V digital (fixed positive 1A LDO 5V regulator)
   * +5V analog (fixed positive 0.25A LDO 5V regulator)
   * -5V analog (fixed negative 0.25A LDO 5V regulator)

Suggested connectors:

```

Power input:
  Terminal block, i.e. TE connectivity P/N 284506-8
  Mates with P/N 284512-8 on the PCB

LEDs and interlocks:
  D-Subminiature 9-pin female on PCB (male on cable)

2MM header for power supply controls (2 connectors)
  Molex P/N 87831-0820

Header for WLS encoder output (0.1" 2x5 header)
  TE connectivity P/N 5103308-1

Chassis temperature sensors (0.1" 1x6 header)
  Molex P/N 0022112062

Chassis fan (0.1" 1x3 header)
  Molex P/N 0022112032

Microcontroller ICSP headers (3 total, not wired in box)
  Harting P/N 09185066324

Laser/TEC output (2 total)
  Molex 26-40-4020

Laser fan (2 total)
  Molex P/N 0022112032

Laser thermistor (2 total)
  Molex P/N 0022112032

```


