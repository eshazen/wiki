# LogicBoardECOs
## V 1.0
 * R100 is missing and needs a 100ohm SMD805 resistor
 * R10 is missing and needs a 0.3 ohm SMD604 resistor (using an on-hand 1-ohm resistor)
 * *DONE-SCH-PCB* The TX + and - lines are swapped, so they need to be flipped

 * *DONE-SCH-PCB* Remove half-duplex resistors. (Setting to DNP)
 * *DONE-SCH-PCB* U6 clock pins 26/27, 18/19, 21/22 are swapped.
 * *DONE-SCH-PCB* DS1820 ground
 * *DONE-SCH-PCB* remove temp sensor extra power transistor setups (we can source the current from the FPGA)
 * *DONE-BOM* Convert TDC slow control interface to 3.3V from 2.5V if we make that change on the new integrated TDC board. (eventually rename from original i2c bus names)
