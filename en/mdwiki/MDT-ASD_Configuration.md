# MDT-ASD_Configuration

Up: MezzNgMicrocontroller * AtlasMichiganMezzCard

Below is a table of configuration values.  The *Name* column is the name which can be
used when setting the values using the serial configuration interface.

Note that the name *CHM* specifies in the configuration interface a 16-bit value
which sets the mode for all channels, so for example to enable only channel 1 active
and disable the others you would specify hex 0xfffc.


| *Name* | *Bits* | *Description* | *Expression* | *Nominal* |
| ------ | ------ | ------------- | ------------ | --------- |
| MASK | ![0:7] | Channel mask register LSB=ch 1 | n/a | 0 |
| CAP | ![8:10] | Calibration capacitor select | n/a | 0 |
| DISC1 | ![11:18] | Timing discriminator threshold | (N-128)*2 mV | 108 (-40mV) |
| DISC2 | ![19:21] | Wilkinson ADC threshold | 14+16*N mV | 1 (30mV) |
| HYST | ![22:25] | Hysteresis for DISC1 | N*1.25 mV | 2 ( 2.5mV) |
| GATE | ![26:29] | Wilkinson ADC gate | 11+1.5*N ns | 6 (20ns) |
| RDOWN | ![30:32] | Wilksonson I(rundown) | 2.4+0.7*N uA | 5 (5.9uA) |
| DEADT | ![33:35] | Deadtime | 74+18.3*N (ns) | 7 (535 ns) |
| CHM | ![36:37] | Channel 1 mode (top) | 00 - ACTIVE | 0 (Active) |
|  | ![38:39] | Channel 2 mode | 01 - HIGH | 0 (Active) |
|  | ![40:41] | Channel 3 mode | 10 - LOW | 0 (Active) |
|  | ![42:43] | Channel 4 mode | 11 - OFF | 0 (Active) |
|  | ![44:45] | Channel 5 mode |  | 0 (Active) |
|  | ![46:47] | Channel 6 mode |  | 0 (Active) |
|  | ![48:49] | Channel 7 mode |  | 0 (Active) |
|  | ![50:51] | Channel 8 mode (bottom) |  | 0 (Active) |
| TOT | ![52] | Chip mode | 0=ADC 1=TOT | 0 (ADC) |

Here is a sample python code [serial_config.py](http://gauss.bu.edu/svn/atmega-family-cli/projects/ATLAS-MichMezzTester/branches/rev1.2/python/serial_config.py)
which will set the ASD and TDC to their default settings and store in EEPROM.
