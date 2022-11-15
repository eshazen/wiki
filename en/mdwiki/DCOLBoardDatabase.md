# DCOLBoardDatabase
## Pre-Production boards

Note that all boards have identical PCB layout.  The first 3 boards
do not have the "silicon circuit breaker" chips but have wire jumpers
which supply constant power to the front-end boards.

First run of 3 boards manufactured in ~ 4/2007.  Serial numbers currently unknown.

## Production Prototypes

Second run of 30 boards manufactured in 2009.
These boards should be identical to production model.
2 board shipped ~ 8/2009 to ANL.  Serial numbers currently unknown.

## Production Boards

Testing begins in January 2010.  Please fill in the table below
with testing dates, results and any notes.

*'6/21/10, esh* -- update database with board location


| *'S/N* | *Binary* | *Date Tested* | *Status* | *Location* | *Notes* |
| ------ | -------- | ----- ------- | -------- | ---------- | ------- |
| 002       | 0000 0010    |    11/29/2010     |  TEST       | ANL |[Shipped_to_ANL_11/29/2010](Shipped_to_ANL_11/29/2010.md)
| 100       | 0110 0100    |    11/16/2010     |    TEST   | ANL |[Shipped_to_ANL_11/29/2010](Shipped_to_ANL_11/29/2010.md)
| 101       | 0110 0101    |    11/29/2010     |    TEST   | ANL |[Shipped_to_ANL_11/29/2010](Shipped_to_ANL_11/29/2010.md)
module insertion problem        |
| 102       | 0110 0110    |    1/14/2010      |    TEST   | ANL? |          |
| 103       | 0110 0111    |    1/15/2010      |    TEST   | ANL? |          |
| 104       | 0110 1000    |    1/15/2010      |    TEST   | ANL? |          |
| 105       | 0110 1001    |    2/4/2010       |    TEST   | ANL? |1/15/2010 Step#24: Address w 0x4000 and w 0x4004
                                                                              Data Reads  0xa5a1a5a1

                                                                              Should Read 0xa5a5a5a5   2/1/2010 DRAM pin 5 closed|
                                                                              ------ ---- ----------   -------- ---- --- - ------|
