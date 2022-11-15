# LargePrinter
I just today installed an Epson WF-7310.  Currently it's in the front of the EDF, connected to the private network.  It has DHCP-assigned address 192.168.10.226.  Probably this should be set to a fixed address.

Manual:  https://files.support.epson.com/docid/cpd6/cpd60671.pdf

Under Ubuntu 20.04, it works "out of the box", more or less.  Other OS, up to you, but know that the CUPS driver seems to work fine.

Here are a few notes:

After I plugged it in, a printer "EPSON_WF_7310_Series" appeared in my Settings->Printers.
I had to edit the settings and give it a name and location.  I didn't change anything else.

To Print:

In the system print dialog, select the "EPSON_WF_7310_Series".  If there is more than one listed, use the one with the location you entered in the setup.

By default it prints letter size from tray 1.  I've asked Chris to buy some 11x17 paper so soon tray 2 ("Alternate") should be 11x17.

For now you can feed large sheets from the rear, e.g. some 12x18 we have in EDF.  In the Ubuntu system print dialog, select:

"Paper Source: Rear"

"Paper Size: 11x17" (or set a custom size, set to 12x18)

