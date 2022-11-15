# TTC_TTS_FirmwareSpecification
This page describes more specifically the firmware requirements for the TTC/TTS interface board for CMS.

See link to page for [Old TTS Test Gadget](http://ohm.bu.edu/cgi-bin/cms/TTS_Test_Gadget)
on firmware for TTC simulation.

## TTC Simulator

### Phase I

This is a simple firmware mode designed for use in a test stand without Ethernet control.
The board should always default to this mode until a valid Ethernet command is received.
In this mode, at power-up both SFP transmitters should send TTC idle continuously, with an
orbit signal (BC0 = 0x09) every 3563 BX clocks.

L1A should be sent at a rate set by two jumpers on the GPIO header:

```
  00 - no L1A
  01 - L1A at 1 Hz
  10 - L1A at 10 Hz
  11 - L1A at 1 kHz

```
These L1A should always be sent at BCN = 0x654

An initialization sequence consisting of the following broadcast commands should be sent at power-up
(after a delay of ~1s):

```
  ECR = 0xe2
  OCR = 0x28

```
In addition, this sequence should be sent when a switch closure to GND is detected on a GPIO pin
(with heavy-duty debouncing to prevent multiple triggering).

### Phase II

In this mode, the full functionality of the old [Old TTS Test Gadget](http://ohm.bu.edu/cgi-bin/cms/TTS_Test_Gadget)
should be available along with various error counters, etc using an Ethernet interface based
on the IPBus protocol.

## TTS Interface

The board should "always" operate as a TTS adapter.  The basic functionality is to decode
a TTC-like stream on the SFP receiver and output groups of 4 bits to the LVDS outputs.
Eventually there should be two jumper or ethernet-selectable modes:




Eventually bit errors should be counted on the TTS interface and made available
for Ethernet readout. An LED should blink when errors are occurring (and for perhaps
5s after last error), be on steady when good data is being received, and off
when there is no input.  There should be one LED per SFP receiver



