# ComExpressMini
Documentation on Ethernet - PCIe bridge testing using embedded linux system (e.g. COMe mini).

### Work Plan

1. Setup a COMe mini on an eval board and get it to run Linux
 a. pick an appropriately small linux distro to use, maybe a minimal ubuntu
2. Install required tools to build kernel modules and build a demo "hello world" module
3. Develop a simple PCIe target firmware for Xilinx evaluation board (Mr Wu will do this)
4. Write a kernel module to talk to the eval board
5. Study data transfer performance and make a report
6. Develop some demo server applications to run under linux to provide a GbE-PCIe bridge

Target system-on-board type is "COM express mini type 10".
Looking for a carrier board with PCIe x1 connector for a Xilinx eval board.

### Hardware

 * [Conga MEVAL](http://www.congatec.com/fileadmin/user_upload/Documents/Datasheets/conga-MEVAL.pdf) at Mouser
   * Ordered one plus a conga-MA4 COMe-mini cpu board
   * [CET0m10.pdf](http://www.congatec.com/fileadmin/user_upload/Documents/Manual/CET0m10.pdf) - Manual


### Other options
 * [Axiomtek CEB94008](http://www.axiomtek.com/Default.aspx?MenuId=Products&FunctionId=ProductView&ItemId=6409&upcat=333) (Mouser, maybe?)
 * [Compulab SB-COMEX-T10](http://www.compulab.co.il/products/com-express/sb-comex-t10/) (phoned+emailed for info 1/20/17)
 * [Kontron COMe Eval Carrier2 T10](http://www.kontron.com/products/boards-and-standard-form-factors/com-express/starterkits-and-evaluation-boards/come-eval-carrier-t10-gen2.html)
