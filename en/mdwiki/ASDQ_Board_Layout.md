# ASDQ_Board_Layout
ASDQ Board Layout - V2 as built for 2013/2014 test beam

 * [ASDQ-PROTO2.pdf](http://ohm.bu.edu/~hazen/G-2/ASDQ/ASDQ-PROTO2.pdf) Schematic
 * [ASDQv2-DES.zip](http://ohm.bu.edu/~hazen/G-2/ASDQ/ASDQv2-DES.zip)
 * [ASDQv2-FAB.zip](http://ohm.bu.edu/~hazen/G-2/ASDQ/ASDQv2-FAB.zip)


ASDQ Board Layout - As built v1

 * [ASDQv1-DES-SCH.pdf](http://ohm.bu.edu/~hazen/G-2/ASDQ/V1_Build/ASDQv1-DES-SCH.pdf)
 * [ASDQv1-DES](http://ohm.bu.edu/~hazen/G-2/ASDQ/V1_Build/ASDQv1-DES/)
 * [ASDQv1-FAB](http://ohm.bu.edu/~hazen/G-2/ASDQ/V1_Build/ASDQv1-FAB/)
 * Component locations:  [top](http://ohm.bu.edu/~hazen/G-2/ASDQ/asy_top.png) [bottom](http://ohm.bu.edu/~hazen/G-2/ASDQ/asy_bot.png)

ASDQ Board Layout - Older versions for reference

 * [Preview2013-08-09](http://ohm.bu.edu/~hazen/G-2/ASDQ/Preview2013-08-09/)
 * [ASDQ-PROTO1-05-10A.pdf](http://ohm.bu.edu/~hazen/G-2/ASDQ-PROTO1-05-10A.pdf)
 * [ASDQ_16CH_2013-03-29.pdf](http://ohm.bu.edu/~hazen/G-2/Models/ASDQ_16CH_2013-03-29.pdf)
([ASDQ_16CH.DXF](http://ohm.bu.edu/~hazen/G-2/Models/ASDQ_16CH.DXF)
 * [Preview 2013-04-03](http://ohm.bu.edu/~hazen/G-2/ASDQ/Preview2013-04-03/)
 * [Preview 2013-02-15](http://ohm.bu.edu/~hazen/G-2/ASDQ/Preview2013-02-15/)
   * [ASDQ-Proto1.pdf](http://ohm.bu.edu/~hazen/G-2/ASDQ/Preview2013-02-15/ASDQ-Proto1.pdf)
   * [ASDQ_16CH_2013-03-08.pdf](http://ohm.bu.edu/~hazen/G-2/ASDQ/Preview2013-02-15/ASDQ_16CH_2013-03-08.pdf)
   * [ASDQ_16CH.DXF](http://ohm.bu.edu/~hazen/G-2/ASDQ/Preview2013-02-15/ASDQ_16CH.DXF)
   * [ASDQ-PROTO1.DSN](http://ohm.bu.edu/~hazen/G-2/ASDQ/Preview2013-02-15/ASDQ-PROTO1.DSN)
 * [ASDQ Pin List](https://docs.google.com/spreadsheet/ccc?key=0AlkcEtLoMLBZdHF4M3BGUExoeUp1ck5qZlJ1NHJhRHc&usp=sharing)

Notes 2013-08-13:

Component values:

```
R13, R22 = 100
R10, R15, R18, R23 = 4.7k
R44 = 22.1k
R45 = 127k
R14 = 25.5k
R16 = 78.7k
R19 = 26.1k
R17 = 73.2k
C20, C17 and C39 (newly added by me) = 2.2uF
C15,C16,C18,C19,C21,C22,C23,C24 = "0.1uF" to match others
C17,C20,C39 = "1.0uF" to match others
C33, C38, C42, C43, C44, C46, C47, C61, C66, C70, C71, C72, C74, C75, C39, C67 = "470pF 2kV"
J3, J5 = "FTSH-102-04-F-DV-ND"
J6 = "LSHM-130-02.5-F-DV-N"
R26 = 46.4k
R28 = 30.9k
R29 = 12.1k
R30 = 17.8k
R34 = 4.02k
R38 = 2.00k
R39, R40 = 2.40k
R35, R36 = 3.60k
```

Notes 2013-06-18:

 * L1 and L2 must go:  no inductors allowed!
R24, R25, R27, R31-R33 should be 0805 package.

Notes 2013-03-08:

 * R1 should be 0805 package
 * Diodes D1, D2 etc can be BAV99BRLP-7 (2x2mm QFN package).

Notes 2013-02-15:

 * 10V or 16V is fine for the caps, 10% tolerance.  X7R or X5R is fine.
 * 200pF is a typo!  C39 and C67 should be 100pF like the others.
 * For most of the resistors 1% 1/16W is fine.
 * R24, R25, R27, R31, R32 and R33 should be 0.25W at least, 0805 package.
 * J3 and J5 -- suggest Samtec FTSH-102-04-F-DV
 * J2 is for now two thru-hole pads 0.042 dia separated by 0.200

VR for ASDQ power.  Est 300mA for 2xASDQ or 600mA for 4x.  Pick a 1A LDO regulator.
 * Positive options ([TI Positives](http://goo.gl/1Z6of)
   * TPS73701 (leading candidate)
   * LD39150 (ST Micro, looks OK)
   * TPS74001, TPS74201, TPS74301, TPS74801 (all 1.5A)
   * LTC3026 (has 5V boost)
 * Negative options (few!)
   * LT3015 (DD pkg 3mm x 3mm)

