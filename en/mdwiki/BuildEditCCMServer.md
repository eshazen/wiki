# BuildEditCCMServer
## Instructions to build and run the CCM server

Kill the server:
 * ps aux | grep ngccm   (kill the one with -s flag and not the -c ones - server vs client)
 * sudo kill ##pid##

Edit the code in /home/daq/ngccmserver/devActorApp/src/

Build:

$ cd /home/daq/ngccmserver/devActorApp/src/build

$ export PATH=../extern/cmake-3.0.2install/bin:$PATH

$ cmake -DCMAKE_BUILD_TYPE:STRING=Debug ../

$ make VERBOSE=1

$ make package

The build deletes some libraries that I needed to copy over, so copy them again:

$ cp /opt/ngFEC/ngccm-0.0.12-02.el6/opt/ngccm/lib/lib*.42 /home/daq/ngccmserver/devActorApp/src/build/_CPack_Packages/Linux/TGZ/ngccm-0.0.12-26.el7/opt/ngccm/lib

Source a file for bin and libraries:

$ source /home/daq/ngccmserver/CCMServer.sh

Start the server:

$ /home/daq/ngccmserver/StartngCCMServer.sh

Run the client:
