# LCD_on_Nexys3
Driving an eBay 640x480 LCD from a Digilent Basys 3.  Built a breakout board to connect the 33 pin FFC cable to 3 PMOD connectors.

 * LCD:  [VGA LCD](https://ebay.us/zFxD4P) or [Datasheet](http://ohm.bu.edu/svn/edf/EricHome/Z80System/documents/VGG644803-6UFLWB-EVERVISION.pdf)

Another idea is to use a [CMOD-A7](https://digilent.com/shop/cmod-a7-breadboardable-artix-7-fpga-module/).  This has a 512Kx8 (asynchronous, easy-to-use) SRAM which is plenty for color video (12 bits at 640x480 for example).  A pseudo-RAMDAC could trivially be implemented in the FPGA logic.  A picoblaze could run the terminal logic.

Reproducing VGA modes (60Hz) (from [blog](https://timetoexplore.net/blog/video-timings-vga-720p-1080p#:~:text=VGA%20640x480%2060%20Hz&text=With%20analogue%20VGA%20monitors%20you,(rather%20than%2059.940%20Hz).)


| *Mode* | *Pixels* | *Clock* |  *RAM Adx (256 color)* |
| ------ | -------- | ------- |  ---- --- ---- ------- |
|  640x480   |    370k      |  25.175 MHz |  18 |
|  800x600   |    480k      |  40.000 MHz |  18 |
| 1024x720   |    922k      |  74.250 MHz |  20 |
| 1920x1080  |    2.1M      | 148.500 MHz |  21 |

Not sure how it would look, but one could do 80x60 with an 8x8 character cell.
