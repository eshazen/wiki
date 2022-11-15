# ZyboNotes
UP: QuadPulser


Note that this is the original Zybo, not the newer Z7-10 or Z7-20 boards.
This is required because we need four (double) high-speed PMOD connectors.

 * [Digilent Page](http://store.digilentinc.com/zybo-zynq-7000-arm-fpga-soc-trainer-board/) for Zybo
 * [Reference Manual](https://reference.digilentinc.com/reference/programmable-logic/zybo/reference-manual)

ADC board pin to adapter header pin mapping:


| *ADC Net* | *FMC Pair* | *Adapter* |
| ---- ---- | ---- ----- | --------- |
| CLK_OUT       | H4/H5          | P1-1,2        |
| DATA_OUT      | H7/H8          | P1-3,4        |
| DATA_IN       | H10/H11        | P2-1,2        |
| FMCCLK2       | G30/G31        | P2-3,4        |
| FMCCLK1       | C2/C3          | P3-1,2        |
| PWR_ENA       | C26            | P3-3          |

Chip used is Xilinx Zynq-7000 (XC7Z010-1CLG400C).  Pinout details for PMOD I/O below.

High speed PMOD A/B


| *Pmod JA (XADC)*  | |          	   | *Pmod JB (Hi-Speed)* | |
| ----- -- -------  | |          	   | ----- -- ----------- | |
| JA1: N15        | IO_L21P_T3_DQS_AD14P_35  |  | JB1: T20        | IO_L15P_T2_DQS_34  |
| JA2: L14        | IO_L22P_T3_AD7P_35       |  | JB2: U20        | IO_L15N_T2_DQS_34       |
| JA3: K16        | IO_L24P_T3_AD15P_35      |  | JB3: V20        | IO_L16P_T2_34   |
| JA4: K14        | IO_L20P_T3_AD6P_35       |  | JB4: W20        | IO_L16N_T2_34   |
| JA7: N16        | IO_L21N_T3_DQS_AD14N_35  |  | JB7: Y18        | IO_L17P_T2_34   |
| JA8: L15        | IO_L22N_T3_AD7N_35       |  | JB8: Y19        | IO_L17N_T2_34   |
| JA9: J16        | IO_L24N_T3_AD15N_35      |  | JB9: W18        | IO_L22P_T3_34   |
| JA10: J14       | IO_L20N_T3_AD6N_35       |  | JB10: W19       | IO_L22N_T3_34      |

High speed PMOD C/D


| *Pmod JC (Hi-Speed)*  |        | | *Pmod JD (Hi-Speed)* |           |
| ----- -- -----------  |        | | ----- -- ----------- |           |
| JC1: V15        | IO_L10P_T1_34    | | JD1: T14        | IO_L5P_T0_34       |
| JC2: W15        | IO_L10N_T1_34    | | JD2: T15        | IO_L5N_T0_34       |
| JC3: T11        | IO_L1P_T0_34     | | JD3: P14        | IO_L6P_T0_34       |
| JC4: T10        | IO_L1N_T0_34     | | JD4: R14        | IO_L6N_T0_VREF_34  |
| JC7: W14        | IO_L8P_T1_34     | | JD7: U14        | IO_L11P_T1_SRCC_34 |
| JC8: Y14        | IO_L8N_T1_34     | | JD8: U15        | IO_L11N_T1_SRCC_34 |
| JC9: T12        | IO_L2P_T0_34     | | JD9: V17        | IO_L21P_T3_DQS_34  |
| JC10: U12       | IO_L2N_T0_34     | | JD10: V18       | IO_L21N_T3_DQS_34  |

Standard PMOT E and MIO PMOD F


| *Pmod JE* |                     | | *Pmod JF (MIO)* |          |
| ----- --- |                     | | ----- -- ------ |          |
| JE1: V12        | IO_L4P_T0_34      | | JF1: MIO-13    | PS_MIO13_500  |
| JE2: W16        | IO_L18N_T2_34     | | JF2: MIO-10    | PS_MIO10_500  |
| JE3: J15        | IO_25_35          | | JF3: MIO-11    | PS_MIO11_500  |
| JE4: H15        | IO_L19P_T3_35     | | JF4: MIO-12    | PS_MIO12_500  |
| JE7: V13        | IO_L3N_T0_DQS_34  | | JF7: MIO-0     | PS_MIO0_500   |
| JE8: U17        | IO_L9N_T1_DQS_34  | | JF8: MIO-9     | PS_MIO9_500   |
| JE9: T17        | IO_L20P_T3_34     | | JF9: MIO-14    | PS_MIO14_500  |
| JE10: Y17       | IO_L7N_T1_34      | | JF10: MIO-15   | PS_MIO15_500  |
