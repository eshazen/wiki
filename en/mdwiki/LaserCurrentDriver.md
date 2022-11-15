# LaserCurrentDriver





## Reference

 * SVN: http://gauss.bu.edu/svn/laser-driver-plenoptica
 * PCB dims:  http://gauss.bu.edu/svn/laser-driver-plenoptica/Docs/PCB_Dimensions.png
   * Max height:  12mm (top), 5mm (bottom)
 * http://www.aixiz.com/store/product_info.php/cPath/28/products_id/103
 * http://gauss.bu.edu/svn/laser-driver-plenoptica/Docs/Laser_diode_datasheet.pdf

## Meetings

*2018-10-04*

Met with Shivang Dave and Carlos Santago from plenoptika

Basic requirements:

 * Form factor about 0.4" x 0.8" x .04"
 * DC constant-current laser drive 0-80mA
 * CMOS 3.3V(?) logic enable (normally off, logic '1' to enable)
 * 3.3V power supply

Manufacturing in Spain, need to check about component technology preferences

## Parts Parts Parts

 * Nidec Copal tiny 11-turn trim pot (e.g. SM-3TW104) is 3.9L x 3.5W x 4.2H mm
 * LM358 Op-amp in 8-DFN package (2x2 mm)
 * Dual NPN common emitter e.g. QS5W2 in SOT-25T pkg (3x3 mm)
 * NPN power BJT e.g. ZXTN2010ZTA in SOT-89 pkg (4.5x4mm)
 * Non-volatile digital pot e.g. MAX5128 (2x2mm)



