# ArduzynqDebugLog
*2017-03-10*

Have UART1 and Blinking LED working!  For some reason UART0 (USB shared with JTAG)
has only worked once and refuses to do so again.

Some key discoveries:

 * To change stdout UART channel...
   * double-click "system.mss" in BSP.
   * click "Modify this BSP's settings"
   * on Overview->standalone, find stdin and stdout settings, set both to "ps7_uart_1" for UART on J5
 * To automatically reset and download FPGA when running via USB/JTAG:
   * Right-click application, "Properties"
   * Pick "Run/Debug Settings"
   * Select "System Debugger..." and Edit
   * Check all boxes "Reset...", "Program...", "ps7_init", "ps7_post_config"
