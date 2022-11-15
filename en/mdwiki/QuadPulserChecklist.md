# QuadPulserChecklist
## Firmware todo (undone/unknown in bold)

### Data capture path

 * ADC config

 * ADC interface

 ** ADC auto-align in hw

 * ADC auto-align in sw

 ** ADC capture + zero suppression

 ** block generation and pass off to even builder

 ** event builder

 ** high speed link transmitter (written, but untested)

 ** high speed link receiver (written, but untested)

 ** event capture

 ** pass event structures to zynq domain (DMA)

 ** software to interface with DMA

 ** software to write captured data to files?

### Trigger distribution

 * Free run generator

 ** external timing trigger capture

 ** Low latency command generator

 ** Low latency transmitter (written, but not tested)

 ** Low latency receiver  (written, not tested)

 ** low latency command decoder and passing to ADC path (not complicated, but a clock crossing)

### Charge discharge circuitry

 ** path for charge/discharge commands (same as low latency command above)

 * pulse generator

 * pulse generator configuration error detector

 ** external error capture

 ** external error command generation

 ** external error transmission back to carrier (written, but untested)

 ** external error capture (written, but untested)

 ** external error broadcast message generator (same path as low latency)

### ADC board control path

 * carrier register to 7-bit char stream

 ** 7-bit char transmitter (written, but not finalized)

 ** 7-bit char capture (written, but not finalized)

 * picoblaze uC and ADCBoard register map

 ** 7-bit char response transmitter (written, but not finalized)

 ** 7-bit char response capture (written, but not finalized)

 * register map on carrier

### carrier board control path

 * zynq linux (missing ssh, but has telnet)

 * bridge to PL  (firmware + initial software)

 * register map in PL


## Hardware

 ** ECOs (mostly done, but missing DB9 driver chip/wire

 ** test protection board

 ** carrier firmware update for new fmc mezz board

 ** parts for fmc mezz board connectors

 ** testing with fmc mezz board connectors

 ** wiring of 12V power


## Software

 ** read/write ADC check on data in locked.
 ** init enter and buffer clear out for lock
