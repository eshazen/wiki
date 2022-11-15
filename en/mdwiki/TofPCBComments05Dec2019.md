# TofPCBComments05Dec2019
Please see also [TofPCBComments27Nov2019](TofPCBComments27Nov2019.md) as many things there are not done yet.

## HV Board

 * Change R20 and R21 to 10M and 1M respectively.  Also change them to a larger footprint or thru-hole which is rated for > 200V
 * Ground wiring around U8 and U10 is unacceptable.  Use one GND via minimum for each 1-2 connections.
   * See http://ohm.bu.edu/~hazen/elbat_tof/2019/HV_gnd_layout.pdf
   * Similar story for -5V, -195V and
   * Same for U9 and U11 but use -195V instead
