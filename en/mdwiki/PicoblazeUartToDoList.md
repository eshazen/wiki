# PicoblazeUartToDoList

 * Note that `util_byte_to_hex` always outputs to UART, so it would save a bit of code
to create a new function `util_byte_to_uart` or some-such
 * Overflowing the input buffer should probably just stop echoing characters rather than
spontaneously outputting a message
