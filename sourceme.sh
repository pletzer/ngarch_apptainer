# July 2024
# https://code.metoffice.gov.uk/trac/lfric/wiki/LFRicTechnical/MacOSXBuild

export LFRIC_DIR=${PWD}
# ADJUST
#svn co https://code.metoffice.gov.uk/svn/lfric/LFRic/branches/dev/alexanderpletzer/r50707_nvfortran
export CORE_ROOT_DIR=${PWD}/lfric-r50707_nvfortran/
#svn co https://code.metoffice.gov.uk/svn/lfric_apps/main/trunk/
#export APPS_ROOT_DIR=${PWD}/lfric_apps/
export APPS_ROOT_DIR=${PWD}/lfric_apps-r2409

export INSTALL_DIR=/usr/local
export PATH=$INSTALL_DIR/bin:$PATH
export CPPFLAGS=-I$INSTALL_DIR/include
export FFLAGS=-I$INSTALL_DIR/include
export LDFLAGS=-L$INSTALL_DIR/lib

export BUILD_DIR=${PWD}/build

# xios
export NETCDF_DIR="$INSTALL_DIR"
export HDF5_DIR="$INSTALL_DIR"

# pFUnit
export F90_VENDOR=PG
export F90=nvfortran
export CC=gcc
export CXX=g++
export MPIF90=$EBROOTNVHPC/Linux_x86_64/24.3/comm_libs/12.3/hpcx/hpcx-2.17.1/ompi/bin/mpif90 # nvidia
export MPICC=$EBROOTOPENMPI/bin/mpicc # /opt/nesi/CS400_centos7_bdw/OpenMPI/4.1.5-GCC-12.3.0/bin/mpicc # gnu
export MPICXX=$EBROOTOPENMPI/bin/mpicxx # gnu g++

# lfric
export CXX_RUNTIME_LIBRARY="stdc++ c++"
export EXTRA_LIBRARIES="stdc++ c++"
export OS="Linux"
export PFUNIT=$INSTALL_DIR
export PATH=$INSTALL_DIR/bin:$PATH
export FC=$F90
export FPP="cpp -traditional-cpp"
export LDMPI=$MPIF90
export FFLAGS="-I$BUILD_DIR/XIOS/inc -I$INSTALL_DIR/include -I$INSTALL_DIR/mod -I/usr/local/include/ -I$MINT_DIR/mod "
export LDFLAGS="-L$BUILD_DIR/XIOS/lib -L$INSTALL_DIR/lib"
export CPPFLAGS="-I$INSTALL_DIR/include"
export LD_LIBRARY_PATH=$INSTALL_DIR/lib:$INSTALL_DIR/lib64:$LD_LIBRARY_PATH

# need to access mpi.mod, on mahuika
#export FFLAGS="-I$EBROOTNVHPC/Linux_x86_64/24.3/comm_libs/12.3/hpcx/hpcx-2.17.1/ompi/lib $FFLAGS"

export EXTRA_NETCDF_LIBRARIES="hdf5_hl hdf5"

# Psyclone. Must create a virtual environment
export PSYCLONE_CONFIG=${PWD}/venv/share/psyclone/psyclone.cfg
# must have a virtual env created with psyclone installed
# with:
# pip install Psyclone jinja2
# rose picker needs to be cloned and installed by hand
# 
source venv/bin/activate

# to get rid of a strange error related to a runtime OpenMPI error
# https://github.com/open-mpi/ompi/issues/7516
#export PMIX_MCA_gds=hash
