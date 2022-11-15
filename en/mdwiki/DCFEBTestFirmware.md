# DCFEBTestFirmware
*xDCFEB Test Firmware*

This page describes firmware to run on an FC-7 MicroTCA module for testing XDCFEB boards for the CMS muon system.  See [CSC DCFEB](CSC_DCFEB.md) main project Wiki page for some links to documentation.

The XDCFEB contains a GBTx ASIC and a Virtex-6 FPGA.  The GBTx is used to download configuration data to the FPGA.

A transmit buffer of 512 words of 84 bits (84 bits GBT_DATA plus
32 bits WB_EXTRADATA).

A receive buffer of the same size.

Control registers / bits as follows:

Transmit enable (1 bit)
    when '1', transmit data from the transmit buffer continuously

Receive enable (1 bit)
    when '1', receive data from the receive fiber
    Data is stored continuously in circular buffer until
    receive enable turned off or trigger condition met

Status register
    Firmware revision
    PLL lock status as appropriate
    GBTx core status bits
    Provide useful status bits from the SFP state including
    LOS and "module present" indication

Receive dat trigger
    Capture mask (116 bits) - a '1' indicates receive data compared against match register
    Capture match (116 bits) - value to match

    When receive data matches capture value, receive 256 words and then stop

Write pointer (9 bits)
    Address of last word written in receive buffer.
