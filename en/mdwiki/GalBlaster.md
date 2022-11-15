# GalBlaster
## Design Tools

 * https://github.com/daveho/GALasm - GALASM based on GALer (no docs?)
 * https://github.com/hneemann/Digital - VERY interesting looking simple digital design environment

## Programmers

 * http://www.bhabbott.net.nz/atfblast.html - parallel port programmer with Turbo-C source
 * https://github.com/simon-frankau/galette - Galette: A GAL assembler for the 21st Century
 * https://gitlab.com/DavidGriffith/minipro/ Linux programmer for MiniPRO TLX866xxx
 * https://github.com/ole00/afterburner - GAL programmer for Arduino


Note from *Jason C-J Tay* in the Z80 facebook group:

I started using the Atmel (now Microchip) ATF150x CPLDs last year, which are still available new in 3.3V AND 5V versions from all the stockists, I bought the ATMISP program download cable new from Element 14/Farnell. I have a terrible time using WinCUPL on Win10, so I have been using Digital, an open source digital circuit design/simulation package by Helmut Neemann, which is able to generate the JEDEC files for the ATF150x series (as well as many common GALs). Note that the ATF150x series are available in 32, 64 and 128 macrocell versions, and they have a most curious "logic doubling" feature. What I think it comes down to is additional routing fabric to enable you to make fuller use of the logic resources on the chip than you might normally be able to on other similar CPLDs; for example, the fitter is sometimes able to fit more than 32 macrocell's worth of logic into the 32 MC chip. I can't confirm this myself yet because I haven't generated anything that made the logic doubling kick in yet. If you have a Win7 machine, you will probably have better luck running WinCUPL than I did.
