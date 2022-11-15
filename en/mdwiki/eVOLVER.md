# eVOLVER
This page describes the eVOLVER system being developed for the Kahlil lab in BME.

## Design Updates (2020)

 * [MotorDriverBoard](MotorDriverBoard.md) -- proposed H-Bridge board to drive bidirectional DC motors

## Updated Designs (2018)

 * Schematics:
   * [Motherboard](http://gauss.bu.edu/svn/evolver-system/Hardware/Motherboard/tags/production-run-2018-08/Motherboard.pdf)
   * [Auxiliary_Board](http://gauss.bu.edu/svn/evolver-system/Hardware/Auxiliary_Board/tags/production-run-2018-08/Auxiliary_Board.pdf)
   * [ADC](http://gauss.bu.edu/svn/evolver-system/Hardware/ADC_Board/tags/production-run-2018-03-01-RevC/PDFs/ADC.pdf)
   * [PWM](http://gauss.bu.edu/svn/evolver-system/Hardware/PWM_Board/tags/production-run-2018-03-06-RevC/PDFs/eVolver_pwm.pdf)
   * [RS485](http://gauss.bu.edu/svn/evolver-system/Hardware/RS485_Board/tags/production-run-2018-03-01-RevC/PDFs/RS485.pdf)
   * [Vial_Board](http://gauss.bu.edu/svn/evolver-system/Hardware/Vial_Board/tags/production-run-2018-08/Vial_Board.pdf)

 * [AllBoardsLayoutCheckJuly2018](AllBoardsLayoutCheckJuly2018.md)
 * [MotherboardLayoutCheck2018](MotherboardLayoutCheck2018.md)
 * SVN: http://gauss.bu.edu/svn/evolver-system/Hardware/2018Rev/
 * Document with changes:  http://gauss.bu.edu/svn/evolver-system/Hardware/2018Rev/eVOLVER%20Hardware%20Gen2.pdf
   * More detailed [eVOLVER_Gen2_Changes](eVOLVER_Gen2_Changes.md)
 * Mechanical drawings:
   * Original top plate:   http://gauss.bu.edu/svn/evolver-system/Hardware/2018Rev/evolverbox_top.PDF
   * Proposed update with pcb: http://gauss.bu.edu/svn/evolver-system/Hardware/Motherboard/trunk/mech/TOP_PLATE%20Model%20(1).pdf
 * Photos (2017):  http://gauss.bu.edu/svn/evolver-system/Hardware/2018Rev/pix/


 * [Wiring Guide](http://gauss.bu.edu/svn/evolver-system/Doco/Wiring_Guide/Wiring_Guide.pdf) with some notes about how the ADC and PWM channels are connected through the system.

Some thoughts on trace routing for high current:

See [spreadsheet](http://gauss.bu.edu/svn/evolver-system/Hardware/Motherboard/docs/trace_calculations.ods) (!OpenOffice) with calcs.  Estimate for existing design with .040" traces using 0.5A load shows 0.16V drop with 80mW dissipation for each circuit.  If we increase to 0.6A and decrease trace width to 0.020 that is 0.38V drop and 230mW dissipation.  This should be OK.  Note that all 4 layers are used.

## Tachometer fan speed readout

 * SAMD21 datasheet: http://ww1.microchip.com/downloads/en/DeviceDoc/40001882A.pdf
 * Notes on high-speed SAMD21 ADC operation:  http://forum.arduino.cc/index.php?topic=338640.0
 * Also this pin (A0) is EXTINT[2] so can be used as an external interrupt with the attachInterrupt() function.  See https://forum.arduino.cc/index.php?topic=343779.0

## Board Designs (2016/2017)

 * The fabricated board designs are all located here in our SVN: [SVN Link](http://gauss.bu.edu/svn/evolver-system/Hardware/).
 * Schematics (as built):
   * [ADC Board](http://ohm.bu.edu/~hazen/eVOLVER/prod/ADC.pdf)
   * [Aux Board](http://ohm.bu.edu/~hazen/eVOLVER/prod/Auxiliary_Board.pdf)
   * [Motherboard](http://ohm.bu.edu/~hazen/eVOLVER/prod/Motherboard.pdf)
   * [RS485 Board](http://ohm.bu.edu/~hazen/eVOLVER/prod/RS485.pdf)
   * [PWM Board](http://ohm.bu.edu/~hazen/eVOLVER/prod/eVolver_pwm.pdf)

## ECOs (errors) in production boards

 * Ground mis-connected on Aux board RS-485 female connector.  Fix:  jumper pin 1 to pin 5 on the back of the board.  Ground is supposed to be on pin 5.

## Firmware

 * [SVN repositories](http://gauss.bu.edu/redmine/projects/arduino-zero/repository/libs)

## Power Supplies


24V Estimates:
```
24V:  0.15A per heater  (16)
      0.05A per fan     (16)
      0.15A per pump    (48)
      Total   = 10.4 A
5V: 0.1A per LED plus 1A total for logic plus Raspberry Pi = 0.1A*16 + 1A + 0.5A = 3.1A (~15.5W)
```

12V Estimates:
```
12V:  0.3A per heater  (16)
      0.1A per fan     (16)
      0.3A per pump    (48)
5V: 0.1A per LED plus 1A total for logic = 2.6A (~15W)
```

Candidate 24V supplies:
 * [W24LT1880](http://www.acopian.com/store/productdetail.aspx?q=dNominal+Output+Voltage+:+24;+Adjust+Range:+1;++Max+Output+Amps+(40+C):+18.8;,i3288) from Acopian ($615)
 * [PMT-24V350W1AK](http://www.digikey.com/product-detail/en/delta-electronics/PMT-24V350W1AK/1145-1077-ND/4386548) from Delta ($55).  NOTE:  14.5A max output
 * [CAR0424FPXXXZ01A](http://www.digikey.com/product-detail/en/ge-critical-power/CAR0424FPXXXZ01A/555-1382-ND/5254212) from GE ($146).  16.6A max output

Candidate 5V supplies:
 * [LS25-5](http://www.digikey.com/product-detail/en/tdk-lambda-americas-inc/LS25-5/285-1890-ND/2057039) from Lambda/TDK ($19.65).
 * [VGS-25-5](http://www.digikey.com/product-detail/en/cui-inc/VGS-25-5/102-1928-ND/2045659) from CUI ($25).

## Other Information

 * [wiki:eVolver_Mfg Manufacturing info (quotes, etc)]

 * [Proposal](http://ohm.bu.edu/~hazen/BME/eVOLVER/eVOLVER_proposal.pdf) -- DRAFT of 6/8/16
 * [ASB_V3.pdf](http://ohm.bu.edu/~hazen/BME/eVOLVER/Meetings/2016-06-08/ASB_V3.pdf) -- Schematic of prototype analog board
 * [TVB_V5.pdf](http://ohm.bu.edu/~hazen/BME/eVOLVER/Meetings/2016-06-08/TVB_V5.pdf) -- Schematic of prototype PWM board
 * [hazen_meeting.pptx](http://ohm.bu.edu/~hazen/BME/eVOLVER/Meetings/2016-06-08/hazen_meeting.pptx) -- Slides from 6/8/16 meeting

 * [Bootloader](https://forum.arduino.cc/index.php?topic=330227.0) discussion for Arduino Zero.  See also [Sparkfun bootloader](https://github.com/sparkfun/Arduino_Boards/tree/master/sparkfun/samd/bootloaders/zero) for the SAMD21 Mini Breakout board

 * [wiki:Bootloader Current Bootloader Status and information]
 * See also EDF [wiki:ArduinoZero] page
