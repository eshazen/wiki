# CMS_DCC_Input_Format
__Up to [Linear_Collider](Linear_Collider.md)

This page contains pointers to required documentation to successfully
transmit data to the CMS HCAL Data Concentrator Card (DCC).

This document contains most of what you need: [LRB Protocol/Connector Brief](http://ohm.bu.edu/~hazen/my_d0/TxRx/brief.pdf)
 * See [LRB Schematic Detail](http://joule.bu.edu/~hazen/LinearCollider/lrb_sch_cut.gif)
  for details of connections to channel link receiver for bit assignments.
 * The word-level format is described
[in this document](http://ohm.bu.edu/~hazen/my_d0/TxRx/LRB_V2_data_format.pdf)
 * [Detailed Data Format](http://joule.bu.edu/~hazen/LinearCollider/htr_data_format.pdf)
used by CMS.  We certainly don''t have to duplicate all of this!  However, if we
keep the first 8 and last 4 words more or less as-is then we can use the existing
DCC firmware to get started.

For reference, here are some pointers to the complete documentation:
 * [CERN Document Repository for DCC](http://cmsdoc.cern.ch/cms/HCAL/document/CountingHouse/DCC/)
 * [DCC Documenation Page at BU](http://ohm.bu.edu/~hazen/hcal/)
 * [Link Transmitter and Receiver Daughterboard](http://ohm.bu.edu/~hazen/my_d0/TxRx/)



