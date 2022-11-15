# Xilinx_Ethernet
This page contains design notes on logic implementation
of TCP/IP protocols.


## TCP/IP in Logic

Jeremy Mans "IPBUS"

 * [Spec](http://ohm.bu.edu/%7Ehazen/CMS/IPBUS_spec_v1_1.pdf)
 * [ipbus_12Apr10.zip](http://ehazen.web.cern.ch/ehazen/exch/ipbus_12Apr10.zip)
 * [Upgrade Software](http://cms1.bu.edu/~hazen/hcalUpgrade/)
*'TriDAS/hcal/hcalUpgrade/src/common/RequestResponse.cc* and
*'TriDAS/hcal/hcalUpgrade/include/hcal/upgrade/IPbusCore.hh* for Jeremy's library in C++.
## VHDL version of IPBUS for Spartan 6 chips
 * [old source files](http://ohm.bu.edu/~cdubois/Ethernet/slow_version.tar.gz)
 * [new source files](http://ohm.bu.edu/~cdubois/Ethernet/faster_version.tar.gz)
 * [text description](http://ohm.bu.edu/~cdubois/Ethernet/description.odt) &ndash; [PDF](http://ohm.bu.edu/~hazen/CMS/SLHC/IPBUS_VHDL_description.pdf)

## Speed Tests 8/4/2010
The latest version of the code (running at 1 Gbps connection speed) was tested to assess its proficiency at transmitting data.
50000 UDP requests and responses were generated in under 7 seconds. Each UDP response carried 1476 bytes of relevant data.
Therefore, the project is currently capable of 84Mbps data transfer rates or around 8% efficiency. It is not surprising that this
figure is so low--it takes the project at least as long to format its responses as it does to send them. Other such delays, on
both ends of the Ethernet cable and in both software and firmware, probably contribute similar latencies. For instance, running
Wireshark while this transfer occurs causes the process to happen about 30% slower. The same test took 11 seconds to complete
when it was run using a 100Mbs connection. This statistic implies a 54 Mbps transfer rate--mildly slower than at a 1Gbps connection
but significantly more efficient (54% rather than 8%). Almost all of the inefficiency at 100Mbps can therefore be attributed to
the board''s firmware and not deficiencies of the attached computer.

## WIZnet TCP/IP Chips

 * [Circuit Cellar Article](http://www.circuitcellar.com/archives/viewable/Eady208/index.html)
"iEthernet Bootcamp" &bull;
[PDF Version](http://www.circuitcellar.com/archives/viewable/Eady207/2711015Eady.pdf)
 * Uses [Wiznet](http://www.wiznet.co.kr/products_main.htm)
[here](http://www.saelig.com/miva/merchant.mvc?Screen=PROD&Product_Code=ETH027&Category_Code=ETH)
 * [W5100E Eval Board](http://www.wiznet.co.kr/pro_iin_w5100E01_avr.htm)
 * [W5100E Eval Board Software & Documentation](http://ohm.bu.edu/~pbohn/W5100E01-AVR_Demo_Board/)

# Papers

 * Microchip [App Note 1120](http://ohm.bu.edu/~hazen/DataSheets/Microchip/01120a.pdf)
 * [http://www.mhl.tuc.gr/research/publications/2005/DOLLAS_TCP_POSTER_83.pdf
  "An Open TCP/IP Core for Reconfigurable Logic"] &ndash; Technical University
 of Crete.  Very interesting... where is the core?
 * [http://ieeexplore.ieee.org/iel5/10643/33584/01596997.pdf?arnumber=1596997
 "An analysis of FPGA-based UDP/IP stack
parallelism for embedded Ethernet connectivity"] &ndash;
  Mälardalen University, Västerås, Sweden
 * [http://www.diva-portal.org/diva/getDocument?urn_nbn_se_liu_diva-2398-1__fulltext.pdf
  "EVALUATION OF PICOBLAZE AND IMPLEMENTATION OF A NETWORK INTERFACE"]
  &ndash; interesting but incomplete description of a Picoblaze MAC

### Embedded Software TCP/IP
 * [uIP](http://www.sics.se/~adam/uip/index.php/Main_Page)
 * [SuperK Project Page](http://ohm.bu.edu/cgi-bin/superk/Ethernet_Development)
  with information on micro-controller core based TCP/IP stacks

