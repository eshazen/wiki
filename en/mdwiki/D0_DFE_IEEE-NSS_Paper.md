# D0_DFE_IEEE-NSS_Paper
*'Conference Website*: http://www.nss-mic.org/2006/

## Poster

Two pages, to be printed and posted one above the other.
As presented at IEEE.

 * [poster_final.pdf](http://joule.bu.edu/~hazen/my_d0/DFEA2_IEEE/poster_final.pdf)

## Abstract and Summary

*'Title*:  Hardware Aspects of the Upgraded D0 Central Track Trigger

*'Abstract*:

The D0 experiment at the Tevatron at Fermilab (Batavia, IL USA) was
recently upgraded to handle the expected increase in instantaneous Tevatron
luminosity for Run IIb.  As part of the upgrade, much
of the Level 1 Central Track Trigger system was replaced.

A key element in the Central Track Trigger is the Digital Front-End
(DFE) system.  The DFE processes hits from the Central Fiber Tracker and
identifies track candidates by comparing fiber hits to predefined hit
patterns using combinatorial logic implemented in FPGAs.
The original DFE worked well but suffered several limitations: It combined
pairs of fibers in the tracker on a single input to the track-finding
logic; it required a long elapsed time to download new firmware; and
the cable plant at the front of the DFE racks was difficult to manage.

The new DFE system provides many improvements, while remaining
plug-compatible with the orignal.  It significantly improves
granularity in the track-finding logic, provides much faster firmware
update times, and eliminates completely the cable plant at the front
of the DFE racks.  A new controller module provides a gigabit ethernet
over optical fiber interface for control and initialization.  New
self-test features permit exercise of all DFE logic with
pre-programmed test patterns, allowing a complete test of each DFE
crate before installation.  A stand-alone tester was developed to
exercise all inputs and outputs of each DFE for design verification
and production testing.

## Summary

 * [summary_17May06.pdf](http://joule.bu.edu/~hazen/my_d0/DFEA2_IEEE/summary_17May06.pdf)
 * [summary_14May06b.pdf](http://joule.bu.edu/~hazen/my_d0/DFEA2_IEEE/summary_14May06b.pdf)

### Reference Material

 * http://www-d0online.fnal.gov/www/groups/cft/CTT/online/Overview/overview.html

There is a previous IEEE submission linked from here and a poster:

 * http://www-d0online.fnal.gov/www/groups/cft/CTT/online/Overview/ctt_poster.pdf
 * http://www-d0online.fnal.gov/www/groups/cft/CTT/online/Overview/ieee_ctt.pdf

 * http://www-d0online.fnal.gov/www/groups/cft/CTT/online/ctt_main.html

 * http://www-d0.fnal.gov/~mommsen/CTTperformance.pdf

