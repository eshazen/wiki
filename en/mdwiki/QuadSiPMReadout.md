# QuadSiPMReadout
This is a readout board for a Sensl 2x2 SiPM.

 * SVN: http://gauss.bu.edu/svn/sipm-breakout/bifano2019/

# Summer 2019
Version 1 of the SiPM readout board was developed. The purpose of this board is to have variable gain from the output of a four-channel SiPM package and to reduce noise in the readout.
## Rev 1
Version 1 adds a single stage of variable amplification to each of the four SiPM output channels. Output from the SiPM is amplified with OPA656s and gain is adjusted onboard with potentiometers.[BR](BR.md)Power into the SiPM is supplied by a SMA connector and power for the Op-Amps is provided by a 4-pin header.[BR](BR.md)To reduce noise all components used other than the SMA connectors, Dip socket for the SiPM, and 4-pin header are surface mounted.
## Documentation
 * BOM: [CSV](http://gauss.bu.edu/svn/sipm-breakout/bifano2019/Docs/SiPM.csv) [PDF](http://gauss.bu.edu/svn/sipm-breakout/bifano2019/Docs/BOM.pdf)
 * [Schematic](http://gauss.bu.edu/svn/sipm-breakout/bifano2019/Docs/Schematic.png)
 * PCB: [View 1](http://gauss.bu.edu/svn/sipm-breakout/bifano2019/Docs/PCB1.png) [View 2](http://gauss.bu.edu/svn/sipm-breakout/bifano2019/Docs/PCB2.png)
 * [Gerber files](http://gauss.bu.edu/svn/sipm-breakout/bifano2019/readoutPCB/trunk/BostonU_SiPM_readout_RevA.zip)
Datasheets
 * [SiPM Datasheet](http://sensl.com/downloads/ds/DS-MicroCseries.pdf)
 * [SiPM user manual](http://azimp.ru/upload/pdf-static/SensL/pdf/UM-ArrayC-60035-4P.pdf)
 * [Documentation on SiPM SMA readout](https://www.onsemi.com/pub/Collateral/AND9787-D.PDF)
 * [OPA656 Datasheet](http://www.ti.com/lit/ds/symlink/opa656.pdf)
