# BuildingGhdlUbuntu
_2020-07-15_

Attempting to install on 18.04.  Download the tarball:
https://github.com/ghdl/ghdl/archive/v0.37.tar.gz

Install gnat (`sudo apt install gnat`).  Then just `./configure` and `make`.

This has produced a seemingly good exe `gnat-mcode`.

Trying to install ghdl on ubuntu 16.04.  No packages available!

Here is a [recipe](https://theintobooks.wordpress.com/2016/08/24/installing-ghdl-from-source-on-ubuntu-16-04/).  Let's try it:

```
  $ git clone git://git.code.sf.net/p/ghdl-updates/ghdl-updates.git ghdl-updates-ghdl-updates.git
  $ cd ghdl-updates-ghdl-updates.git
  $ git branch
  $ git checkout ghdl-0.33
# install ADA
  $ sudo apt install gnat
# install gcc 4.9
  $ wget ftp://ftp.gnu.org/gnu/gcc/gcc-4.9.4/gcc-4.9.4.tar.bz2
  $ tar xvjf gcc-4.9.4.tar.bz2
# configure gcc
  $ cd ~/src/ghdl-updates-ghdl-updates.git/
  $ ./configure --with-gcc=/home/hazen/src/gcc-4.9.4/
  $ make copy-sources
# install gmp
  $ wget ftp://gcc.gnu.org/pub/gcc/infrastructure/gmp-4.3.2.tar.bz2
  $ tar xvjf gmp-4.3.2.tar.bz2
  $ mkdir gmp-4.3.2/gmp-objs/
  $ cd gmp-4.3.2/gmp-objs/
  $ ../configure --prefix=/usr/local --disable-shared
  $ make
  $ sudo make install
  $ cd ../..
# install mpfr
  $ wget ftp://gcc.gnu.org/pub/gcc/infrastructure/mpfr-2.4.2.tar.bz2
  $ tar xvjf mpfr-2.4.2.tar.bz2
  $ mkdir mpfr-2.4.2/mpfr-objs/
  $ cd mpfr-2.4.2/mpfr-objs/
  $ ../configure --prefix=/usr/local --disable-shared --with-gmp=/usr/local
  $ make
  $ sudo make install
  $ cd ../..
# install mpc
  $ wget ftp://gcc.gnu.org/pub/gcc/infrastructure/mpc-0.8.1.tar.gz
  $ tar xvzf mpc-0.8.1.tar.gz
  $ mkdir mpc-0.8.1/mpc-objs/
  $ cd mpc-0.8.1/mpc-objs/
  $ ../configure --prefix=/usr/local --disable-shared --with-gmp=/usr/local
  $ make
  $ sudo make install
  $ cd ../..
# build ghdl
  $ cd gcc-4.9.4
  $ mkdir gcc-objs
  $ cd gcc-objs/
  $ ../configure --prefix=/opt/ghdl-updates --enable-languages=c,vhdl --disable-bootstrap --with-gmp=/usr/local --disable-lto --disable-multilib
  $ PATH=/usr/lib/gcc/x86_64-linux-gnu/4.9:$PATH make
# install ghdl
  $ sudo -i
  # cd /home/hazen/src/gcc-4.9.4/gcc-objs
  # PATH=/usr/lib/gcc/x86_64-linux-gnu/4.9:$PATH make install MAKEINFO=true
```

Now, to run use:
```
  $ export PATH=/opt/ghdl-updates/bin/:$PATH
```

It worked!


