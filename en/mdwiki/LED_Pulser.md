# LED_Pulser
This is an LED driver which is designed to provide a fast current pulse, adjustable
from about 0-70mA and 0-50ns with fast (sub-ns) risetime to drive an LED.

The pulser is composed of two separate units.  A control box mounted in an aluminum
enclosure accepts an input trigger pulse, and provides adjustments for output current
and pulse width.  A small driver board which drives the LED is connected by two cables
(one BNC and one RJ-45 network-type cable) to the control unit.  The driver PCB would
typically be mounted inside a dark box with a photo-detector.

# Updated Documentation Feb 2013

 * [User Manual](http://ohm.bu.edu/~hazen/LED_Pulser/LEDPulserUserManual.pdf)
 * Control Box
   * Schematic: [SCH](http://ohm.bu.edu/~hazen/LED_Pulser/2013/LED_Control_Box.sch) &bull; [PDF](http://ohm.bu.edu/~hazen/LED_Pulser/2013/LED_Control_Box_sch.pdf)
   * PCB layout: [PCB](http://ohm.bu.edu/~hazen/LED_Pulser/2013/LED_Control_Box.pcb) &bull; [PDF](http://ohm.bu.edu/~hazen/LED_Pulser/2013/LED_Control_Box_pcb.pdf)
   * Bill of Materials: [XLS](http://ohm.bu.edu/~hazen/LED_Pulser/2013/Control_Box_BOM.xls)
   * Box Design:  [Final Front Panel Designs](http://ohm.bu.edu/~hazen/LED_Pulser/2013/Final%20Front%20Panel%20Designs/)

 * Driver Board
   * Schematic: [SCH](http://ohm.bu.edu/~hazen/LED_Pulser/2013/LED_Driver.sch) &bull; [PDF](http://ohm.bu.edu/~hazen/LED_Pulser/2013/LED_Driver_sch.pdf)
   * PCB layout: [PCB](http://ohm.bu.edu/~hazen/LED_Pulser/2013/LED_Driver_Panelized.pcb) &ndash; [PDF](http://ohm.bu.edu/~hazen/LED_Pulser/2013/LED_Driver_Panelized_pcb.pdf)
   * Bill of Materials: [XLS](http://ohm.bu.edu/~hazen/LED_Pulser/2013/Driver_Board_BOM.xls)

# Current inventory

Link to google spreadsheet of current inventory [GoogleDoc](https://docs.google.com/spreadsheet/ccc?key=0Avc95PUpsvSidDZEQXVlNlZ4bTlnYUNsV2NQSXhCS3c&hl=en_US#gid=0)

# Sets Shipped

The following complete sets were shipped on 10/5/2011:

 * Set1: LED Pulser #4; LED Pulse Generator #4; Box #4; Power Supply; RJ45 Cable; BNC Cable
 * Set2: LED Pulser #2; LED Pulse Generator #3; Box #3; Power Supply, RJ45 Cable; BNC Cable

# Version 2.1

Design slightly revised; juxtapose R8 and R9 on the LED Driver Board and replace R13 with 820 ohm in parallel with 10k ohm
&ndash; [ExpressPCB](http://ohm.bu.edu/~genews/led_pulser/LED_PulserDriver_10.21.11.sch)

Design revised; removed R14
&ndash; [ExpressPCB](http://ohm.bu.edu/~genews/led_pulser/LED.Pulser.10.21.11.sch)

# Version 2

Design revised in April 2011.  This version is essentially the same as Version 1 but with ECOs taken care of.

### LED Driver Board ==

 * Bill of Materials &ndash; [Google Doc](https://spreadsheets.google.com/ccc?key=0AsqOrxRlvdC9dHkwVmlFTHpBbXh2QzFXUjZPVmcxUFE&hl=en&authkey=CMjB32E)
[XLS backup](http://ohm.bu.edu/~hazen/LED_Pulser/Mark2/LED_Pulser_Driver_BOM.xls) &bull; [Assembly Pro Forma](http://ohm.bu.edu/~cjlawlor/LED_PulserMark2/LED_Pulser_Driver_BOM_Assembly_ProForma.xls)
 * Schematic &ndash; [ExpressPCB](http://ohm.bu.edu/~hazen/LED_Pulser/Mark2/LED_PulserDriver_4.15.11.sch)
[PDF](http://ohm.bu.edu/~hazen/LED_Pulser/Mark2/LED_Pulser_Driver_RevB_sch.pdf)
 * PCB Layout &ndash;
[ExpressPCB](http://ohm.bu.edu/~hazen/LED_Pulser/Mark2/LED_PulserDriver_4.15.11.pcb)
[PDF](http://ohm.bu.edu/~hazen/LED_Pulser/Mark2/LED_Pulser_Driver_RevB_layout.pdf)


### Pulse Generator Board ==

 * Bill of Materials &ndash; [Google Doc](https://spreadsheets.google.com/ccc?key=0AsqOrxRlvdC9dFRxcU80WklrM2VoTXVtNXh4ZFY3RWc&hl=en&authkey=CP_ypuEM)
[XLS backup](http://ohm.bu.edu/~hazen/LED_Pulser/Mark2/Driver_BOM.xls) (this file is named wrong!) &bull; [Assembly Pro Forma](http://ohm.bu.edu/~cjlawlor/LED_PulserMark2/PULSer_BOM_Assembly_ProForma.xlsx)
 * Schematic &ndash; [ExpressPCB](http://ohm.bu.edu/~hazen/LED_Pulser/Mark2/LED.Pulser.4.13.11sch.sch)
[PDF](http://ohm.bu.edu/~hazen/LED_Pulser/Mark2/LED_Pulser_RevF_sch.pdf)
 * PCB Layout &ndash; [ExpressPCB](http://ohm.bu.edu/~hazen/LED_Pulser/Mark2/LED.Pulser.4.13.11_Edit.pcb)
[PDF](http://ohm.bu.edu/~hazen/LED_Pulser/Mark2/LED_pulser_RevF_layout.pdf)

Or see the [Design Files](http://ohm.bu.edu/~hazen/LED_Pulser/Mark2/)

# LEDs

The following P/N high-brightness blue LEDs have been suggested:  L53NBC, L7113NBC, NSPB500S, NSPB300S.
(We have not yet tested any of these).

# Version 1

See some [photos](http://ohm.bu.edu/~hazen/LED_Pulser/photos/)

## Pulse Generator Board

 * ExpressPCB design files &ndash; [Schematic](http://ohm.bu.edu/~hazen/LED_Pulser/LED_Pulser.sch) &bull; [PCB Layout](http://ohm.bu.edu/~hazen/LED_Pulser/LED_Pulser.pcb)
 * Documentation files &ndash; [Schematic (pdf)](http://ohm.bu.edu/~hazen/LED_Pulser/LED_Pulser_sch.pdf) &bull; [BOM (csv)](http://ohm.bu.edu/~hazen/LED_Pulser/LED_Pulser_BOM.csv) &bull; [BOM (ods)](http://ohm.bu.edu/~hazen/LED_Pulser/LED_Pulser_BOM.ods)
 * An ECO needs to be created for this board (11-12-09)

## LED Driver Board

 * ExpressPCB LED Driver Board &ndash; [Schematic](http://ohm.bu.edu/~pbohn/LED-PULSER/Design_Files/LED.Pulser.sch) &bull; [PCB Layout](http://ohm.bu.edu/~pbohn/LED-PULSER/Design_Files/LED.Pulser.pcb) &bull; [BOM (ods)](http://ohm.bu.edu/~hazen/LED_Pulser/Driver_BOM.ods)
 * Documentation files &ndash; [Schematic (pdf)](http://ohm.bu.edu/~hazen/LED_Pulser/LED_Driver_RevE.pdf)




## Enclosure

The LED Pulser Driver PCB will be housed in a Front Panel Express Enclosure.  [See: side profile 2](http://www.frontpanelexpress.com/en/enclosures/side-profiles.html)

 * [Enclosure Drawing](http://ohm.bu.edu/~pbohn/LED-PULSER/Drawings/led_pulser_enclosure.dwg)
 * [Front Panel Express Enclosure Design Files](http://ohm.bu.edu/~eob/LED_Pulser)
 * [Updated Enclosure Side Panel](http://ohm.bu.edu/~pbohn/LED-PULSER/Drawings/pulser_sidepanel.zip)
 * [Front Panel Express Enclosure Manual](http://ohm.bu.edu/~pbohn/LED-PULSER/Data_Sheets/Enclosure-Manual-2008.pdf)

