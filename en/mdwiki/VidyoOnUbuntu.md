# VidyoOnUbuntu
These instructions seemed to work:

 * http://information-technology.web.cern.ch/services/fe/howto/users-use-vidyo-linux?page=1

Summary:

Download 64-bit deb from http://information-technology.web.cern.ch/services/fe/downloads/Vidyo

```
 $ sudo apt install dpkg
 $ dpkg-deb -x tmp/VidyoDesktopInstaller-ubuntu64-TAG_VD_3_6_3_017.deb vidyobuild
 $ dpkg-deb --control tmp/VidyoDesktopInstaller-ubuntu64-TAG_VD_3_6_3_017.deb vidyobuild/DEBIAN
 $ emacs -nw vidyobuild/DEBIAN/control

  Replace "Depends:" line with:
  Depends: libxss1,libaudio2,libasound2,libqt4-network

 $ dpkg-deb -b vidyobuild vidyodesktop-custom.deb
 $ sudo dpkg -i vidyodesktop-custom.deb
 $ sudo apt install --reinstall overlay-scrollbar-gtk2
 $ sudo apt install libcanberra-gtk*
 $ sudo apt install sni-qt
```
