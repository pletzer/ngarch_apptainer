
# Loosely based on
# https://code.metoffice.gov.uk/trac/lfric/wiki/LFRicTechnical/MacOSXBuild

# get rid of some perl messages
unset LANG

export CODE_DIR=${PWD}

# ADJUST
export CORE_ROOT_DIR=${CODE_DIR}/lfric-trunk50869 
export APPS_ROOT_DIR=${CODE_DIR}/r3191_3191_add_pc2_to_ngarch

export INSTALL_DIR=/usr/local
export PATH=$INSTALL_DIR/bin:$PATH

export FC=nvfortran FPP="cpp -P -x f95-cpp-input" FFLAGS="-I$INSTALL_DIR/include" LDFLAGS="-L$INSTALL_DIR/lib"

# xios
export NETCDF_DIR="$INSTALL_DIR"
export HDF5_DIR="$INSTALL_DIR"

# pFUnit
export F90_VENDOR=PG
export F90=$FC
export CC=nvcc
export CXX=nvc++
export MPIF90=mpif90
export MPICC=mpicc
export MPICXX=mpicxx

# need to access mpi.mod
#export FFLAGS="-I/opt/nvidia/hpc_sdk/Linux_x86_64/24.7/comm_libs/12.5/openmpi4/openmpi-4.1.5/lib/ $FFLAGS"
export FFLAGS="-I$MPI_INC_DIR $FFLAGS"

export EXTRA_NETCDF_LIBRARIES="hdf5_hl hdf5"

export PSYCLONE_CONFIG=${CORE_ROOT_DIR}/etc/psyclone.cfg
# must have a virtual env created with psyclone installed
# with:
# python3 -m venv venv
# source venv/bin/activate
# pip install Psyclone jinja2
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


