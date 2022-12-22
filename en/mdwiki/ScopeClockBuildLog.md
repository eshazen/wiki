# Scope Clock Build Log

**2022-12-22** Catching up

PCBs received for CRT bias [schem](https://github.com/eshazen/scope-clock/blob/main/hardware/anderson_crt/anderson_crt.pdf) and deflection amp [schem](https://github.com/eshazen/scope-clock/blob/main/hardware/deflection_amp/deflection_amp.pdf). Bias board assembled.  Waiting on parts for deflection amp.

Draft power supply schematic, footprint, placement [git](https://github.com/eshazen/scope-clock/tree/main/hardware/psu)

Meanwhile, power supply.  +360V current is about:

     2mA for CRT
    15mA for defl
    12mA for each side of diff pair
	30mA total

Built 2x multipler using 1n4007 diodes and 100uF 400V caps from EDF.
Input again 175V winding on Antek.  Load with 15k.
Voltage is 20-25% high.  Put 220 ohm in series with input, comes out
about right (1/8W input resistor burns, not surprising).  Seems to work.

Built 8x negative Cockroft-walton using 1n4007 diodes and 47uF 400V
caps from eBay.  Input is 175V winding on Antek xfrmr.  Load with 1.2M
resistors.  About 1500V observed with 120VAC input.

