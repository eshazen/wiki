# 2012-05-09-LaserPowerMeeting
5/9/12 meeting to discuss power supplies in Laser box.

# Conclusions

After discussion, we agreed on the following power supply configuration:


| *Module* | *V range* | *'Operating V* | *Imax (A)* | *Power (W)* | *Load* | *Notes* |
| -------- | -- ------ | ----------- -- | ----- ---- | ------ ---- | ------ | ------- |
| Xg1 | 1.5-3.6 | -3V [1](1.md)
| Xg2 | 3.2-6 | +3.3V | 40 | 200 | TECs | normally on |
| Xg4 (2 par) | 12-30 | +28V | 10 | 240 | WLS | normally off, controlled by Sys. Ctrl [2](2.md)
| Xg7 | 5-28 | -5V | 5 | 120 | -5V analog | normally on |
| Xg3 | 6-15 | +12V | 20 | 240 | Fans and +5V | normally on |

Notes:




Other action items:


will come on with the AC power.  Eric will give Matt instructions on how to do this by modifying
the system controller design.

This is probably as simple as wiring the "GLOBAL ENABLE" (pin 6 on the connector) to +5V_Bias (pin 2)
but this should be checked in the documentation.  Other connections from backplane J9 to the power
supply mainframe should be left as-is.


### Preliminary Material

Current power module configuration:


| *Module* | *V range* | *'Imax (A)* | *Power (W)* | *Load* | *Notes* |
| -------- | -- ------ | ------ ---- | ------ ---- | ------ | ------- |
| Xg1 | 1.5-3.6 | 50 | 125 | Lasers | normally off, controlled by Sys. Ctrl |
| Xg2 | 3.2-6 | 40 | 200 | TECs | normally on, not controlled/monitored? |
| Xg4 (2 par) | 12-30 | 10 | 240 | WLS | normally on, not controlled/monitored? |
| Xg7 | 5-28 | 5 | 120 | "fans" | Also supplies all +5V power through regulators on Sys Ctrl |
| Xg3 | 6-15 _'(can't supply -5V!)_ | 20 | 240 | "electronics" | Only very low current -5V analog power. |

The power supply chassis provides low-current (250mA max) +5V called "+5V Bias".  Currently this is used
for all logic power on the system controller.  The current is insufficient.

Our task for today is to re-think the scheme for electronics power and figure out which modules should
come on with the AC power and which should be controlled by the system controller.

Here is one possible alternative configuration:


| *Module* | *V range* | *'Imax (A)* | *Power (W)* | *Load* | *Notes* |
| -------- | -- ------ | ------ ---- | ------ ---- | ------ | ------- |
| Xg1 | 1.5-3.6 | 50 | 125 | Lasers | normally off, controlled by Sys. Ctrl |
| Xg2 | 3.2-6 | 40 | 200 | TECs | normally off, controlled by Sys. Ctrl |
| Xg4 (2 par) | 12-30 | 10 | 240 | WLS | normally off, controlled by Sys. Ctrl |
| Xg7 | 5-28 | 5 | 120 | -5V analog | normally on |
| Xg3 | 6-15 | 20 | 240 | Fans and +5V | normally on |

This can use the same complement of power supplies.  It requires some small changes to the
system controller board to derive all the +5V logic power from +12V.

Also, I would recommend that the Laser, TEC and WLS modules all be controlled by the system controller
and at least their "power good" status monitored.  There are two monitor/control ports wired through the
backplane.  This would require adding a third one.




### Reference materials

 * [Google Spreadsheet](https://docs.google.com/spreadsheet/ccc?key=0AlkcEtLoMLBZdEtkQ19hcWw4LUE3NEdxR01rNlZsV1E)
 * [System Diagram](http://ohm.bu.edu/~hazen/Frangioni_Public/Laser/laser_source_diagram_big.pdf)
 * [Laser/TEC Schematic](http://ohm.bu.edu/~hazen/Frangioni_Public/Laser/laser-tec-modified-5-3a.pdf)
 * [System Controller Schematic](http://ohm.bu.edu/~hazen/Frangioni_Public/Laser/SCH-2012-04-07/VME_SYSTEM_CONTROLLER_REV_C-120417.pdf)
 * [Backplane Schematic](http://ohm.bu.edu/~hazen/Frangioni_Public/Laser/Backplane/flare_lightsource_vme_backplane_120504.pdf)
 * http://www.excelsys.com/ (power supply mfgr)
   * [Xgen designer''s manual](http://www.excelsys.com/technical_support/documents/XgenDesignersManualRevL28July2011_000.pdf)
   * [XVite Series Data Sheet](http://www.excelsys.com/technical_support/documents/XGen_Xvite28Oct2011.pdf)