| 106 | 0110 1010          | 1/21/2010         |    TEST    | ANL? |Step#9: Input 12 failed 1/21 but tested 1/22.|
| 107 | 0110 1011          | 1/22/2010         |    TEST    | ANL? |       |
| 108 | 0110 1100          | 2/4/2010          |    TEST    | ANL? |1/20/2010 Step#9: Inputs 1-4 the meter reads 0V  2/4/2010 replaced Q1 Capacitor|
| 109 | 0110 1101          |    1/21/2010      |    TEST    | ANL? |Failed on 1/15 but found/fixed the solder bridge and retested successfully on 1/21 |
| 110 | 0110 1110          |    1/25/2010      |    TEST    | ANL? |      |
| 111 | 0110 1111          |    1/26/2010      |    TEST    | ANL? | |
| 112 | 0111 0000          |    2/4/2010       |    TEST    | ANL? |1/26/2010  Step#9: Input 6 the meter reads 0V and Step #12 Input 6 fails to read test pattern  2/4/2010 Cold Solder fixed and jumper wire placed 6,7 pin 2 |
| 113 | 0111 0001          |    2/4/2010       |    TEST    | ANL? |1/26/2010 Step#9: Input 2 the meter reads 0V and Step#12 Input 2 fails to read the test pattern  2/1/2010 plated through hole of pin 2 of RJ45 and jumper wire added|
| 114 | 0111 0010          |    1/19/2010      |    TEST    | ANL? |        |
| 115 | 0111 0011          |    2/23/2010       |    TEST   | ANL  |[Shipped_to_ANL_11/2010](Shipped_to_ANL_11/2010.md)
| 116 | 0111 0100          |    1/19/2010      |    TEST    | ANL? |         |
| 117 | 0111 0101          |    2/25/2010       |    TEST   | ANL  |[Shipped_to_ANL_11/2010](Shipped_to_ANL_11/2010.md)
| 118 | 0111 0110          |   11/16/2010        |    TEST  | ANL  |[Shipped_to_ANL_11/2010](Shipped_to_ANL_11/2010.md)
| 119 | 0111 0111          |    1/19/2010      |    TEST    | ANL? |         |
| 120 | 0111 1000          |    2/5/2010       |    TEST    | ANL? |1/26/2010  Step#9: Inputs 9-12 meter reads 0V. Step#12: Input 3 test pattern not changing. Step#24 address 0x4000 and 0x4004 Data reads 0xa5a1a5a1  Should Read 0xa5a5a5a5 2/4/2010  DRAM pin 5 fixed and Q3 replaced |
| 121 | 0111 1001          |    1/20/2010      |    TEST    | ANL? | Failed on 1/20 but found/fixed the solder bridge and retested successfully on 1/25   |
| 122 | 0111 1010          |    1/20/2010      |    TEST    | ANL? |         |
| 123 | 0111 1100          |    1/27/2010      |    TEST    | ANL? |         |
| 124 | 0111 1100          |    2/5/2010       |    TEST    | ANL? |1/27/2010 Step#9 Inputs 1-4 the meter reads 0V Step#12 Inputs 3&9 the test pattern is not changing. 2/4/2010 Solder bridge fixed |
| 125 | 0111 1101          |    2/5/2010       |    FAIL    | BU |[at_BU](at_BU.md)
| 126 | 0111 1110          |    2/5/2010       |    TEST    | ANL? |1/14 test point c40 reads 0V
1/28 replaced part for U2- SPI  FLASH Memory |
| 127 | 0111 1111          |    2/4/2010      |    FAIL    | ANL? |1/14/2010 Step#1:Test point D2 reads 2.1V, C44 reads .013V, C40 reads 0V (D1 is good). 2/4 replaced U18|
| 128 | 1000 0000          |    11/16/2010      |    TEST    | ANL |[Shipped_to_ANL_11/2010](Shipped_to_ANL_11/2010.md)
| 129 | 1000 0001          |    2/5/2010      | FAIL       | BU |[at_BU](at_BU.md)
| 130 | 1000 0010          |    2/25/2010      | TEST      | ANL |[Shipped_to_ANL_11/2010](Shipped_to_ANL_11/2010.md)
| 131 | 1000 0011          |    11/29/2010      | TEST      | ANL |[Shipped_to_ANL_11/29/2010](Shipped_to_ANL_11/29/2010.md)

## DCOL test procedure

Below is Wu''s test procedure with my notes.  I suggest performing steps 0, 1 on a batch
of boards, then moving over to the VME crate for the subsequent tests.

*'Before you start a test session* please send an e-mail to =bucms-users@ohm.bu.edu=
with "using the test stand" or similar in the subject line.
When you are done, send another message indicating that you are done.

### Serial Number and "Smoke Test"

0. Assign serial number to the board.  See table above... pick next available number.
Program the serial number by cutting the traces as shown for the binary number,
as shown in [this document](http://ohm.bu.edu/~hazen/LinearCollider/JumperSetting.pdf)
Note that cutting a trace sets the corresponding bit to ''1'.

Write the serial number clearly on the board with a permanent marker.

1. power up with current limited power supplies and check 5V,3.3V and 2.5V.  Connect
the VME connector carefully to the upper connector (J1) on the board, with the wires towards
the middle of the board.  Ground a multi-meter on one of the front connector shields,
and measure the 5V, 3.3V, 2.5V and 1.2V at the testpoints shown in
[this photo](http://ohm.bu.edu/~hazen/LinearCollider/DCOL_voltage_test_points.jpg)

Each voltage should be within 5% of the specified value.

### VME Crate Programming and Test

Carefully remove the VME connector from the board.

1.5  _'Turn off power_ on VME crate

2. Plug in JTAG cable and install module in VME crate.

2.5  _'Turn power back on_

3. program CPLD and then FPGA with impact from bul3x1.

```
  Connect using $ rdesktop bul3x1.bu.edu
  (log in as user "daq", see me for password)
  start Xilinx Impact tool if not already running
  Load Impact project DCOL_conf.ipf (can be found in c:\iseproj\DCOL)

```
4. Log on to CMS1 (left console in CMS lab)

```
  (log in as user "daq", same password)
  $ cd dcol_test
  $ ./dcol.exe 3            # 3 is VME slot number board is installed in

```
The following steps are commands typed to the prompt ">" with dcol.exe running.

5.  Write default FLASH file)

```
  p dcolv11.mcs 0

```
6. Write test FLASH file.  This installs special firmware for DCOL test

```
  p dcol_test.mcs 1

```
7.  Configure the module to IO test configuration)

