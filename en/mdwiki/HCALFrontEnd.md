# HCALFrontEnd

 * [HCALngFEC](HCALngFEC.md) *Work log* for firmware/software at BU
 * [HCAL FE Documentation](http://cmsdoc.cern.ch/cms/HCAL/document/upgrade/upgrade.html)
 * [HCALngFEC_Firmware_Notes](HCALngFEC_Firmware_Notes.md) -- reverse-engineering notes about ngFEC / server
 * [HCALngFEC_FirmwareChanges2017](HCALngFEC_FirmwareChanges2017.md) -- Update work for 2.4Gbps link etc notes
 * [HCALngFECRecipes](HCALngFECRecipes.md) -- simple (we hope) documentation on how to perform specific tasks with ngFEC/ngCCM

 * [HCALFrontEndDebugLog](HCALFrontEndDebugLog.md) for work at CERN

 * [Ted's FE plan](http://ohm.bu.edu/~hazen/CMS/HCAL_FE/ted_fe_plan_2019.txt) from 1/28/19 with ngFEC counting

 * *Emergency* recovery from corrupted SD card:
 [ How_to_prepare_an_SD_card](https://twiki.cern.ch/twiki/bin/viewauth/CMS/HCALngFEC#How_to_prepare_an_SD_card)

ngFEC docs (not entirely up to date according to Alan Campbell):

 * https://twiki.cern.ch/twiki/bin/view/CMS/HCAL/NgCCMHEHBProd
 * https://twiki.cern.ch/twiki/bin/viewauth/CMS/HCALngFEC
 * https://twiki.cern.ch/twiki/bin/viewauth/CMS/HCALngFECprotocol
 * https://twiki.cern.ch/twiki/bin/viewauth/CMS/HCALngFECvariableNames
 * https://cms-docdb.cern.ch/cgi-bin/DocDB/ShowDocument?docid=12018

Hardware:

 * FC-7 schematics and manual:  http://ohm.bu.edu/~hazen/CMS/FC-7/

Firmware:

 * https://svnweb.cern.ch/trac/cms-firmwsrc/browser/hcal/HCAL_ngFEC_fc7 (browse)
 * https://svnuser@svn.cern.ch/reps/cms-firmwsrc/hcal/HCAL_ngFEC_fc7/ (checkout)

Stephens half-speed version (GLIB only for Virtex-6):
 * http://ohm.bu.edu/~hazen/CMS/HCAL_FE/glibv2-ngccm-fec.zip

Address tables seem to be in `/opt/ngFEC/ngccm-0.0.12-02.el6/opt/ngccm/etc` on cms4 at the moment.

Server software:

 * https://gitlab.cern.ch/cms-hcal-ngccmserver/ngccmserver
 * [BuildEditCCMServer](BuildEditCCMServer.md) Procedure for editing/building ngccmserver code


*Fiber Connections*:  "A" fiber on bottom at both ends (opposite of what I would expect).

Power wiring according to Joe:

On each of the 2 cards in the LV box there are 3 lugs.  One is labeled V+, one GND, one shield.  The shield connection is for the grounding of the outer braid shield on the LV cables and as you have no RBX housing to connect it to, it can be left disconnected or attached to power supply ground as is appropriate with the cable you have available.  Then each of the 2 PCBs inside the LV box should be connected to +10V and ground on your power supply in the V+ and GND terminals respectively.  Both V+ terminals connect to the same power plane on the backplane, and both GND connectors connect to backplane GND plane.

WARNING!  The pair of power boards will fit either way on the backplane; check orientation before applying power!
