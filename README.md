# NGARCH container for NVIDIA compilers

## Overview

This repo contains a definition file that allows one to build an Apptainer container. Included in the container are compilers, 
libraries and tools required to build LFRic.

## Requirements

You must have Apptainer (previously known as Singularity) installed. 

## How to build the container

Under Linux
```
sudo apptainer build ngarch_nvhpc.sif ngarch_nvhpc.def
```

## Initial setup

Create a virtual environment, activate it and install Python packages
```
python3 -m venv venv
source venv/bin/activate
pip3 install Psyclone jinja2 cylc-flow cylc-uiserver cylc-rose metomi-rose
svn co https://code.metoffice.gov.uk/svn/lfric/GPL-utilities/trunk rose-picker
cd rose-picker
pip3 install -e .
cd ..
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
singularity shell -B/opt/niwa/um_sys/,$PWD,/opt/nesi,/nesi/project/uoo03538/um/ ngarch_nvhpc.sif
```

Load the environment
```
Apptainer> source sourceme.sh
```

Create a virtual environment, activate it and install Python packages
```
python3 -m venv venv
source venv/bin/activate
pip3 install Psyclone jinja2 cylc-flow cylc-uiserver cylc-rose metomi-rose
svn co https://code.metoffice.gov.uk/svn/lfric/GPL-utilities/trunk rose-picker
cd rose-picker
pip3 install -e .
cd ..
```

Cache your MOSRS password
```
Apptainer> source /usr/local/bin/mosrs-setup-gpg-agent
```

Check out and build LFRIC (you must have access to MetOffice code)
```
Apptainer> cd $CODE_DIR
Apptainer> fcm co fcm:lfric.x_br/dev/alexanderpletzer/r50707_nvfortran lfric-4411
Apptainer> cd lfric-4411/applications/simple_diffusion
Apptainer> make clean && make build
```

Check out and build NGARCH (or another application)
```
Apptainer> cd $CODE_DIR
Apptainer> fcm co fcm:lfric_apps.x_br/dev/alexanderpletzer/r2409_vn1.1_nvfortran lfric_apps-301
Apptainer> cd lfric_apps-301/applications/ngarch
Apptainer> make clean && make build
```

To run the NGARCH app
```
Apptainer> cd example
Apptainer> ../bin/ngarch configuration.nml
```


## Updating the definition file

The NVIDIA compiler version (eg 24.7) can be updated by editing the entry 
```
From: nvcr.io/nvidia/nvhpc:24.7-devel-cuda_multi-ubuntu22.04
```
in `ngarch_nvhpc.def`.
