# Apollo_Inventory
## Service Module

### Rev 2A
[ Rev2a Inventory](https://github.com/apollo-lhc/Cornell_CM_Rev1_HW/blob/master/Docs/ApolloSM_Rev2a.md)

### Rev 1 (originall Rev A)
[Remote Access Calendar](https://calendar.google.com/calendar/b/1?cid=YnUuZWR1X3Jib2pqNDl2ZWhhbGU0bGdpZ2VxbXNmNTBvQGdyb3VwLmNhbGVuZGFyLmdvb2dsZS5jb20)


[Rev1  Inventory](https://github.com/apollo-lhc/CU_PCB_6089-103/blob/master/Docs/ApolloSM_inventory.md)


ECO_1: Connect J5 pin-14 to 3V3_STBY through any lower 3 pins of J5 (p 2,4,6).

ECO_2: Add a 1k-Ohm resistor between the pad of R40 to GND pin of J12.

## IPMC
Default IP is 192.168.1.34
[Inventory https://github.com/apollo-lhc/Cornell_CM_Rev1_HW/blob/master/Docs/IPMC_Inventory.md ]


## Switch

| ID | Location | History |
| -- | -------- | ------- |
| 21 | BU (Assembly Shelf) | Final in SM009 |
| 22 | BU (Assembly Shelf) | SM001 |
| 23 | BU (Assembly Shelf) | |
| 24 | BU (Assembly Shelf) | Used for special IPMC testing. Final switch in SM 007 |
| 25 | BU (Assembly Shelf) | Final in SM006 |
| 26 | BU (Assembly Shelf) | Final in SM008 |
| 27 | BU (Assembly Shelf) | Assigned to SM004 not installed |
| 28 | BU (Assembly Shelf) | Final in SM010 |
| 29 | BU (Assembly Shelf) | Final in SM002 |
| 30 | BU (Assembly Shelf) | This is the only one missing so I think SM005. |
| 31 | BU | SM-003|
| 32 | BU (Assembly Shelf) | |
| 35 | BU (Assembly Shelf) | |
| 36 | BU (Assembly Shelf) | |
| 37 | BU SM-201 | |
| 38 | BU (Assembly Shelf) | |
| 39 | BU (Assembly Shelf) | |
| 40 | BU (Assembly Shelf) | |
| 41 | BU (Assembly Shelf) | |
| 42 | BU (Assembly Shelf) | |

## FP Board
[OLD_FP_BOARDS](OLD_FP_BOARDS.md)

Rev C

| BU ID | FAB ID | Location | History |
| -- -- | --- -- | -------- | ------- |
| 20 | | SM-10 |  |
| - | 0001 | BU (table) | Button seems to stick. Seems good now. |
| - | 0002 |  BU (Shelf) | SM005 |
| - | 0003 | BU (Bad pile) | |
| - | 0004 | BU (table)  | Zynq does not boot with this. |
| - | 0005 |  BU (Shelf) | SM006  |
| - | 0006 | SM-08 ? | |
| A | | BU (Bad pile) | ? |
| B | | BU (Bad pile) | red and green LEDs light up only once when usb plugged in (should be multiple times). Miniterm does not detect a usb connection. |
| C | | BU (Bad pile) | red LED permanently on. |
| D | | BU (Bad pile) | Zynq does not boot with this. ? Red and green LEDs do not come on and raspberry pi terminal freezes when plugged in. |
| E | | BU (Bad pile) | ? |
| - | | | |
| 101 | 10 | SM02 | UART test passed.  Boot test passed |
| 102 | 02 | Going to CERN | UART test passed. Boot test passed |
| 103 | 03 | Going to CERN | UART test passed. Boot test passed |
| 104 | 04 | | UART test passed. |
| 105 | 05 | | UART test passed. |
| 106 | 06 | | UART test passed. |
| 107 | 07 | | UART test passed. |
| 108 | 08 | | UART test passed. |
| 109 | 09 | | UART test passed. |
| 101 | 01 | | UART test passed. |
| 111 | 11 | | UART test passed. |
| 112 | 12 | | UART test passed. |

## Enclustra


| ID | Type | location | eth0 mac | eth1 mac | history |
| -- | ---- | -------- | ---- --- | ---- --- | ------- |
| SN134522 | 35 | BU (table) | 00-50-51-FF-2X-XX | 00-50-51-FF-1X-XX | was in eval board (in SM001)|
| SN141687 | 35 | Amherst? | 00-50-51-FF-20-07 | 00-50-51-FF-10-07 | Final in SM007 |
| SN141688 | 35 | ?| 00-50-51-FF-2X-XX | 00-50-51-FF-1X-XX ||
| SN144976 | 35 | Cornell? | 00-50-51-FF-2X-XX | 00-50-51-FF-1X-XX | Final in SM009 |
| SN144977 | 35 | Cornell? | 00-50-51-FF-2X-XX | 00-50-51-FF-1X-XX | Final in SM010 |
| SN144978 | 35 |  | 00-50-51-FF-2X-XX | 00-50-51-FF-1X-XX | Test Zynq (6, 8, 2). Assigned to SM006 |
| SN144979 | 35 | BU (Assembly room)  | 00-50-51-FF-2X-XX | 00-50-51-FF-1X-XX | Assigned to SM004. Test Zynq (3, 1). |
| SN144981 | 35 | BU (Assembly Shelf) | 00-50-51-FF-2X-XX | 00-50-51-FF-1X-XX | was in SM-001, dead in eval board....|
| SN141805 | 45 | BU (Shelf) | 00-50-51-FF-2X-XX | 00-50-51-FF-1X-XX | Final in SM002 |
| SN144930 | 45 | BU (Assembly Shelf) | 00-50-51-FF-2X-XX | 00-50-51-FF-1X-XX | Was in Dan's SM-001. |

## MAC/IP address assignment
We use the lower bits to enumerate the Service Modules. The 2 upper bits would describe its IPMC and Zynq ports. This way, looking at the address, we know exactly which board we are talking about.

Another slight change would be to have the other 2 bits of the upper reserved digit as zeros, so it is easier to identify where our address region starts.

Instead of 4k, we would use 16K, like the following:

00-50-51-FF-00-00 to 00-50-51-FF-3F-FF

Or, in more detailes:

00-50-51-FF-YX-XX

XXX: Number of the Service module
Y: IPMC or Zynq ports (00, 01, 10, 11)

For example:

IPMC of the SM1: 00-50-51-FF-00-01
ZYNQ port facing Eth sw of the SM1: 00-50-51-FF-10-01

IPMC of the SM2: 00-50-51-FF-00-02
ZYNQ port facing Eth sw of the SM2: 00-50-51-FF-10-02

IPMC of the SM15: 00-50-51-FF-00-0F
ZYNQ port facing Eth sw of the SM15: 00-50-51-FF-10-0F


## CMS Command Module

Github link with the recent information: https://github.com/apollo-lhc/CU_PCB_6089-103/blob/master/Docs/CM_inventory.xlsx

### Rev A

| # | Location | FPGAs | SM | notes |
| - | -------- | ----- | -- | ----- |
| 1 | PSB | VU7P  | - | for TIF |
| 2 | BU  | KU15P | - | ATLAS? SM? |
| 3 | PSB | VU7P & KU15P | - | |
| 4 | PSB | VU7P & KU15P | - | |
| 5 | BU  | VU7P & KU15P | SM-06 | |
| 6 | BU | KU15P | - | |
| 7 | CERN TIF | VU7P & KU15P | SM-10 | |
| 8 | W231 | VU7P & KU15P | - | |
| 9 | W231 | VU7P & KU15P | - | |
| 10 | BU | KU15P | 02 | |
