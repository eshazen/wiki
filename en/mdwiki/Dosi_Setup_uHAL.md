# Dosi_Setup_uHAL
## Setup uHal and pycoHAL
### Installing the uHAL and pycoHAL libraries for IPBus

All instructions are given assuming you are on SL6 (Scientific Linux 6 "Carbon")

1. Install the per-requisites for uHAL:

```
    $ sudo yum -y install bzip2-devel zlib-devel ncurses-devel python-devel readline-devel

```
2. Check out the code from SVN into the desired location your machine:

```
    $ svn co http://svn.cern.ch/guest/cactus/trunk/

```

3. Be sure the CACTUS root directory trunk/ is where you want it. In the following steps, I will just assume the code has been checked out into the user''s home directory.

4. Go the ''trunk' directory of the CACTUS code and build the package *(only install uHAL)*:

```
    $ cd ~/trunk
    $ make

```
For additional help please see the [CactusInstallation](http://bucms.bu.edu/twiki/bin/view/BUCMSPublic/CactusInstallation) page from the [amc13.info](http://amc13.info) wiki. The documentation for uHAL can be found on the [CACTUS Bug Tracker](https://svnweb.cern.ch/trac/cactus/wiki)

### Setting up the uHAL Environment

1. Put the following at the end of your .bashrc file. Alternatively put it in environ.sh and run `source environ.sh` to set all of the paths correctly.

```
    export PATH=$HOME/trunk/cactuscore/uhal/tests/bin:$PATH
    export LD_LIBRARY_PATH=$HOME/trunk/cactuscore/extern/boost/RPMBUILD/SOURCES/lib:$LD_LIBRARY_PATH
    export LD_LIBRARY_PATH=$HOME/trunk/cactuscore/extern/pugixml/RPMBUILD/SOURCES/lib:$LD_LIBRARY_PATH
    export LD_LIBRARY_PATH=$HOME/trunk/cactuscore/uhal/log/lib:$LD_LIBRARY_PATH
    export LD_LIBRARY_PATH=$HOME/trunk/cactuscore/uhal/grammars/lib:$LD_LIBRARY_PATH
    export LD_LIBRARY_PATH=$HOME/trunk/cactuscore/uhal/uhal/lib:$LD_LIBRARY_PATH
    export LD_LIBRARY_PATH=$HOME/trunk/cactuscore/uhal/tests/lib:$LD_LIBRARY_PATH

```
2. To use PYCOHAL add the following to your .bashrc or environ.sh file.

```
  export PYTHONPATH=$HOME/trunk/cactuscore/uhal/pycohal/pkg:$PYTHONPATH
  export PYTHONPATH=$HOME/trunk/cactuscore/uhal/gui:$PYTHONPATH
  export PYTHONPATH=$HOME/trunk/cactuscore/uhal/tools:$PYTHONPATH

```
3. For a quick overview of uhal and pycohal please look at the [Official uHAL Quickstart Guide](https://svnweb.cern.ch/trac/cactus/wiki/uhalQuickTutorial#CreatingaConnectionFile)

back to [DosiSoftware](DosiSoftware.md)