```
  w 0x18 0xabcdef01

```
Repeat steps 8-12 for each of the inputs 1..12 on the front panel.

8. Connect test cable:

```
       connect the end with dangling wires to the module top trigger connector.
       connect the dangling wires to a voltage meter in DC range > 5V
       connect the other end to input N, start with N = 1

```
9.  Enable the input to be tested.

```
  w 8 n     (where n is from the table below, i.e. "w 8 0x1001" for input 1)

```
```
  Values for inputs (numbered from top down)
  1 - 0x1001
  2 - 0x1002
  3 - 0x1004
  4 - 0x1008
  5 - 0x1010
  6 - 0x1020
  7 - 0x1040
  8 - 0x1080
  9 - 0x1100
 10 - 0x1200
 11 - 0x1400
 12 - 0x1800
Verify that the meter reads 5V after enabling each input.
```
10.  Reset the module)

```
  w 0 1

```
11.  Start test)

```
  w 0 0x80 (start test)

```
12.  Wait at least 5 seconds(or more)then read the test pattern; do it several times and make sure it is changing all the time.

```
  r 0xc

```
Repeat 8 thru 12 until all twelve inputs are tested. This tests all the DCON connectors'' functionality.
NOTE: after testing input 1 you will need to enter w 8 0 then w 8 n (n from table)for each consecutive input(2-12)

13.  Steps 13 thru 17 tests the spare input signal of the trigger connector, it only needs be done once.

```
  w 4 0x8

```
14.  Replace the cable with the second test cable. Pay attention to connect the labeled end (blue tape)to the trigger (top) connector and the other end to connector 12. Note:Connector 12 is enabled only if it has been tested in Step #11.

15.  Reset the module

```
  w 0 1

```
16.  Start test

```
  w 0 0x80

```
17.  Read test pattern, do it several times and make sure it is changing all the time

```
  r 0xc

```
18.  Make sure bits 23-16 represents the board Serial Number and bits 15-8 are all 0

```
  r 4

```

19.  Configure the module to default configuration

```
  w 0x18 0xabcdef00

```
Wait at least 5 seconds for FPGA to reconfigure before proceeding.

Steps 20 thru 24 checks 64bit VME multiblock read function

20.  Write test values to memory:

```
  w 0x4000 0xa5a5a5a5
  w 0x4004 0xa5a5a5a5
  w 0x4008 0x5a5a5a5a
  w 0x400c 0x5a5a5a5a

```
24.  Check that data read back are the same as written

```
  br 0x4000 4

```
Steps 25 thru 27 checks the SDRAM memory

25.  Reset the module

```
  w 0 1

```
26.  Start memory test

```
  w 0 0x80

```
27.  Read test pattern, do it several times and make sure it is changing all the time

r 0x38

28.  Write both flash sectors with current firmware.  _'Please check with Wu for the latest version._

```
  p dcolv11.mcs 0
  p dcolv11.mcs 1

```
Finally, place a small sticker on the board with a note indicating the board
test status (test/fail), date and your initials.



