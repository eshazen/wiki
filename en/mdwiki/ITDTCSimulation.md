# ITDTCSimulation
[PageOutline(1-3,Table of Contents ,pullout)](PageOutline(1-3,Table_of_Contents_,pullout).md)

## Overview & Goals

The goal if this task is to develop a queuing simulation of entire data path for IT-DTC. Preliminary set of studies to be performed will be used to determine:
 * What are the required buffer sizes for each stream?
 * Can a fixed mapping from input streams to DAQ fiber be achieved, or is load-balancing or some sort of dynamic mapping required?
 * What strategies are required for error detection and recovery. This can be studied by injecting simulated errors of various sorts into the data and studying simulated recovery algorithms.

Recent/relevant talks on the subject are:
 * XX
 * YY

## Simulation of Phase2 Inner Tracker using CMSSW

This section gives detailed instructions on how to set up and run simulations with custom IT geometries at different pileup. It is based on BRIL simulation studies that can be found in this link:
   https://github.com/gauzinge/BRIL_ITsim
However, we will work on the forked copy of this directory as we will make some changes with respect to the original copy
   https://github.com/zdemirag/BRIL_ITsim

First you want to set up your CMSSW working area (either at cmslpc or lxplus). The most recent released release at the moment is 10_4_0_patch1, which is why it is being used in this example.

```
cmsrel CMSSW_10_4_0_patch1
cd CMSSW_10_4_0_patch1/src/
cmsenv
```

Not all the latest and greatest geometry description will be available in the release. If you want to modify the IT geometry then you will have to checkout the certain cmssw packages explicitly.

```
git cms-addpkg Configuration/PyReleaseValidation
git cms-addpkg Configuration/StandardSequences
git cms-addpkg Geometry/TrackerCommonData
git cms-addpkg Geometry/TrackerRecoData
git cms-addpkg Geometry/TrackerSimData
git cms-addpkg SLHCUpgradeSimulations/Geometry
```

Although this is the latest available release, it does not contain the updated inner tracker geometry. To implement the updated geometry (latest one is version 6.13), please follow the steps:

```
git clone git@github.com:zdemirag/BRIL_ITsim.git
cd BRIL_ITsim/
source copyGeo.sh -s=src/BRIL_ITsim/ITGeometries/OT614_200_IT613 -d=src
```

And finally compile the updated CMSSW. Make sure to compile in multiple cores (achieved by adding -j N) since the compilation can take a few minutes otherwise.
```
cd $CMSSW_BASE/src
scram b -j 12
```

NOTE TO SELF: There is even a newer release available now; i.e. 10_5_0. Many of the phase2 samples are now implemented up to 200 PU. Double check with Georg to see why he thinks runMatrix should not be used. imho, using runMatrix would be the only way to generate the right configuration without making a mistake and without having to update the configurations by hand.

** Next steps ** Create the Minimum Bias sample with the new geometry files. And then run the Single Neutrino sample to do a full simulation.

## Standalone Rate Estimations
Test
