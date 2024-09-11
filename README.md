# NGARCH container for NVIDIA compilers

## Overview

This repo contains a definition file that allows one to build an Apptainer container. Included are compilers, 
libraries and tools required to build LFRic.

## Requirements

You must have Apptainer (previously known as Singularity) installed. 


## How to build the container

Under Linux
```
sudo apptainer build ngarch_nvidia.sif ngarch_nvidia.def
```

## How to build NGARCH

```
git clone https://github.com/pletzer/ngarch_apptainer
cd ngarch_apptainer
```

Build the container if not already done.

Start the container. On w-clim01,
```
module load Singularity
singularity shell -B/opt/niwa/um_sys/,$PWD,/nesi/project/uoo03538/um/metoffice-science-repos ngarch_nvidia.sif
```
(Add any local branches listed in `$HOME/.metomi/fc/keyword.cfg`.)


Load the environment
```
Apptainer> source sourceme.sh
```

Check out and build LFRIC (you must have access to MetOffice code)
```
Apptainer> cd $LFRIC_DIR
Apptainer> svn co https://code.metoffice.gov.uk/svn/lfric_apps/main/branches/dev/alexanderpletzer/r2409_vn1.1_nvfortran 
Apptainer> cd applications/simple_diffusion
Apptainer> make build
```

Check out and build NGARCH (or another application)
```
Apptainer> cd $LFRIC_DIR
Apptainer> svn co https://code.metoffice.gov.uk/svn/lfric/LFRic/branches/dev/alexanderpletzer/r50707_nvfortran lfric-r50707_nvfortran
Apptainer> cd applications/simple_diffusion
Apptainer> make build
```

To run the NGARCH app
```
Apptainer> cd example
Apptainer> ../bin/ngarch configuration.nml
```


## Updating the definition file


