# Fast_WFDs
This page documents a proposed 12-bit WFD for PMT pulse digitization.
The goal is initially to engineer an ADC/FPGA/memory block which is
relatively straightforward and which could be replicated to produce
a multi-channel unit with a (unspecified as of now) computer interface.

Some guideline specs for a production unit:

 * 12 or more bits resolution
 * 250MSPS or faster digitization
 * Front-end with 250MHz bandwidth to support interleaving
  of two FADCs at 500MSPS (or 500MSPS ADC).  12 bit analog performance,
  capable of 0.1mV least count operation.
 * generic memory interface (SDRAM) capable of 2x ADC speed
  (500MB/sec) throughput.
 * 50 ohm single-ended DC-coupled analog input, with adjustable gain
  and DC offset.
 * Baseline adjust such that both negative-going and positive-going
  signals can be accommodated
 * Convenient mechanism to combine multiple channels to extend
  dynamic range in pulse height or time (interleaving).

I would suggest an initial prototype with the following characteristics:

 * 50 ohm input, providing 0-4.095V (1mV/count) and 0-409.5mV (0.1mV/count)
  ranges.
 * On-board digitizer clock source, with external (sine wave) clock option
 * Suitable FADC and FPGA (Xilinx)
 * SDRAM with sufficient bandwidth
 * Ethernet (or USB-2) interface

*'1GSPS and Beyond*

 * [ADC12D500RF](http://www.ti.com/product/adc12d500rf)
 * [ADS5400](http://www.ti.com/product/ads5400)
 * [ADC12D1000](http://www.ti.com/product/adc12d1000)
 * [ADC10D1000](http://www.ti.com/product/adc10d1000)
 * [MAX104](http://www.maxim-ic.com/datasheet/index.mvp/id/2026)
 * [EV10AQ190TPY](http://ohm.bu.edu/~hazen/DataSheets/E2V/EV10AQ190(2).pdf)


*'Candidate ADCs*

 * [AT84AS001](http://www.atmel.com/dyn/resources/prod_documents/5412s.pdf)
 &bull; [now e2v](http://www.e2v.com/products/ccd-and-cmos-imaging-and-semiconductors/broadband-data-converters.cfm)
 &bull; 5/09 Arrow $163 ea
 * [ADS5463](http://focus.ti.com/lit/ds/symlink/ads5463.pdf)
  sample received.  ($135 ea @ 1k per TI website 3/2012)
   * [500MSPS_Prototype](500MSPS_Prototype.md)
 * [ADS5444](http://focus.ti.com/docs/prod/folders/print/ads5444.html) (13 bits, 250MSPS) - stock on 8/23/06 ($76 ea @100) [have_samples](have_samples.md)
 * [ADS5440](http://focus.ti.com/docs/prod/folders/print/ads5440.html)
 * [AD9230](http://www.analog.com/en/prod/0%2C%2CAD9230%2C00.html)
 * [MAX1215](http://www.maxim-ic.com/quick_view2.cfm/qv_pk/4768)
 * [LTC2242-12](http://www.linear.com/pc/productDetail.do?navId=H0,C1,C1155,C1001,C1150,P19597) (12 bits, 250MSPS) [have_samples](have_samples.md)

*'Other Parts*
 * [THS4509](http://focus.ti.com/docs/prod/folders/print/ths4509.html) wideband differential op-amp [have_samples](have_samples.md)
  Recommended to drive ADS5444.  _'As of 4/5/07:_ THS4509RGTT 163pcs stock at Digikey 8.30
in small qtys, 5.60250 100pcs other distributers have stock as well

### Existing Products

 * [Acquris](http://www.acqiris.com/)
   * [DC440](http://www.acqiris.com/products/digitizers/12-bit-cpci-6u-digitizers/dc440.html)

