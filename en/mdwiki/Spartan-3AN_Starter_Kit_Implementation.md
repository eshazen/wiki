# Spartan-3AN_Starter_Kit_Implementation
## Serial Interface Documentation


 * [PicoBlazeControlBlockReleaseNotes](PicoBlazeControlBlockReleaseNotes.md)


## Example Serial Controlled Tests

### Test 1 - Auto Scale On
```
  $w 8 0003      Enable test mode, auto scale
  $w c 1000      Set measurement clock to 4ms period (in microsecond units)
  $w d 0100      Set phase detector period to 256 measurement clocks
  $w e 007f      Enable 7 bits randomness on period (0x100-0x17f random)
  $w 1 1000      Set delay to 25% of maximum value 16383(0x3fff)
  $w 2 2000      Set width to 50%

```
### Test 2 - Auto Scale Off - Non-Error State
```
  $w 8 0003      Enable test mode, auto scale
  $w c 03e8      Set measurement clock to 1ms period (hex number is in microsecond units)
  $w d 1000      Set phase detector period to 4096 measurement(timing) clocks
  $w 1 1000      Set delay to 25%
  $w 2 2000      Set width to 50%

```
### Test 3 - Auto Scale Off
```
  $w 8 0001      Enable test mode, auto scale off
  $w c 0014      Set measurement(timing) clock to 20 micro second period
  $w d 0064      Set phase detector period to 100 measurement(timing) clocks
  $w 1 000a      Set delay to 10 measurement(timing) clocks
  $w 2 000a      Set width to 10 measurement(timing) clocks (i.e. 200uS duration)

```
### Test 4 - Auto Scale Off - Non-Error State
```
  $w 8 0001      Enable test mode, auto scale off
  $w c 03e8      Set measurement clock to 1ms period (hex number is in microsecond units)
  $w d 06a4      Set phase detector period to 1700 measurement(timing) clocks
  $w 1 0000      Set delay to 0
  $w 2 0064      Set width to 100 measurement(timing) clocks (i.e. 100mS duration)

```
[Scope Captures](http://ohm.bu.edu/~pbohn/Bio_Delay_Generator/Documentation/scope_captures)

## Error Cases

#### Set Error if:
 * 10 micro seconds < *'timing clock period* < 2047 micro seconds
 * 1638 timing clocks < *'phase detector period* < 16383 timing clocks


## Serial Interface Registers
```
  REG   READ/WRITE
  0	status register
  1     delay_value (shutter delay, 14 bits, read or write)
  2	width_value (shutter width, 14 bits, read or write
  3	pp_delay_count (last measured phase detector period (16 bits, read only)
  4	cp_width_count (current width count, constantly changing)
  5	cp_delay_count (current delay count, constantly changing)
  6	scaled_delay (scaled delay value)
  7	scaled_width (scaled width value)
  8	control
  9	-not used-
  a	last measured timing clock period in us
  b	-not used-
  c	test generator- timing clock period in us
  d	test generator- phase detector delay period in timing clocks
  e	test generator- phase detector jitter mask (0 for no jitter)
  f	test generator- not used

```

## Board Button and Switch Assignments =

### Push Buttons
 * Delay Increment Coarse  -- West (loc=U15)
 * Delay Decrement Coarse  -- South (loc=T15)
 * Width Increment Coarse  -- East (loc=T16)
 * Width Decrement Coarse  -- North (loc=T14)

### Slide Switches
 * Reset  -- SW0
 * Auto Scale  -- SW1
 * Shutter Enable -- SW2
 * Shutter Cascade -- SW3

### Rotary Encoder
 * TC_DIVIDER -- ROT_A, ROT_B (select timing clock freq by rotating encoder)

## Board I/O and Pin Assignments

### Inputs: 6-pin header J18 Pins




### Outputs: 6-pin header J20 Pins





### LEDS ====
 * LD0 -- Test Phase Detector
 * LD1 -- Test Timing Clock
 * LD2 -- Shutter
 * LD7 -- Error


