# Treadmill_Backpack
This page contains ideas/documentation for a Sargent College
project to vary the effective weight of a backpack carried
by a subject walking on a treadmill.

### Design Documents

 * Proposed [System Diagram](http://joule.bu.edu/~hazen/TreadmillBackpack/system_diagram.pdf)
 * Test setup [Wiring Diagram](http://joule.bu.edu/~hazen/TreadmillBackpack/test_setup.pdf)
 * Interface PCB schematic [PDF](http://joule.bu.edu/~hazen/TreadmillBackpack/interface_sch.pdf)
  [ExpressPCB](http://joule.bu.edu/~hazen/TreadmillBackpack/backpack.sch)
 * Interface PCB layout [PDF](http://joule.bu.edu/~hazen/TreadmillBackpack/interface_pcb.pdf)
  [ExpressPCB](http://joule.bu.edu/~hazen/TreadmillBackpack/backpack.pcb)
 * Wiring Diagrams
   * Sensor and Valve [PDF](http://joule.bu.edu/~hazen/TreadmillBackpack/wiring.pdf)
   * Pump Control [PDF](http://joule.bu.edu/~hazen/TreadmillBackpack/relay.pdf)

### Requirements

Weight range is 10%-30% of subject body mass.  20% corresponds to the amount
of weight which must be added/removed during the trial.  The weight will
be added/removed in 2.5% mass increments.


|Subject Weight | 10%| 20% | 30%| 2.5%|
|------- ------ | ---| --- | ---| ----|
| 50kg| 5kg| 10kg |15kg| 1.25kg|
| 115kg| 11.5kg| 23kg |34.5kg| 2.9kg|

For a 115kg subject (250lb) the maximum weight to be added/removed
is 34.5kg (about 50lb).

*'Baseline Design*

Two water tanks are permanently mounted, one above and one below
the treadmill.  A third tank is mounted on the backpack.
Water is delivered from the upper tank to the backpack to increase
the simulated mass, and drained from the backpack to the floor tank
to reduce the mass.  A pump returns the water to the upper tank.

The controller allows the operator to deliver a specific volume
of water from the upper tank to the backpack (to increase mass)
or from the backpack to the lower tank (to decrease mass).
Ideally, the controller would be calibrated by entering the subject
mass in kg, and then would display the current mass and allow the
operator to increment or decrement the mass by a specified amount.

Initially, the controller will be a software application running
on a PC.  A small interface board is required to connect the
solenoids, sensors and load cell to the computer via the
[U3](http://www.labjack.com/labjack_u3.html)



*'Parts List*


| Omega | [FPR-204-PS](http://joule.bu.edu/~hazen/TreadmillBackpack/FPR200.pdf)
| ----- | ---------------------------------------------------------------------
[Manual](http://www.omega.com/Manuals/manualpdf/M2582.pdf)

| Asco | [8210G002](http://joule.bu.edu/~hazen/TreadmillBackpack/8210_2.09R4.pdf)
| ---- | ------------------------------------------------------------------------
| LabJack | [U3](http://www.labjack.com/labjack_u3.html)

*'Reference Material*

 * [Blue-White Inc](http://www.blue-white.com/)
 * [Omega S-Beam Load Cells](http://www.omega.com/pptst/LC101.html)
 * [Fuji Electric](http://www.fujielectric.com/products/)
 * [TTI Global](http://www.ttiglobal.com/Default.aspx)

 * [Omega Continuous capacitative level sensors](http://www.omega.com/toc_asp/subsectionSC.asp?subsection=K04&book=Green)
 * [Omega turbine flowmeter](http://www.omega.com/ppt/pptsc.asp?ref=FTB900&Nav=gref02)

 * http://www.grainger.com - plumbing stuff

