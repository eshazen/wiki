# LIDAR_Preamp
### Preamplifier Prototype I

 * PCB Layout and Schematic &ndash; [PCB](http://ohm.bu.edu/~swd/LIDAR/LIDAR_as_built.pcb) &bull; [SCH](http://ohm.bu.edu/~swd/LIDAR/LIDAR_1.sch)
 * Photos of prototype:  [Photo 1](http://ohm.bu.edu/~swd/LIDAR/photos/lidar1.jpg) &bull; [Photo 2](http://ohm.bu.edu/~swd/LIDAR/photos/lidar2.jpg) &bull; [Photo 3](http://ohm.bu.edu/~swd/LIDAR/photos/lidar3.jpg) &bull; [Photo 4](http://ohm.bu.edu/~swd/LIDAR/photos/lidar4.jpg)

Prototype passed a signal, though not without an oscillation at ~350MHz. Pictured is the result of sending a 500mV square wave with a 1ms period and a 10% duty cycle.
 * Oscillation photos:  [Photo 1](http://ohm.bu.edu/~swd/LIDAR/photos/LIDAR_trace_1.jpg) &bull; [Photo 2](http://ohm.bu.edu/~swd/LIDAR/photos/LIDAR_trace_2.jpg)

### Preamplifier Prototype II

 * PCB Layout and Schematic &ndash; [PCB](http://ohm.bu.edu/~swd/LIDAR/LIDAR_4_layer_2.pcb) &bull; [SCH](http://ohm.bu.edu/~swd/LIDAR/LIDAR_2_works.sch) &bull; [PDF](http://ohm.bu.edu/~swd/LIDAR/LIDAR_2_works.pdf)
 * BOM &ndash; [PDF](http://ohm.bu.edu/~swd/LIDAR/LIDAR_BOM.pdf) &bull; [CSV](http://ohm.bu.edu/~swd/LIDAR/LIDAR_BOM.csv)
 * PCB Photos: [Front](http://ohm.bu.edu/~swd/LIDAR/photos/LIDAR_v2_front.jpg) &bull; [Back](http://ohm.bu.edu/~swd/LIDAR/photos/LIDAR_v2_back.jpg)

New PCB layout uses a 4-layer board design, and strictly adheres to board layout suggestions in TI datasheets for both the OPA847 and THS3201. This design does not oscillate. A -200mV DC offset exists when the test pulse cable is connected. If undesirable, can be corrected with a simple offset nulling circuit connected to U1-3 (non-inverting input of OPA847).

Update: 9/26/2011
An oscillation has been discovered at 700MHz with a peak to peak voltage of ~120mV. Removal of the .36pF capacitor (C3) in the feedback loop of the OPA847 solves this problem. Smaller oscillations still exist at ~20mV at close to 100MHz, and are currently being addressed.

Update: 9/28/11
 * Oscillation at ~100MHz with 2nd opamp disconnected (R11 removed)
[pic](http://ohm.bu.edu/~swd/LIDAR/photos/oscillation/100MHz_noR.jpg)

 * R11 changed to 1k
   * 5pF input [pic](http://ohm.bu.edu/~swd/LIDAR/photos/oscillation/R11_1k_5pf_in)
   * 10pF input [pic](http://ohm.bu.edu/~swd/LIDAR/photos/oscillation/R11_1k_10pf_in)

 * 100 ohm resistor was placed in series between the output of the photodiode and input of OPA847 (U1-2).
   * 10pF input [pic](http://ohm.bu.edu/~swd/LIDAR/photos/oscillation/R11_1k_10pf_in1_100_U1_2_.jpg)

 * 100pF bypass capacitor added in parallel to both power supplies
10pF input [pic 1](http://ohm.bu.edu/~swd/LIDAR/photos/oscillation/R11_1k_10pf_in1_100_U1_2_100pf_byp.jpg)
[pic 2](http://ohm.bu.edu/~swd/LIDAR/photos/oscillation/R11_1k_10pf_in1_100_U1_2_100pf_byp1.jpg)
[pic 3](http://ohm.bu.edu/~swd/LIDAR/photos/oscillation/R11_1k_10pf_in1_100_U1_2_100pf_byp2.jpg)

 * R11 changed to 4k - severely decreased oscillation, added 30mV offset.
   * 10pF input [pic](http://ohm.bu.edu/~swd/LIDAR/photos/oscillation/R11_4k_10pf_in1_100_U1_2_100pf_byp.jpg)
   * 10pF input (avg) [pic](http://ohm.bu.edu/~swd/LIDAR/photos/oscillation/R11_4k_10pf_in1_100_U1_2_100pf_byp_avg.jpg)

### CompactPCI Power Board
The CompactPCI Power Board is a two slot wide 6u cPCI backplane that provides ATX power and RS232 breakouts for a single XCalibur 4301 module.
Please note that on the version 1 board the ATX 5VSB is connected to ATX 5V.  This will prevent the ATX power supply from starting up.  Therefore you must not supply the 5VSB to the version 1 board.  It is recommended to cut the 5VSB wire ATX pin 9 purple (see http://en.wikipedia.org/wiki/ATX#Power_supply).  This problem is resolved in version 1.1.


 * [cPCI_backplane_v1.1.dxf](http://ohm.bu.edu/~cjlawlor/LIDAR/cPCI_backplane_v1.1.dxf)
 * [cPCI_backplane_v1.1.zip](http://ohm.bu.edu/~cjlawlor/LIDAR/cPCI_backplane_v1.1.zip)
 * [cPCI_backplane_v1.zip](http://ohm.bu.edu/~cjlawlor/LIDAR/cPCI_backplane_v1.zip)
   * [cPCI_backplane_v1_sch.pdf](http://ohm.bu.edu/~hazen/LIDAR/cPCI_backplane_v1_sch.pdf)
   * [cPCI_backplane_v1_pcb.pdf](http://ohm.bu.edu/~hazen/LIDAR/cPCI_backplane_v1_pcb.pdf)
 * [cPCI_backplane_v1_BOM.xlsx](http://ohm.bu.edu/~cjlawlor/LIDAR/cPCI_backplane_v1_BOM.xlsx)


The original idea was to design a one-slot backplane-like board which would hold two connectors to mate with the J1 and J2 CompactPCI connectors on the processor board to supply power.

 * [Mouser order](http://ohm.bu.edu/~hazen/LIDAR/Mouser_CPCI.pdf)
 * [CompactPCI Draft Standard](http://ohm.bu.edu/~hazen/my_d0/std/cpci20_rev30.pdf)
 * [XCalibur 4301 manual](http://ohm.bu.edu/~hazen/LIDAR/XCalibur4301-TM-C.pdf)
 * [XIt4103-DS.pdf](http://ohm.bu.edu/~cjlawlor/LIDAR/XIt4103-DS.pdf)

### Other Documents

 * [ADC3925 User Manual](http://ohm.bu.edu/~hazen/LIDAR/ADC3295_User_Manual-1_0.pdf)
 * [EVI_ReceiverAmpCircuit.pdf](http://ohm.bu.edu/~hazen/LIDAR/EVI_ReceiverAmpCircuit.pdf)
 * [SBOA122](http://focus.ti.com/lit/an/sboa122/sboa122.pdf)
 * [Photodiode Amplifiers](http://www.national.com/onlineseminar/2004/photodiode/PhotodiodeAmplifers.pdf)
 * [DWEL-1.ods](http://ohm.bu.edu/~hazen/LIDAR/DWEL-1.ods)
 * [G8376](http://jp.hamamatsu.com/resources/products/ssd/pdf/g8376_series_kird1051e05.pdf)
 * [OPA847](http://focus.ti.com/docs/prod/folders/print/opa847.html)
   * [PSPICE model](http://www.ti.com/litv/zip/sboc037a)

### Design Notes

ADC3925 input is 50 ohms, 0dBm full scale (225mV).  10 bits implies 0.2mV or so LSB.

