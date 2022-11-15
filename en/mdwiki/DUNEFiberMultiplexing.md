# DUNEFiberMultiplexing

## Data Formats

On pages 4, 5 of the [COLDATA spec](http://ohm.bu.edu/~hazen/DUNE/COLDATA/Draft%20COLDATA%20Specification_v4.pdf) (v4)
there is a 56-word (16-bit words) format described for transmission in two links at "~1.2Gb/s".  One frame is sent each 500ns exactly in response to a "convert" command from the timing system.  There are no details (yet) specified on how the data is divided between the two links.

56 words with 8b10b encoding is 1120 bits.  Half per link is 560 bits which takes 467ns to send at 1.2Gb/s.

At 1.2Gb/s one can send 30 words of 16 bits (8b10b encoded).
For four channels (half the data) there are 24+1 words of ADC data and header bits.  This leaves
only 5 words for header etc.

Currently the protocol consists of the following (16-bit words):


| 1 | Start of Frame |
| - | ----- -- ----- |
| 2 | Checksum |
| 3 | Timestamp |
| 4 | Errors |
| 5 | Spare 1 |
| 6 | Spare 2 |
| 7 | ADC header S1-S4 |
| 8 | ADC header S5-S8 |
| 9..32 | ADC data S1-S4 |
| 33..56 | ADC data S5-S8 |

Constructing two independent blocks to transmit on the two 1.2Gb/s links is challenging.


## For one 10kT TPC:

One APA (analog plane assembly) has 2560 readout channels (20 readout boards, 128 channels each).

384k channels per 10

One "channel" is one 2MSPS 12 bit ADC.

Fibers to surface:  96 strands (duplex or simplex?) with 64 devoted to DAQ.

 * Multiple channels on one fiber using WDM (wavelength division multiplexing).  [ Useful article](http://www.transmode.com/en/technologies/wdm-the-transmode-way/wdm-the-transmode-way-html/2-wdm-networking-technologies) from some vendor
 * CWDM 10G XFP seem to be ~ $150
 * DWDM 10G XFP seem to be ~ $650
 * 8 channel simplex CWDM !Mux/Demux ~ $400 each
