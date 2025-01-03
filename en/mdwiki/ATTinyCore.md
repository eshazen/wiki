# Support for ATTiny devices

See https://github.com/SpenceKonde/ATTinyCore

I has some trouble to get this installed.
The certificate for drazzy.com wasn't recoginized so the Arduino 2.3.3 IDE
refused to install it.

I had to manually download the json file:

    wget http://drazzy.com/package_drazzy.com_index.json --no-check-certificate

I put it in Downloads and set the URL to:

    file:///home/hazen/Downloads/package_drazzy.com_index.json

Then the IDE recognized the ATTiny devices.
