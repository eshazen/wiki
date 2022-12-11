# Scope Clocks

* [Ultra-Simple Oscilloscope](https://www.electronixandmore.com/projects/simplescope/index.html) simple CRT power and driver
* [Dutchtronix](http://www.dutchtronix.com) AVR scope clock
* [ClockShield](http://www.dutchtronix.com/Arduino-ClockShield.htm) has AVR source code

* https://www.electronixandmore.com/projects/scopeclock/index.html
* https://www.catahoulatech.com/index.php?product=KIT-0001

Starting a project, apparently.  Ordered a 3BP1 3" CRT with P-3 phosphor on eBay.

Now thinking about a tube-based CRT system.  
The 6BP1 [data sheet](http://www.r-type.org/pdfs/3bp1.pdf) or
[another](http://www.nj7p.org/Tubes/PDFs/Frank/049-RCA_Cuningham/3BP1A.pdf) suggests
between 1500 and 2000V operating voltage.  Maybe a voltage-quadrupler
on a 300V-380V transformer (1700-2200V)?

Sources/Links:

* [Transformer candidate](https://www.antekinc.com/content/AS-05T320.pdf)
* [CRT socket?](https://www.surplussales.com/Tubes-Sock-Acc/CRTTubes.html)
* [Anderson monitor](http://www.taswegian.com/NBTV/forum/viewforum.php?f=17) NBTA forum (fascinating reading!)

Thinking to design a deflection amp using 12sn7 tubes, which seems like a nice octal alternative similar to 12au7 but cheap and readily available.

Notes:

(Steve Anderson, p5 of NBTV forum)

When a tube datasheet refers to a voltage it's usually referenced to the cathode, the actual voltage the cathode sits at is determined by your design which of course the tube manufacturer has no idea about. If the cathode isn't the reference point it's always clearly stated. Take a triode cathode-follower. The cathode might be at +100V, the grid at +95V, both voltages are positive but the grid is -5V relative to the cathode. The same applies here and also in datasheets for semiconductor devices.

Generally CRTs of this nature have a high negative voltage around the cathode/grid circuit and a comparatively low positive voltage for the anode(s) and deflection plates. Have a look at the RCA circuit for this CRT below. (I posted the pdf for this (3BP1Ab.pdf) in this thread on October 29).

Notice the A2 is grounded, 0V and the cathode therefore is at -2000V. The deflection pates are also close to ground too. In your case the deflection plates will be sitting around +180V therefore using exact numbers the cathode needs to be at -1820V, it of course doesn't need to so precise. The focus control needs to be around +575V relative to the cathode, so here that becomes -1820+575 = -1245V, a pot is provided to adjust this +/-100V or so. CRTs with a PDA (Post-Deflection Accelerator) are arranged in much the same manner with a high positive voltage applied to the PDA, e.g. 3FP7.

The circuit below doesn't have an astigmatism control, this is catered for by slightly adjusting the A2 voltage relative to the average deflection plate voltage. There is a maximum voltage specification between the deflection plates and A2 of 550V for this CRT.

Are the type numbers on the CRT clear? Is it a 3BP1A or a 3BP1? The difference between the two is the focus current, the A version has a much lower focus current, this is usually true for all 'A' variants of CRTs. If it's a non-A version we'll have to adjust all the values of those resistors in the dropper chain, R1 to R6 in the diagram.
