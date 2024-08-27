#!/usr/bin/bash

# Exit if an error was encountered
set -e

# Check out the code
git clone https://github.com/pletzer/fidibench

# Build the code
cd fidibench
mkdir build
cd build
CXX=nvc++ cmake -DOPENACC=ON -DCMAKE_BUILD_TYPE=Release ..

# Run the code
cd updwind/cxx
./upwindAcc
./upwindAcc2
