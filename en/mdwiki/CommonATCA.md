# CommonATCA
  = Project APOLLO =


| <img src="http://ohm.bu.edu/~hazen/APOLLO/figs/apollo_200.png"> | This is a project to develop a common ATCA blade which can be used for readout and triggering applications in LHC experiments.  It is named after the Apollo program CSM spacecraft which separated into Command and Service modules. | <a href="http://ohm.bu.edu/~hazen/APOLLO/gallery/"><img src="http://ohm.bu.edu/~hazen/APOLLO/gallery/cm.jpg"></a> [Photos](http://ohm.bu.edu/~hazen/APOLLO/gallery) |
| ---- ---------------------------------------------------------- | ---- -- - ------- -- ------- - ------ ---- ----- ----- --- -- ---- --- ------- --- ---------- ------------ -- --- ------------  -- -- ----- ----- --- ------ ------- --- ---------- ----- --------- ---- ------- --- ------- -------- | -- ---------------------------------------------------- --------------------------------------------------------- ------------------------------------------------- |


## Debug Log
 * [Apollo Rev2a Bring-up](Apollo_Rev2a_Bring-up.md) -- *Please log all debugging activity here*
 * [Apollo RevB Bring-up](Apollo_RevB_Bring-up.md)
 * [Apollo RevA](Apollo_RevA.md)

## Quick Links
 * [Apollo Manual](https://apollo-lhc.gitlab.io/)
 * [Apollo Inventory](http://ohm.bu.edu:8000/login)
 * TWEPP 2019 paper: [arXiv:1911.06452](http://arxiv.org/abs/1911.06452) [Talk](http://gauss.bu.edu/svn/common-atca-blade/Meetings/2019-09-03_TWEPP/APOLLO-Hazen.pdf)
 * Monitoring at [BU](https://edf.bu.edu/shelf_data/d/TWjb6eUZk/fantrays?orgId=1&refresh=30s)
 * Mechanical Drawing: https://ohm.bu.edu/~hazen/APOLLO/APOLLO_MECH.pdf


## Remote Users
 * [Remote Access Instructions](Remote_Access_Instructions.md)
 * Blade and IPMC IPs at BU [https://ohm.bu.edu/~apollo/shelf_status.html]
 * Blade IPs at the TIF [here](https://twiki.cern.ch/twiki/bin/viewauth/CMS/Ph2TrackerTIF).
 * [BU SM status (realtime)](http://cmssun1.bu.edu/cgi-bin/index.cgi)


## HW
 * [Apollo Inventory](Apollo_Inventory.md) -- List of boards with location and status (including MAC/IP addresses)

## SM
 * Hardware !GitHub:  https://github.com/apollo-lhc ([Service Module](https://gitlab.com/apollo-lhc/apollosm-hw))
   * (historical) SVN:  http://gauss.bu.edu/svn/common-atca-blade.hardware (BU Service Module)

### Rev 2a

   * [pdf](https://gitlab.com/apollo-lhc/apollosm-hw/-/blob/03de221c32f0bd3c494af8b6b18e334daf6975f3/pdf/carrier.pdf)

### Rev 2
 * [Rev2 SoCs](Rev2_SoCs.md) (list of compatible SoCs)
 * [ApolloKiraAdapter](ApolloKiraAdapter.md) (sic) project to make an adapter for XIlinx "Kria" modules
 * [ServiceModuleRev2ECOList](ServiceModuleRev2ECOList.md) -- list of ECOs for the Rev 2 service module

 * Rev 2 Schematics:
   * Service module (Boston): [](attachments/)

### Rev 1/A
 * Rev 1 Schematics:
   * Service module (Boston): [carrier.pdf](http://gauss.bu.edu/svn/common-atca-blade.hardware/Blade/tags/RevA-AsBuilt/pdf/carrier.pdf)
   * FrontPanelBoard: [schematic](http://gauss.bu.edu/svn/common-atca-blade.hardware/Blade_FP/trunk/Blade_FP.pdf) &bull; [pcb](http://gauss.bu.edu/svn/common-atca-blade.hardware/Blade_FP/trunk/board.pdf)
   * FacePlateMechanics
 * Comments / ECOs
   * `EN_ONE_JTAG_CHAIN` should have a pull-up/down and/or jumper so something sensible happens when the IPMC is not installed or programmed.
   * Serial comms between Zynq and CM should be possible without IPMC intervention.
   * How to turn on payload power with no IPMC installed/running?
   * JTAG (and other GPIO) signals must obey ENABLE/READY to avoid driving CM logic when not powered
   * [ServiceModuleRevAECOList](ServiceModuleRevAECOList.md) -- list of ECOs for the Rev A service module


## CM

   * Hardware: [Github](https://github.com/apollo-lhc) (Cornell)
   * [BuTestCM](BuTestCM.md) - 2022 development of new, simple CM for testing
   * [CM-SM Dev](CM-SM_Dev.md)



## IPMC
 * [ApolloIPMC](ApolloIPMC.md) -- Documentation on IPMC for Apollo (see also [CERN IPMC](https://cern-ipmc.web.cern.ch/) page)


## ATLAS
 * DRAFT specification (ATLAS specific for now):  [common_blade.pdf](http://gauss.bu.edu/svn/atlas-phase-2-muon-upgrade/Documents/Proto0_Blade/trunk/common_blade.pdf)



## Purchasing
 * [FPGAs](http://ohm.bu.edu/~hazen/Private/Latest%20Apollo%20FPGA%20delivery%20estimates%20from%20AVNET.eml.txt)
 * Others: [Serenity](http://serenity.web.cern.ch/serenity/) APX?
 * [TODOs](TODOs.md)


### Info and Help
 * [Apollo SM recipes](Apollo_SM_recipes.md)
 * [Apollo SM troubleshooting](Apollo_SM_troubleshooting.md)




## Software
 * UIOuHAL [Slides 10-12](https://gauss.bu.edu/redmine/projects/common-atca-blade/repository/raw/Meetings/2019-08-19/Apollo-Update.pdf) [GITHUB UIOuHAL](https://github.com/dgastler/ipbus-software/tree/feature-UIOuHAL)
 * BUTool+ApolloSM single [checkout](https://github.com/apollo-lhc/ApolloTool)
 * [ApolloSM Software ToDo](ApolloSM_Software_ToDo.md) -- ApolloSM Software To-Do-List
## Firmware
 * [SM Zynq](SM_Zynq.md) [SM IPMC](SM_IPMC.md)
 * [CMS CM Kintex](CMS_CM_Kintex.md) [CMS CM Virtex](CMS_CM_Virtex.md) [CMS CM uC](CMS_CM_uC.md)
