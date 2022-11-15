# OpticalTweezers
This is a project to develop a simple test stand for DDS boards for the Kamenetska lab for use in their optical tweezers system.  Contact:  Brian Dawes

 * Git (tester): https://gitlab.com/eshazen/ad9852-tester
 * Git (PCB): https://github.com/kamenetska-lab/DDS-PCB-Design

## Hardware

We propose to use a re-purposed Apollo CM Test mezzanine to test the boards.

 * https://gitlab.com/BU-EDF/edf-projects/apollocm/templatecm/-/tree/main/Mezzanine_Board

## Firmware

 * Git: https://gitlab.com/eshazen/ad9852-tester/-/tree/main/firmware

There now exists a 'ddstest' program which in principle allows read/write of the DDS registers.  This is not tested!  There were a few soldering problems on the board which I spent the afternoon debugging.

## Signal list

```
DDS Pin  Tester pin  uC Pin
-------  ----------  ------
MRESET   PWR_GOOD    PD0
OSK      TMS         PD1
PMODE    TDO         PD2
RDB      TX_IPMC     PD3
WRB      TX_ZYNQ     PD4
I/O UD   SENSE_SDA   PD5
A0       PWR_EN      PD6
A1       FPGA_GPIO0  PD7
A2       FPGA_GPIO1  PC0
A3       FPGA_GPIO2  PC1
A4       CPLD_GPIO0  PC2
A5       CPLD_GPIO1  PC3
D0       EN          PC4
D1	 TCK         PC5
D2	 TDI         PC6
D3	 RX_IPMC     PC7
D4	 RX_ZYNQ     PF7
D5	 SENSE_SCL   PF6
D6	 MON_RX      PF5
D7	 PS_RST      PF4
```
