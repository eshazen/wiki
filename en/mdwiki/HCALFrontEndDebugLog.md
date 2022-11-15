# HCALFrontEndDebugLog
Nav:  [HCALFrontEnd](HCALFrontEnd.md)

*2017-02-10*

There are 39 ohm series R on BKP-JTAG-TCK on the control board (R2).  Replace with larger value, certainly improves signal integrity.  See eLog:  [966892](http://cmsonline.cern.ch/cms-elog/966892).  Tullio suggests further work, see [eMails](http://joule.bu.edu/~hazen/CMS/HCAL_FE/JTAG_Email_11Feb2017.txt).


schematics:
 * HBHE ngCCM: https://cms-docdb.cern.ch/cgi-bin/DocDB/ShowDocument?docid=13096
 * HBHE backplane: https://cms-docdb.cern.ch/cgi-bin/DocDB/ShowDocument?docid=12784
 * HBHE QIE card: https://cms-docdb.cern.ch/cgi-bin/DocDB/ShowDocument?docid=12782 (pag2 B2 you can see the 0ohm resistors Joe was pointing to)
 * https://indico.cern.ch/event/507473/ Useful PRR talks

svn repository:
 * ngFEC: https://svnweb.cern.ch/trac/cms-firmwsrc/browser/hcal/HCAL_ngFEC_fc7/trunk
 * ngCCM: https://svnweb.cern.ch/trac/cms-firmwsrc/browser/hcal/HBHE_ngCCM
 * https://svnweb.cern.ch/trac/cms-firmwsrc/browser/hcal/HF_ngCCM/igloo2_UMD_mezz
