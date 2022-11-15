# BUTool
Documentation web page: https://bu-edf.gitlab.io/BUTool/

Source code and issue tracker: https://github.com/BU-Tools/BUTool



Bugs:

 * When making code changes, the build/execute sequence is incomprehensible to non-experts.  An overall makefile is required which handles all the inter-dependencies with the plugins (sorry)
 * `make clean; make` fails and leaves the source tree broken
 * In the genIPBus:
   * only lower-case address table entries work (mixed and uppercase ones are silently ignored)
   * A "read" command takes a word count for numeric addresses only, not address table names
   * A "read" to a name which doesn't match an address table entry fails silently (should report an error)
