# QuadPulserPowerConverter
### ExpressPCB DC Converter Board Rev A

Revsion 1 - ExpressPCB board with 12V input and output programmable by resistor in the 1-5.5V range
with max current 2.25A.  (uses [PTH08080W](http://www.ti.com/lit/ds/symlink/pth08080w.pdf) converter from TI).

 * [SVN](http://gauss.bu.edu/svn/g2-quad-pulser.hardware/DC_Converter/tags/RevA)
   * [Schematic](http://gauss.bu.edu/svn/g2-quad-pulser.hardware/DC_Converter/tags/RevA/dc_converter_sch.pdf)
   * [Layout](http://gauss.bu.edu/svn/g2-quad-pulser.hardware/DC_Converter/tags/RevA/dc_converter_pcb.pdf)

This seemed to work OK powering Rev C ADC boards except that a series resistor was required
on the 3.7V otherwise the converter wouldn't start.  Probably too much inrush current.

Also, we need 5V on the board to power the Op-amps and level shifters, not certain the 5.5V max
output from this thing will do.

### ExpressPCB DC Converter Board Rev B

New layout using muRata converters, with 14 pin header for connection to ADC board.

 * [SVN](http://gauss.bu.edu/svn/g2-quad-pulser.hardware/DC_Converter/trunk/)
   * [Schematic](http://gauss.bu.edu/svn/g2-quad-pulser.hardware/DC_Converter/trunk/dc_converter_sch.pdf)
   * [Layout](http://gauss.bu.edu/svn/g2-quad-pulser.hardware/DC_Converter/trunk/dc_converter_pcb.pdf)

