# Carrier_specs
# Carrier blade specs

This is a working page on keeping track of requirements for the BU ATLAS/CMS Carrier blade.

Expect this to change often.

## Zone 2
 * Ethernet
 * CMS TTC

 * Parts parts parts
   * TE 1766500-1 Zone 1 connector
   * TE 6469001-1 Zone 2 connector
   * TE 1-1469373-1-ND Guide module
   * Schroff 20818-160 front panel/handle kit
   * Elma 66-536-28 panel
     * 81-300-00 and 81-301-01 handles
     * 81-088-1 microswitch


### P23 Connections (Base ethernet)


| P23 Row |  Port |  Pair | Base Channel | Function |
| --- --- |  ---- |  ---- | ---- ------- | -------- |
| 6       |  0   |  tx   | 2             | BI_DA (10/100 TX ) |
| 6       |  0   |  rx   | 2             | BI_DB (10/100 RX ) |
| 6       |  1   |  tx   | 2             | BI_DC   |
| 6       |  1   |  rx   | 2             | BI_DD  |
| 5       |  0   |  tx   | 1             | BI_DA (10/100 TX )|
| 5       |  0   |  rx   | 1             | BI_DB (10/100 RX ) |
| 5       |  1   |  tx   | 1             | BI_DC  |
| 5       |  1   |  rx   | 1             | BI_DD   |


### P23 Connections (CMS only)


| P23 Row | Port | Pair | CMS Function |
| --- --- | ---- | ---- | --- -------- |
| 4       |  0   | Tx   | LDAQ out 10Gb/s |
| 4       |  0   | Rx   | LDAQ in 10Gb/s |
| 4       |  1   | Tx   | Reserved STDIO  |
| 4       |  1   | Rx   | Reserved STDIO  |
| 3       |  2   | Tx   | TCDS2 Out (throttling, TTS+)  |
| 3       |  2   | Rx   | TCDS2 In (timing, TTC+) |
| 3       |  3   | Tx   | Precision Clock   |
| 3       |  3   | Rx   | LHC Clock    |

NOTE:  "Precision Clock" is reverse direction from standard!

## Zone 1 / Power

| ATCA PWR | 12V | stock (ATCA/12V) |price| power | notes |
| ---- --- | --- | ----- ---------- |-----| ----- | ----- |
| [GE PIM400](http://apps.geindustrial.com/publibrary/checkout/PIM400?TNR=Data%20Sheets|PIM400|generic) | [QBVW033A0B Power Module](http://apps.geindustrial.com/publibrary/checkout/QBVW033A0B?TNR=Brochures|QBVW033A0B|generic) | [mouser](https://www.mouser.com/GE-General-Electric/Power/DC-DC-Converters/Isolated-DC-DC-Converters/PIM400-Series/_/N-brwkv?P=1ykmeb3Z1yzf115) / [mouser](https://www.mouser.com/Search/Refine.aspx?Keyword=QBVW033A0B) | $72/$70 |400W| |
|| [ATCR250 ](https://www.artesyn.com/power/assets/atcr250_trn_1330574701_techref.pdf) | [digikey ](https://www.digikey.com/product-detail/en/artesyn-embedded-technologies/ATCR250-48D12-03J/454-1528-ND/2797405)| 242.14 | 250W | no blue LED supply. |
| [DIM3R3400 ](https://www.mouser.com/datasheet/2/632/DS_DIM3R3400-611244.pdf) | [Q48SC12033](https://www.mouser.com/datasheet/2/632/DS_Q48SC12033-372488.pdf) | [mouser](https://www.mouser.com/ProductDetail/Delta-Electronics/DIM3R3400SFA?qs=sGAEpiMZZMvGsmoEFRKS8JjZftvakwHMkx4fRJnX3SIAOg22KqhURw%3d%3d) / [mouser](https://www.mouser.com/ProductDetail/Delta-Electronics/Q48SC12033NRDH?qs=%2fha2pyFaduiV6RSi9tBHVhyFvppwHEErD4WHClezpllYDQpyWlWQAAgQnKiMSRwt) | $90 @ 45cnt(min) / $65 | 400 W | 12V has PMBus.  |
## Zynq
 *  [ZYNQ DBS](ZYNQ_DBS.md) - Zynq daughterboard information
## IPMC
 *  [CERN IPMC](https://espace.cern.ch/ph-dep-ESE-BE-ATCAEvaluationProject/PP_IPMC/SitePages/Home.aspx)
 * Power?
## Command module
 * Below is for each of two command module boards
 * So 2x the below for the double-width CMS command module
#### Power/LS connector
   * Mezz side P/N: ET60T–D02–3–08–000–S–R1–S  (Do we want to save a little space by using the Top guide post?)
   * Blade side P/N: ET60S-D02-3-08-000-S-R1-S
   * Power
     * 2 power blades (12V + return) @ 60A max
     * ~200 W per connetor
   * Low speed signals (~16)


  | pos | Row 1 | Row 2 | Row 3|
  | --- | --- - | --- - | --- -|
  | 1   | PWR_OK | gnd | UC_nRST |
  | 2   | TMS | gnd | TCK |
  | 3   | TDO | gnd   | TDI |
  | 4   | SDA sense IPMC | gnd | SCL sense IMPC |
  | 5   | TX IPMC | gnd | Rx IPMC |
  | 6   | TX ZYNQ | gnd | Rx ZYNQ |
  | 7   | PWR_ENA | gnd | ZYNQ GPIO2 |
  | 8   | ZYNQ GPIO3 | gnd | PS_RST |

#### High-speed connector
 * [ERF8-RA ](http://suddendocs.samtec.com/catalog_english/erf8_ra.pdf)
 * 2.2A per pin (2-powered)
 * Mezz side P/N: ERM8-013-01-L-D-RA-DS
 * Blade side P/N: ERF8-013-01-L-D-RA
 * 2 Tx and 2 Rx to the zynq.
 * pinout


  | Pos | Row 1(short) | Row 2(long) |
  | --- | --- -------- | --- ------- |
  | 1   | gnd   | gnd   |
  | 2   | Tx1-P | Tx2-P |
  | 3   | Tx1-N | Tx2-N |
  | 4   | gnd   | gnd   |
  | 5   | Rx1-P | Rx2-P |
  | 6   | Rx1-N | Rx2-N |
  | 7   | gnd   | gnd   |
  | 8   | HQ_CLK-P | LHC_CLK-P |
  | 9   | HQ_CLK-N | LHC_CLK-N |
  | 10  | gnd   | gnd   |
  | 11  | TTC-P | TTS-P |
  | 12  | TTC-N | TTS-N |
  | 13  | gnd | gnd |

## Mechanics
## carrier buses
## Ethernet
 * UW ESC


  |Port | type | use |
  |---- | ---- | --- |
  |     | QSGMII | zynq fabric |
  |     | SGMII | zynq arm |
  |     | 10/100 | IPMC |ZYNQ
  |     | 10/100/1G | SERVICES 1 |
  |     | 10/100/1G | SERVICES 2 |
  |     | 10/100/1G | Front Panel |
 * mac addrs?

## Serial number
 * EEPROM?

## Power supplies
 * 12V (current: mezz?)
 * 3.3V (current: ESC + IPMC?)
 * 5V (Zynq supply?)
 * 1.2V (CMS timing retimers)
 * 2.5V (CMS XP switch)
