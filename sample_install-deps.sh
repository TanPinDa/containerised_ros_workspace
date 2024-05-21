#!/bin/sh

## Modify the following lines to install dependencies for your project.
echo "Installing dependencies for non-ROS packages"
apt update -q
apt install -y --no-install-recommends git libgoogle-glog-dev \
    libgflags-dev \
    libatlas-base-dev \
    libeigen3-dev \
    libsuitesparse-dev

mkdir -p ./deps && cd ./deps
git clone https://ceres-solver.googlesource.com/ceres-solver
cd ceres-solver
mkdir build && cd build
cmake .. && make -j10 && make install
cd ../../
rm -rf ceres-solver