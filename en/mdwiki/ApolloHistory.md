# ApolloHistory


### Possible Mezz-Blade Connectors

 * Samtec ET60T/ET60S (60A power, up to 24 low-speed signals)
 * Samtec ERF8/ERM8 (edge-rate diff pair up to 58Gbps)

Meetings:

 * https://indico.cern.ch/event/738681/ (2018-06-20)

*2018-05-31*

Thinking about a common blade for ATLAS L0MDT and CMS IT-DTC. \\
Issues with the current ATLAS design:

 * FMC stacking height at 8.5mm is too high

Issues with the current CMS design (Cornell one):

 * Really don't like the interposer concept with metal plates, springs etc
 * Prefer stand-alone mezzanine card operation

Plus, there are two different blade designs for no obvious reason.

First, looking at low stack height connectors, but not Z-ray.
(See Samtec [guide](http://suddendocs.samtec.com/literature/samtec-high-speed-b2b-design-guide.pdf))
Samtec families with low stack heights:


| *Family* | *Series* | *Stack Height* | *Notes* |
| -------- | -------- | ------ ------- | ------- |
| Sea-Ray | [LPAM](https://www.samtec.com/products/lpam)/[LPAF](https://www.samtec.com/products/lpaf) | 4mm |
| Edge Rate | [EDM6](https://www.samtec.com/products/edm6)/[EDF6](https://www.samtec.com/products/edf6) | 5mm |
| Q Series | [QTH](https://www.samtec.com/products/qth)/[QSH](https://www.samtec.com/products/qsh) | 5mm? | 28 Gbps+, pairs, power |
| | [QTE](https://www.samtec.com/products/qte)/[QSE](https://www.samtec.com/products/qse) | 5mm | 25A GND plane |
| Ultra-Micro | [EDM6](https://www.samtec.com/products/edm6)/[EDF6](https://www.samtec.com/products/edf6) | 5mm |
| | [LSS](https://www.samtec.com/products/lss)/[LSEM](https://www.samtec.com/products/lsem)/[LSHM](https://www.samtec.com/products/lshm) | 5mm |
| | [ST4](https://www.samtec.com/products/st4)/[SSR](https://www.samtec.com/products/ss4) | 4mm |

Below is a figure with dimensions excerpted from the ATCA standard.


| <img src="http://gauss.bu.edu/svn/atlas-phase-2-muon-upgrade/Meetings/2018-05-31_EDF/figs/stack_heights.png"> | Seems as if we can find a 4mm or 5mm solution.  \\ This gives us about 15.7mm above a mezzanine board for components. |
| ---- -------------------------------------------------------------------------------------------------------- | ----- -- -- -- --- ---- - --- -- --- ---------  -- ---- ----- -- ----- ------ ----- - --------- ----- --- ----------- |

Next, thinking about the logic.  Is it really that hard to make a common blade?  Here are some thoughts:

 * Build a blade to accommodate 3 mezzanine cards
 * Plan for only "low speed" mezz-to-mezz communications \\
  (SelectIO or < 10Gbps SERDES)
 * Mezzanine cards would have the optics on board along with DC/DC converters and regulators
 * Split the CMS IT-DTC into 3 parts
 * Eliminate the "blade FPGA" from the ATLAS design and designate one mezz card as "master" \\
  (this could be a different design).

*ATLAS requirements*

 * Sector logic

