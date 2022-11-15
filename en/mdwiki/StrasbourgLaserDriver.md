# StrasbourgLaserDriver
This is a proposed project to create a system based on [KFLARE](KFLARE.md) which would provide single-channel Laser/TEC driver boards controlled by a single central controller.

## Required Changes

 * Float the current source so either anode or cathode of laser can be grounded
 * Upgrade the current source to realistically run at 4A.  Using e.g a 3.3V power supply, the transistor would be dissipating about 3.5W.
 * Implement a floating photodiode readout
   * OPA365 is -5V only.  Should find a +5/-5 replacement.  Also, I(out) is only 65mA.
   * LMV641?
 * Possible transistor replacement:  2SA2222SG in TO-220 pkg


### Design work Jan 2020

*TEC*

The DRV595 includes a PWM driver and seems overly complex.  Best to just use an H-bridge to drive the TEC with a similar L-C filter on the output.  For example the MC33886/7 which doesn't mention TEC in applications but seems otherwise suitable. Another more fancy option is IFX9201SG with an SPI control interface.  Neither of these mentions a TEC application though.

Also see the ADN8830 ($10@100), LTC1923 ($30!) TEC controllers which do everything but needs external FETs or H-Bridge.

Best bet seems to be ADN8831 with two e.g. Si9801 half-bridge drivers.

*Laser*

Providing ~5A from a fixed supply is not very realistic.  Looking at things like the [LTM8064](http://www.linear.com/docs/52307), which is a nice, constant-current step-down converter.  They are $30/$20/$16 @1/100/1k.  Another option is the LTM8024, which is not constant-current but could act as a programmable supply for a downstream driver.

### Meeting Jan 2020

 * Plan to go ahead and fab 4-8 boards of essentially KFLARE design for testing
 * Begin design of upgraded version per notes below.

### Discussions Nov 2019

 * TEC Driver currently 3A would like 4A (see DRV595)
 * Laser driver 2.5-3A now (thermally limited) would like 4A
   * Need to discuss power supply issues
   * Need dual polarity
 * New photodiode readout requirement
 * Flexible polarity / grounding
 * See https://www.rpmclasers.com/wp-content/uploads/products/Diode%20Catalog%202017.pdf

Sylvain suggests that a 2-channel board would be OK but need to discuss changes above
and mechanics / cooling.

A big issue with the old design was cooling of the driver circuit.
A couple of thoughts come to mind.  One is to optimize the power supply
voltage for each laser (programmable switching regulator?)  Another is to
us a larger transistor package with a bigger heatsink.

Laser diode grounding note:  https://www.teamwavelength.com/download/applicationtechnotes/an-ld16.pdf

*2019-12-02*

Handling a 4A LD with a simple linear constant-current driver is a challenge due to the dissipation in the power device.  Thinking about alternatives, such as a switching regulator to provide a programmable bulk power source individually for each channel.

### Existing System

 * Existing design uses an Atmel ATMega164A uC per laser in a 44-VQFN package.  This device is efficiently used, with only about 4 spare I/O pins.
 * Communication is over a Modbus-like RS-485 serial shared bus.  This works well since RS-485 has very good power supply rejection.  See [communications protocol](http://goo.gl/6Zv7T) spec document.

In the current system an additional ATMega64A uC was used as the system controller, which would manage up to 20 Laser/TEC modules and handle the interface with the host computer.  The system controller also managed the power supply, fans and an additional white light source.

System Controller functions:

 * UART (RS-485) bus to Laser/TEC modules
 * UART or other interface to host computer
 * Fan control PWM output
 * Fan sense input
 * Interlock control logic inputs:  TEMP_ALARM, AC_FAIL, FAN_FAIL, INTERLOCK_STATUS
 * Interlock control logic outputs: LASER_SHUTDOWN, LASER STATUS (per laser)
 * ~4 temperature sensors
 * I2C DAC for laser current setting (or maybe Laser/TEC control?)
 * White light source control (opt-isolated)
 * Laser enable outputs
 * LED indicators

### Controller ideas

 * Zynq, e.g. Enclustra Mars ZX2 DIMM
   * Pros:  Linux on-board, familiar, lots of GPIOs, complete control of peripherals
   * Cons:  Analog inputs may be hard to use
 * Beaglebone:
   * Pros:  Linux on-board, UARTs and analog inputs built-in, enough GPIOs
   * Cons:  Unfamiliar, sounds like analog inputs are a real headache
 * Raspberry pi:
   * Pros:  Linux on-board, widely used
   * Cons:  Unfamiliar, share UART with serial console (?), analog inputs maybe a pain
 * FPGA Eval board:
   * Pros:  Relatively easy to use (IPBus interface?)
   * Cons:  Need to come up with an ADC solution

There exist some useful PMODs, such as [Isolated RS-485](https://store.digilentinc.com/pmod-rs485-high-speed-isolated-communication/) and [4 ch 12 bit ADC](https://store.digilentinc.com/pmod-ad2-4-channel-12-bit-a-d-converter/)
