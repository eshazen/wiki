# AllBoardsLayoutCheckJuly2018

## All Boards

 * OK HL Standard silkscreen requirements
   * OK HL All text right side up or 90 rotate if needed
   * OK HL All ref des same height (default 0.07")
   * OK HL No visible text under footprints
 * OK HL All schematic symbols use consistent property "Catalog Number" i.e. for mfg part number
 * OK HL Check hole size for terminal block (should be 2mm per drawing)
 * OK HL Arrows for daughter board orientation
 * OK HL Mounting holes
   * OK HL Confirm whether connected to GND or not
   * OK HL Confirm hole/pad size (pad size large enough for standoff/nut/screw head)
 * OK HL Check ALL copper areas
   * OK HL proper coverage (completely surround thru-hole pads connected)
   * OK HL Reasonable width for current required
 * OK HL Fill out PN/Supplier fields


## Auxiliary Board

 * 5V regulator
   * OK HL Check thermal requirements for estimated power dissipation
   * OK HL Check capacitor requirements
   * OK HL Make sure there is room for a heatsink and put it on the BOM
     * OK HL (add a heatsink part to schematic for BOM)
 * OK HL Confirm with Brandon that the input is 12V
 * OK HL Move traces away from mounting hole
 * OK HL Check ALL copper areas
   * OK HL proper coverage (completely surround thru-hole pads connected)
   * OK HL Reasonable width for current required
 * OK HL Expand 12V area across board at Y=2.5 in
 * OK HL Move R1, R2 up a bit and align them
 * OK HL Move P1..P6 references out from under PWM board outline
 * OK HL Remove random via in SW corner of M4
 * OK HL632 Standoff size
 * OK HL Move MH out from under M3
 * OK HL Heatsink on U2
   * flat package
   * OK HL move regulator
   * OK HL heatsink mounting hole connection
 * OK HL RJ14 footprint


## Motherboard

 * Renumber references:
   * OK HL Male connectors (P1-P16 are perfect)
   * OK HL Resistor packs should be RP1...
   * OK HL USB and RJ-14 should be J1...
 * OK HL Delete R6 and R7 from the design (A, B) go in parallel to the two RJ14 jacks
 * OK HL Re-route (A, B) to run next to each other (they are a differential pair)
 * OK HL Delete or hide the reference designators "MH1" etc on mounting holes on the silkscreen
 * OK HL USB footprint has spacing errors
 * RJ-14 footprint is wrong.  Mechanical holes should be above signal holes with pin 1 in upper left.
 * OK HL Hole size for power jumpers is wrong.  See drawing for 952-2207-ND.  Recommended hole size is 2mm.
 * OK HL Change P/N for 16 pin headers (P1-P16) to increase height.

 * OK HL Double check USB footprint
 * OK HL Mark out rectangle on Arduino footprints to designate uUSB connector
 * OK HL Bigger Pin 1 Markings on Daughterboards
 * OK HL Change MH to 632 size (0.3 pad, 0.15 drill)

## Pi hat

 * OK HL Double check circuit
 * OK HL Resistor Jumpers for direction signal
 * OK HL Pi hat move RJ away from conn.
 * OK HL rotate GPIO breakout headers
 * OK HL label signals on headers

## Vial Board

 * OK HL no text cut off
 * OK HL label thermistor
 * OK HL Bring back ref. designators
 * OK HL Change PWR/GND to +/-
 * OK HL label IR LED
 * OK HL Check header SS size
 * OK HL Move R4 to the right
 * OK HL Diagonal lines to PWM, TACH(FS?) labels
 * OK HL Move header pin to the right
 * OK HL Move ID text upwards
 * OK HL Add row definitions (+/-) to both sides of header
 * OK HL Add SS outline for Thermistor
 * OK HL Thermistor DNP
 * OK HL Delete D1, D2
 * OK HL Move traces away from MH's
 * OK HL Set R1 to 82
 * OK HL Get R3 from Brandon

