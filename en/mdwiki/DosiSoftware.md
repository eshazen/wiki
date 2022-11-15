# DosiSoftware
## Setup and Interface Information
 * [Dosi_Setup_uHAL](Dosi_Setup_uHAL.md)
 * [DDS_Interface_Notes](DDS_Interface_Notes.md)

## DOSITool: Main software tool

### Getting the Development Version

The development version is available at this url: http://ohm.bu.edu/~cwoodall/roblyer/dDOSI/oversampling/dosi-software/

There are two ways to download the development version:
 * Download the following tar.gz (can be opened with 7zip on windows) http://ohm.bu.edu/~cwoodall/roblyer/dDOSI/oversampling/archive/dosi-software-2014-01-31.tar.gz
 * Clone the git repo: git clone http://ohm.bu.edu/~cwoodall/git/dosi-software.git

### DOSI Address Table and Connection File

The DOSI address table is based off of Mr. Wu''s [DOSI specification](http://buphy.bu.edu/~wusx/download/DOSI/DOSIspec.txt)

 * Most recent [Address Tables](http://ohm.bu.edu/~cwoodall/roblyer/dDOSI/dosi-software/map/)
 * Most recent [Connections File](http://ohm.bu.edu/~cwoodall/roblyer/dDOSI/dosi-software/connections/)


### Software Description

#### ADC Interface: Reading the ADC Buffer (U2)

The ADC read in logic resides on U2. First the ADC evaluation board must be hooked up over the FMC connector and configured to stream through the digitized ADC inputs for both channel A and channel B. The ADC outputs two 16-bit signals per channel on the positive and negative edge of the ADC Clock. To work appropriately first the ADC needs to be put into test mode, then U2 goes through a synchronization sequence.

=====  Email from Wu  =====
First, due to some pin assignment problems on the U2, you have to use a modified ADC bit file to
configure the ADC board. You can find it at the same place where DOSI firmware is located.
To start an ADC readout sample, you need to write 1 to bit 13 of register 0x0.
As writing to reg 0x0 is always a pulse, you don''t need to write 0 to reset the bit.
every sample is 4096 ADC words. bit 31-12 are always 0 and bit 11-0 are the ADC value.
The ADC buffer can hold 16 samples, more samples will overwrite the earliest samples and there''s no
protection.
ADC data address mapping is as following:
```
0x20000 - 0x2ffff ADC DI data
    0x20000 - 0x20fff    first sample
    0x21000 - 0x21fff    2nd sample
    ......
    0x2f000 - 0x2ffff    16th sample
0x30000 - 0x3ffff ADC DQ data
    0x30000 - 0x30fff    first sample
    0x31000 - 0x31fff    2nd sample
```

#### DDS Interface: SPI Bus over IPBus (U1)

(Note: The DDS is occasionally referred to as DSS)

The SPI bus runs on U1 and is identical to the flash interface used on U2.

 * SPI Enabled via bit 22 of registers 0x7-c, where the - represents one of the DDS connectors 1-6 (DDSn_SPI_EN_BIT)
 * Write Buffer (SPI_WBUF) = 0x1000 to 0x107F
 * Read Buffer (SPI_RBUF) = 0x1080 to 0x10ff
 * Write to bottom 9 bits of SPI_CMD (addr: 0x1) to specify the number of bytes to send
 * Read register 0x1 (STATUS) bit 7 (SPI_BUSY_BIT) to check if SPI bus is busy

The specifics of the SPI bus for the DDS boards is described in the datashee t for the [AD9910](http://www.analog.com/static/imported-files/data_sheets/AD9910.pdf)

 * Stage 1: A single byte is written:
   * Bit 7:
     * ''1' => READ
     * ''0' => Write
   * Bits 6 and 5 are RESERVED (do not write)
   * Bits 4-0: Address of register to read/write
 * Stage 2: The number of bytes in the addressed register are either read or written.

In order to initialize the DDS the following writes should take place in order:

1. *'WRITE*: "00 C0 08 20" (4 bytes) to 0x01 (CFR2)
   * Turns on Internal I/O update

2. *'WRITE*: "00 00 00 02" (4 bytes) to 0x00 (CFR1)
   * Turns SDIO into an input (SDI) and activates the traditional 4-pin SPI bus (SS, MOSI, MISO, SCLK)

3. (OPTIONAL FOR TEST) *'WRITE*: "1F 3F C0 00" (4 bytes)
   * Turn off REFCLK input divider.

4. _' WRITE_: "?? ?? ?? ?? ?? ?? ?? ??" (8 bytes) to 0xE + 'n' where 'n' is the profile you want to write between 0 and 7 (select with PROFILE[2:0](2:0.md)
   * Bits 63:62 => dont care
   * bits 61:48 => Amplitude scale factor
   * bits 47:32 => Phase offset word
   * bits 31:0 => Frequency tuning word

5. *'REPEAT* previous step as needed or enable parallel modulation [FIXME](FIXME.md)


=====  Psuedo-Code for a SPI interface  =====
```
    function SPISend(DOSI, data, len, dds_channels. read_len=0) {
        value = 0

        for dds_channel in dds_channels {
            ACTIVATE(dds_channel)
        }

        for i in len-1 downto 0 {
            DOSI[''U1'](''U1'.md)
        }
        DOSI[''U1'](''U1'.md)
        while (DOSI[''U1'](''U1'.md)
           hold-lock(SPI_LOCK)
        }
        if (read_len > 0) {
            value = DOSI[''U1'](''U1'.md)
        }
        release-lock on spi resources
        return value
    }

```

Back to [Roblyer_dDOSI](Roblyer_dDOSI.md)

