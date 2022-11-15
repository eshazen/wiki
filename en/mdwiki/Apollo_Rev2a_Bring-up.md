# Apollo_Rev2a_Bring-up
## Assembly
 * remove first two rows of FP connector pin tips on the bottom (add kapton tape)
 * Metal FP + upper and lower switches.
   * Two Rounded head screw M2.5 x 5 mm 5306-11
   * Two Rounded head screw M2.5 x 8.3 mm 5441-38
   * ATCA microswitch (bottom connector)
 * ESM
   * two 4.5mm x 6mm hex M2.5 standoffs
   * two M2.5x6 screws (bottom)
   * two M2.5x4 screws (top)

## Base resistance

|          | SN-01 | SN-02 | SN-03 | SN-04 | SN-05 | SN-06 | SN-07 | SN-08  | SN-09 | SN-10 | SN-11  | SN-12 |
|          | ----- | ----- | ----- | ----- | ----- | ----- | ----- | -----  | ----- | ----- | -----  | ----- |
| 12V0     |   10k |   10k |   10k |  9.4k |  9.6k |  9.6k |  9.6k |  9.5k  |  9.5k |  9.5k |  9.5k  |  9.5k |
| 3V3 STBY |    63 |    56 |    63 |   63  |  64   |  64   |  64   |  64    |  64   |  64   |  64    |  64   |
| 3V0      |   14k |   24k |   14k |   14k |  14k  |  14k  |  14k  |  13.8k |  14k  |  14k  |  13.8k |  14k  |
| 4V5      |   14k |   24k |   14k |   14k |  14k  |  14k  |  14k  |  13.6k |  14k  |  14k  |  13.7k |  14k  |
| 1V8      |  1.0k |  1.2k |    1k |    1k |  1k   |  1k   |  1k   |  1k    |  1k   |  1k   |  1k    |  1k   |
| 3V3      |    1k |    1k |  1.1k |    1k |  1k   |  1k   |  1k   |  1k    |  1k   |  1k   |  1k    |  1k   |
| 1V8Z     |  3.8k |  3.8k |  3.8k |  3.8k |  3.8k |  3.8k |  3.8k |  3.8k  |  3.8k |  3.8k |  3.8k  |  3.8k |
| 3V3Z     |  3.8k |  3.8k |  3.8k |  3.8k |  3.8k |  3.8k |  3.8k |  3.8k  |  3.8k |  3.8k |  3.8k  |  3.8k |
| 3VZ      |   14k |   24k |   14k |   14k |  14k  |  14k  |  14k  |  13.7k |  14k  |  14k  |  14k   |  14k  |
| 4V5Z     |   9k |    13k |  9.2k |    9k |  9.2k |  9.2k |  9.2k |  9k    |  9k   |  9k   |  9k    |  9k   |
| -48VA    |   36k |   36k |   36k |   35k |  36k  |  36k  |  36k  |  36k   |  36k  |  36k  |  36k   |  36k  |
| -48VB    |   36k |   37k |   36k |   35k |  36k  |  36k  |  36k  |  36k   |  36k  |  36k  |  36k   |  36k  |

## Power up
 Test 1
 * Nothing installed: 48V @ 0.08A with 1A limit
    3V3 STBY OK

 Test 2
 * 12V en jumper 48V @ 0.14A
    3V3 STBY OK
    12V OK

 Test 3
 * Remove 12V en jumpter
 * Installed open ipmc

 Test 4
 * Installed ESM + IPMC 48V @ 0.18A

 Test 5
 * Install above + zynq (limit?)


| Test | SN-01 | SN-02 | SN-03 | SN-04 | SN-05 | SN-06 | SN-07 | SN-08 | SN-09   | SN-10 | SN-11 | SN-12  |
| ---- | ----- | ----- | ----- | ----- | ----- | ----- | ----- | ----- | -----   | ----- | ----- | -----  |
| 1    | 0.08A | 0.08A | 0.09A | 0.08A | 0.08A | 0.09A | 0.09A | 0.08A | 0.09A   | 0.09A | 0.09A | 0.09A  |
| 2    | 0.14A | 0.14A | 0.15A | 0.14A | 0.14A | 0.14A | 0.15A | 0.14A | 0.14A   | 0.14A | 0.14A | 0.14A  |
| 3    | 0.15A | 0.15A | 0.15A | 0.15A | 0.15A | 0.15A | 0.16A | 0.15A | 0.15A   | 0.15A | 0.15A | 0.15A  |
| 4    | 0.18A | 0.18A | 0.19A | 0.18A | 0.18A | 0.18A | 0.19A | 0.18A | 0.18A** | 0.18A | 0.18A | 0.18A  |
| 5    |       |       | 0.54A | 0.50A | 0.54A | 0.54A | 0.54A | 0.54A | 0.52A** | 0.54A | 0.54A | 0.45A* |

*: No boot media, no front panel board
**: Using ESM from SN-10 (ESM # 27)
