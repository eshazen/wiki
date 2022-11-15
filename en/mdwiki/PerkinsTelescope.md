# PerkinsTelescope
This is a project to eventually fully "robotocize" the Perkins Telescope at Lowell Observatory
so that remote observations can be conducted with a minimum of on-site intervention required.

 * [PerkinsAutomationNotes](PerkinsAutomationNotes.md) -- notes on automation
 * http://gauss.bu.edu/svn/perkins-telescope/

### Reference

 * [Perkins Documentation](https://jumar.lowell.edu/confluence/display/Perkins/Perkins+Telescope+Facility) page at Lowell
 * [Perkins_Manual.pdf](http://gauss.bu.edu/svn/perkins-telescope/OriginalDocs/Perkins_Manual.pdf) - control system manual (scanned)
 * [Pc48mand.pdf](http://gauss.bu.edu/svn/perkins-telescope/OriginalDocs/Pc48mand.pdf) - PC-48E motor control board in "MOVE" computer


## Summary from May 2018 visit

### Telescope motion


|  Axis  |      Motor steps | arc-sec |  Encoder step | arc-sec |
|  ----  |      ----- ----- | ------- |  ------- ---- | ------- |
|  Rt. Asc. |   720    |       28.444  |  720   |         5.555 |
|  Decl.    |   360    |       22.7555 |  360   |         2.777 |

Controlled by DOS program "MOVE" (MS-Fortran / x86 assembly)

 *  Primary interface is PC48 Multi-Axis Motion Controller
 *    http://www.omsinmotion.com/pc48
 *  This is an ISA bus controller which is pretty fancy
 *  Manual in SVN or http://control1m.apo.nmsu.edu/1m/docs/Pc48mand.pdf
 *  Uses ASCII commands over ISA bus
 *  Interface box (homemade, with many green circuit boards in vector box) "Compatible with IO38 Breakout board" (can't find manual for this) but schematics are at end of Perkins manual
 *  Motor controller is no longer Compumotor but at least the RA is Parker Hann AR-13SE control box.

Dome Shutter

 *  Raised by winch with 3hp motor (230V 15.8A 1725 RPM)
  plus electric brake (230V 1.4A)
 *  Momentary on-off-on lever control with limit switches
 * Contactor in box on dome wired via limit switches

Windscreen

 * Raised / lowered by switch on console
 * Need to investigate - maybe not suitable for automation

Mirror shutter

 *  Toggle switch on telescope, auto-stop when in position

Patch panels

 *  T - Telescope  F - Observing floor   W - Warm room
 *  All feed to central panel in computer room

