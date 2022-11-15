# MertzMicro
*6/11/18* Laser pulse multiplex

A laser will be triggered at 80 MHz.  The optical output will be split and delayed producing a combined optical pulse stream at 160 MHz.  They require an analog demux to route alternate pulses from a PMT to two digitizers, with the demux toggling between outputs at 80MHz.

They have already purchased these mini-circuits RF switches:

 * https://www.minicircuits.com/pdfs/ZFSWA-2-46.pdf
 * https://www.minicircuits.com/pdfs/ZFSWA-2-46.pdf

And also this PLL eval board:

 * http://www.analog.com/media/en/technical-documentation/user-guides/UG-075.pdf

The AD board can provide an 80MHz 50% duty cycle clock with 3.3V CMOS, LVDS or LVPECL outputs.

What is needed is a fast level shifter circuit to drive the enable for the mini-circuits which is -5 to -8V.

Possibly useful parts:

 * 74LVC1G53 - analog mux/demux with 1ns switching at 5V.  But, control signal is 5V also so no big gain.
 * DPU01M-05 - 12V in, +/-5V out DC/DC converter (isolated)
 * TLV71333 - 3.3V LDO regulator
 * SWI5-12-N-P5 - 12V wall wart
