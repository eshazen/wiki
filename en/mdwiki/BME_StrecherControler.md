# BME_StrecherControler
## PCB Documentation

 * PCB Schematic - [PDF](http://ohm.bu.edu/~hazen/BME_Stretcher/stretcher_sch.pdf) - [SCH](http://ohm.bu.edu/~hazen/BME_Stretcher/stretcher.sch) **(wiring colors are wrong!)**
 * PCB Layout - [PDF](http://ohm.bu.edu/~hazen/BME_Stretcher/stretcher_pcb.pdf) - [PCB](http://ohm.bu.edu/~hazen/BME_Stretcher/stretcher.pcb)
 * [Component data sheets](http://ohm.bu.edu/~hazen/BME_Stretcher/Docs)

## Box Wiring
### Motor to Motor Controller, via DB-9


| *Motor Wire Colors* | *DB-9 inner-wires* | *DB-9 Pin #* | *Wires in Box* | *Motor Controller* |
| ------ ---- ------- | ----- ------------ | ----- --- -- | ------ -- ---- | ------ ----------- |
| Red | Black | 1 | Orange | A+ |
| Red&White | Red | 6 | Gray | A- |
| Green | Gray | 2 | Blue | B+ |
| Green&White | Peach | 7 | Purple | B- |

----

### PCB to Stretcher Circuit, via DIN conn
Current (DB9 connector) (connected Aug 4, 2016)


| *Strecher Wire Color* | * DB9 Pin # (from rounded edge)* | *Function* |
| --------- ---- ------ | - --- --- - ----- ------- ------ | ---------- |
| Red  | 1 | +5v |
| Green  | 2 | In- |
| ext-red | 3 | detector ground |
| White | 4 | In+ |
| Black | 5 | GND |

Arduino side

| *DIN inner-wires* | DB9 Pin# (from rounded edge)  | *Pin # (PS2)* | *Function* |
| ---- ------------ | --- ---- ----- ------- -----  | ---- - ------ | ---------- |
| Brown |1| 2 | +5v |
| Orange |2| 4 | In- |
| green |3| 6 | detector ground |
| Black |4| 1 | In+ |
| Red    |5| 3 | GND |

----

~~OLD as of Aug 4, 2016~~
(5pin connector)
Strain gauge side

| *Strecher Wire Color* | * Inline Pin # (from rounded edge)* | *Function* |
| --------- ---- ------ | - ------ --- - ----- ------- ------ | ---------- |
| Red  | 1 | +5v |
| Green  | 2 | In+ |
| ext-red | 3 | detector ground |
| White | 4 | In- |
| Black | 5 | GND |

Arduino side

| *DIN inner-wires* | Inline Pin# (from rounded edge)  | *Pin # (PS2)* | *Function* |
| ---- ------------ | ------ ---- ----- ------- -----  | ---- - ------ | ---------- |
| Brown |1| 1 | +5v |
| Orange |2| 2 | In+ |
| green |3| ? | detector ground |
| Black |4| 3 | In- |
| Red    |5| 4 | GND |


~~OLDEST~~
```
|| '''Strecher Wire Color''' || '''DIN inner-wires''' || '''Pin #''' || '''Function''' ||
|| Green || Orange || 2 || In+ ||
|| Black || Red || 4 || GND ||
|| Red || ~~Pale~~ Brown || 1 || +5v ||
|| White || Black || 3 || In- ||
|| ext-red || green || ? || detector ground ||
```

----

### Arduino to Motor Controller, via PCB DB-9


| *Arduino Pin* | *DB-9 pin #* | *Wire Color* |*Motor controller* |
| -------- ---- | ----- --- -- | ----- ------ |------ ----------- |
| D2 | 6 | Blue | PUL - |
| D4 | 7 | Purple | DIR - |
| +5v | 1 | Orange | PUL + |
| +5v | 2 | Gray | DIR + |

----

### Arduino to Computer, via USB
 * USB connector

### PWR Barrel to wall, via Power Conn
 * PWR Barrel
