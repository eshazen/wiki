# Time_Reversal_Mirror
## Documentation
 * [Time Reversal Mirror Single Channel Prototype](http://docs.google.com/View?id=dc392ct7_3gtdhzhg8)
 * [Design Documentation](http://ohm.bu.edu/~pbohn/TIME_MIRROR/Documentation/)
 * [PCB Layout Gerber Files](http://ohm.bu.edu/~pbohn/TIME_MIRROR/Design_Files/gerber/)
 * [PCB Power Supply Schematic](http://ohm.bu.edu/~eob/TRM_PS.sch)
 * [AD9271 Octal LNA/VGA/AAF/ADC](http://www.analog.com/en/analog-to-digital-converters/ad-converters/ad9271/products/product.html)


## C Program Test Software
 * [Latest software package](http://ohm.bu.edu/~cdubois/Waveform%20Mirror/software.tar.gz)
 * [Ethernet drivers](http://ohm.bu.edu/~cdubois/Waveform%20Mirror/C%20files.tar.gz)
 * [Waveform generator](http://ohm.bu.edu/~cdubois/Waveform%20Mirror/wave_generator.tar.gz)
   * [wavgen documentation (view)](http://docs.google.com/View?id=dc392ct7_17cngpgwcw)
   * [wavgen documentation (edit)](https://docs.google.com/Doc?docid=0AQ57FuC6l3MXZGMzOTJjdDdfMTdjbmdwZ3djdw&hl=en)


## Firmware

### External SRAM
 * [Source Code](http://ohm.bu.edu/~cdubois/Waveform%20Mirror/vhdl.tar.gz)

### Internal Memory
 * [Source Code](http://ohm.bu.edu/~cdubois/Waveform%20Mirror/vhdl2.tar.gz)
 * [(older) UCF File](http://ohm.bu.edu/~pbohn/TIME_MIRROR/Design_Files/Time_Mirror__ISE_ext/vhdl/full.ucf)

### Initial Test
 * [Test Firmware](http://ohm.bu.edu/~pbohn/TIME_MIRROR/Design_Files/backup/Time_Mirror_Test__ISE__2010-01-13__1.zip)

## Hardware Testing

### Preliminary Results

Setup Info

The plots below were created using an ADC with a sampling rate of 40 MHz and a .5 microsecond, square, positive-going pulse-wave.

The first image represents the pulse sent out from the op-amp (the blue pattern) and the corresponding analog signal sent into the ADC (the gray pattern). For the first 5 microseconds from the time the pulse is first sent out, the ADC is saturated. Then, after around 12 microseconds (which corresponds to 500 samples captured by the ADC), the first echo occurs--the very thin spike on the gray trace. After another 14 microseconds, a longer, secondary echo occurs.

The ADC''s interpretation of these events can be seen in the second image. Samples from the ADC are not being sent into the memory during the first 5 microseconds of chaos so that interval is excluded from the picture. However, the first and second echoes are present in much the same form and location as would be expected from looking at the oscilloscope patterns shown in the other image. A third echo is present in the plots from the ADC that would have been located somewhere far off to the right in the first image. The three different graphs are simply different magnifications of the same data.

The op-amp and amplification circuitry currently distort the pulse into a triangle-shaped peak around 1 microsecond wide. Also, when not active, the op-amp settles at a small (approximately 20 millivolt), but non-zero, voltage. This voltage accounts for the small, but perceptible, capacitor-charging curve overlaid with the pulses in the graphs of the second image. We are attempting to fix both these problems.

[image:scope_echo](image:scope_echo.md)

[image:adc_waveforms](image:adc_waveforms.md)

Note that, in these graphs, full range in the y-axis = 4000 counts = 75 millivolts and full range in the x-axis = 16000 samples = 400 microseconds.

## Design Discussion

Current plan is to use a XC3S500E [(datasheet)](http://www.xilinx.com/support/documentation/data_sheets/ds312.pdf)
in a PQ208 package, with an external synchronous SRAM.

For example, a Cypress CY7C1352G-133AXC [(datasheet)](http://download.cypress.com.edgesuite.net/design_resources/datasheets/contents/cy7c1352g_8.pdf)

This is a 256k x 18 133MHz synchronous static RAM (SRAM).
It requires a clock, which can be up to 133MHz (80MHz and 120MHz would be reasonable choices in our design).

If we ran it at 80MHz, we would get 18x2 or 36 bits per clock, so we could record three channels of Rx data.  In Tx mode there is only one channel, so there wouldn''t be a problem with 14 bits.


## Reference Information and Design Resources

 * "Novel Transmit Protection Scheme for Ultrasound Systems" &ndash;
  [Article Link](http://ieeexplore.ieee.org/stamp/stamp.jsp?arnumber=04037302)
 * "A new SPICE Model of Power P-I-N Diode Based on Asymptotic Waveform Evaluation" &ndash;
  [Article Link](http://ieeexplore.ieee.org/stamp/stamp.jsp?arnumber=00554165)

### Xilinx Digital Clock Manager
[DCM Search](http://xgoogle.xilinx.com/search?getfields=*&numgm=5&filter=0&proxystylesheet=xilinx&client=xilinx&site=EntireSite&btnG=Google+Search&output=xml_no_dtd&sort=date:D:L:d1&ie=UTF-8&oe=UTF-8&requiredfields=-status:archive&q=Digital+Clock+Manager&submit2.x=0&submit2.y=0&submit2=Search&lang2search=)

### LVDS Information
 * [Collection of Documents](http://ohm.bu.edu/~pbohn/TIME_MIRROR/Research/LVDS/)

