# Costanza_Email_2017-03-25


Dear Eric, Tullio,

I have committed the first version of the ngFEC fw that uses Vivado in a separate branch of the SVN repository. You can checkout the code using this link:
https://svn.cern.ch/reps/cms-firmwsrc/hcal/HCAL_ngFEC_fc7/branches/HB_HE_FC7_Vivado

The instructions to include the latest FC7 system fw, GBT-FPGA core and IPBUS core are in the readme file stored in the repository:
https://svnweb.cern.ch/trac/cms-firmwsrc/browser/hcal/HCAL_ngFEC_fc7/README.txt

Please let me know if you encounter any difficulties setting up the ngFEC project so that I can help you and update the instructions.

In this version of the fw, I am using the LATENCY_OPTIMIZED version of GBT on both Tx and Rx. In this way, the link is stable and I do not observe errors. On the other hand this means that I have to use one MMCM per link, so I decided to instantiate only 6 links and remove the phase monitoring recommended by Paschalis (which uses 2 more MMCMs).

Next week I'll test this version at 904 and try to improve the resource utilization so that I can at least fit the phase monitoring tool.

Best regards,
Francesco
