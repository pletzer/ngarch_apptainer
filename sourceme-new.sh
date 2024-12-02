
# Loosely based on
# https://code.metoffice.gov.uk/trac/lfric/wiki/LFRicTechnical/MacOSXBuild

# get rid of some perl messages
#unset LANG

export CODE_DIR=${PWD}

# ADJUST
# fcm co file:///opt/niwa/um_sys/metoffice-science-repos/lfric/LFRic/trunk lfric-trunk50869
export CORE_ROOT_DIR=${CODE_DIR}/lfric-trunk50869
# fcm co  https://code.metoffice.gov.uk/svn/lfric_apps/main/branches/dev/jorgebornemann/r3191_3191_add_pc2_to_ngarch
export APPS_ROOT_DIR=${CODE_DIR}/lfric_apps-r3191_3191_add_pc2_to_ngarch

export INSTALL_DIR=/usr/local
export PATH=$INSTALL_DIR/bin:$PATH
export CPPFLAGS=-I$INSTALL_DIR/include
export FFLAGS=-I$INSTALL_DIR/include
export LDFLAGS=-L$INSTALL_DIR/lib

export BUILD_DIR=/usr/local

# xios
export NETCDF_DIR="$INSTALL_DIR"
export HDF5_DIR="$INSTALL_DIR"

# pFUnit
export F90_VENDOR=PG
export F90=nvfortran
export CC=nvcc
export CXX=nvc++
export MPIF90=mpif90 # nvidia
export MPICC=mpicc # nvidia
export MPICXX=mpicxx # nvidia

# lfric
export CXX_RUNTIME_LIBRARY="stdc++ c++"
export EXTRA_LIBRARIES="stdc++ c++"
export OS="Linux"
export PFUNIT=$INSTALL_DIR
export PATH=$INSTALL_DIR/bin:$PATH
export FC=$F90
export FPP="cpp -P -traditional-cpp"
export LDMPI=$MPIF90
export FFLAGS="-I$BUILD_DIR/xios/include -I$INSTALL_DIR/include -I$INSTALL_DIR/mod "
export LDFLAGS="-L$BUILD_DIR/xios/lib -L$INSTALL_DIR/lib"
export CPPFLAGS="-I$INSTALL_DIR/include"
export LD_LIBRARY_PATH=$INSTALL_DIR/lib:$INSTALL_DIR/lib64:$LD_LIBRARY_PATH

# need to access mpi.mod
#export FFLAGS="-I/opt/nvidia/hpc_sdk/Linux_x86_64/24.7/comm_libs/12.5/openmpi4/openmpi-4.1.5/lib/ $FFLAGS"
export FFLAGS="-I$MPI_INC_DIR $FFLAGS"

export EXTRA_NETCDF_LIBRARIES="hdf5_hl hdf5"

export APPTAINER_BINDPATH="/opt/niwa/um_sys/,$PWD,/nesi/project/uoo03538/um/metoffice-science-repos"
export SINGULARITY_BINDPATH=$APPTAINER_BINDPATH

# Psyclone. Must create a virtual environment
export PSYCLONE_CONFIG=${CORE_ROOT_DIR}/etc/psyclone.cfg
# must have a virtual env created with psyclone installed
# with:
# python3 -m venv venv
# source venv/bin/activate
# pip3 install Psyclone jinja2
# rose picker needs to be cloned and installed by hand
# svn co https://code.metoffice.gov.uk/svn/lfric/GPL-utilities/trunk rose-picker
# cd rose-picker
# pip3 install -e .
# need to install cylc 
# pip3 install cylc-flow cylc-uiserver cylc-rose metomi-rose
source venv/bin/activate

# to get rid of a strange error related to a runtime OpenMPI error
# https://github.com/open-mpi/ompi/issues/7516
#export PMIX_MCA_gds=hash


