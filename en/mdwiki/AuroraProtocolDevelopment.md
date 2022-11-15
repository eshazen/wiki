# AuroraProtocolDevelopment
This page will document development work on an efficient Aurora 66b/64b protocol decoder block for use the the CMS IT-DTC and potentially other applications.

In the IT-DTC, Aurora-encoded data will be received at 32 bit words every 25ns (40MHz word rate), for an equivalent bit rate of 1.28 Gbps.  The challenge is to develop an efficient decoder which can acquire synchronization to the 66 bit frames and deliver decoded (descrambled) data to the output.

Note that in a typical Aurora application (as described in the Xilinx documentation, e.g.) the data is received directly by a deserializer and processed one bit at a time.  In our case instead we receive the data as 32-bit words from the lpGBT-FPGA decoder core.

## August 2019

A receiver and descrambler was created to handle the Aurora-encoded data. The design of the rx module mirrors the overall structure laid out in the MSU Thesis refrence.

SVN:  http://gauss.bu.edu/svn/cms-tracker/TestFirmware/Aurora

The following tables show the resource utilization for a single module of the rx_body
 * [xc7a100tcsg324-1](http://gauss.bu.edu/svn/cms-tracker/TestFirmware/Aurora/branches/resource_test/documentation/table.txt)
 * [xcku5p-sfvb784-1-e](http://gauss.bu.edu/svn/cms-tracker/TestFirmware/Aurora/branches/resource_test/documentation/table2.txt)


-Michael Kremer

## Reference

 * LPGBT: [ACES 2016 talk](https://indico.cern.ch/event/468486/contributions/1144369/attachments/1239839/1822836/aces.2016.03.08.pdf) [ACES 2018 talk](https://indico.cern.ch/event/681247/contributions/2928992/attachments/1638547/2615288/aces2018_kulis_lpgbt.pdf) [Tutorial](https://indico.cern.ch/event/697988/contributions/3075493/attachments/1720215/2776777/lpGBTtutorialTwepp20180921.pptx)
 * GBT-FPGA [Project page](https://espace.cern.ch/GBT-Project/GBT-FPGA/default.aspx) [Documentation](http://lpgbt-fpga.web.cern.ch/doc/html/)
 * Aurora protocol [specification](https://www.xilinx.com/support/documentation/ip_documentation/aurora_64b66b_protocol_spec_sp011.pdf) (Xilinx) * [10 GbE](http://ohm.bu.edu/~hazen/DataSheets/Ethernet/802.3-2008_section4.pdf) page 262+
 * MSU Thesis: http://cds.cern.ch/record/2631488/files/CERN-THESIS-2018-100.pdf?subformat=pdfa&version=1
 * [scrambler/descrambler](http://gauss.bu.edu/svn/cms-tracker/Reference/scramble/scrambler_figures.pdf) block diagram
