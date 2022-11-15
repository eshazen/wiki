# ADCBoardNewPowerSupply
Nav: QuadPulser

## Power Supply

Most of the problems in the "Rev C" boards is due to failures in the power supply system.  This page has notes on how to upgrade it to be more reliable.  Currently, switching converters operated from 12V provide 3.7V, 2.2V, 5V and -2.5V.  We propose to remove all of these from the board and supply the power externally.  In addition we propose to change the +4/-1 dual supply for the input amplifiers to a simpler single +5V supply.

See QuadPulserPowerConverter for ExpressPCB board and subsequent versions of power supply design

*Required !Voltages/Sequence (new):*


| Volt  | Loads                            | Sequence | Source          | Current   |
| ----  | -----                            | -------- | ------          | -------   |
||*2.2V bulk*                          ||                           | *420mA* |
| 1.0V  | VCCint, VCCbram                  | 1        | LDO: 2.2V bulk  | 150mA (1) |
| 1.8V  | VCCaux, VCCadc                   | 2        | LDO: 2.2V bulk  | 270mA (1) |
||*3.7V bulk*                          ||                           | *1.5A* |
| 2.5V  | Level shifters, VCCO_15,_35, osc | 3        | LDO: 3.7V bulk  | 650mA (1) |
| 3.3VD | VCCO_14, ADC conf, FTDI, DE9     | 3        | LDO: 3.7V bulk  | 100mA (1) |
| 3.3VA | ADC                              | 3        | LDO: 3.7V bulk  | 820mA (2) |
||*6V bulk*                            ||                           | *500mA* |
| 5VD   | Level Shifters                   | 3        | LDO: 6V bulk    | 100mA (1) |
| 5VA   | Op-amps                          | 3        | LDO: 6V bulk    | 400mA (3) |

 * (1) wild guess
 * (2) 2x ADS6424 ADC
 * (3) 8x 40mA THS4509

The 2.2V could probably 2.5V.

(Sequence 3 items should be gated on external enable so they come up after the Zynq has powered it's I/Os.)
The following current measurements were made on existing board with "blinky" firmware running:

```
  5V:  27mA
3.7V:  1.4A  (250mA before FPGA loads)
2.2V:  200ma
```



### FPGA Sequencing Requirements

See [Artix-7 data sheet](https://www.xilinx.com/support/documentation/data_sheets/ds181_Artix_7_Data_Sheet.pdf) page 6 or so.
Excerpt:

 "The recommended power-on sequence is VCCINT, VCCBRAM, VCCAUX, and VCCO to achieve minimum current draw and ensure
 that the I/Os are 3-stated at power-on. The recommended power-off sequence is the reverse of the power-on sequence. If
 VCCINT and VCCBRAM have the same recommended voltage levels then both can be powered by the same supply and ramped
 simultaneously. If VCCAUX and VCCO have the same recommended voltage levels then both can be powered by the same
 supply and ramped simultaneously."

### Other Notes

```
  +6-7V (external)
    +5VA for op-amps
    +5VD for I/O buffers
  +3.7V
    +2.5VA (buffers, VCCO_15, VCCO_35, Osc)
    +2.5VB (FPGA)
      +1.0V (VCCint, VCCbram)
      +1.8V (VCCaux, VCCadc)
    +3.3VA (ADC)
    +3.3VD (VCCO_14)

Currently 3.7V, 2.2V controlled by logic signal "Enable"
Then 5V
Then sequencer:
  1.0V
  1.8V
  Analog: +4/-1, 2.5V, 3.3V

Proposed new sequence:
  External +6, +3.7 come on simultaneously
  Sequencer started by external logic enable:
    2.5VB (FPGA internal bulk)
    1.0V (VCCint)
    1.8V (VCCaux)
    All others (5VA, 5VD, 3.3VA, 3.3VD, 2.5VA)

Possibly consider LTC2924 sequencer/controller which monitors output voltages
```
