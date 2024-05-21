#!/bin/sh

## Modify the following lines to install dependencies for your project.

# Update package list
apt update -q
# For ceres-solver
apt install -y --no-install-recommends libgoogle-glog-dev \
    libgflags-dev \
    libatlas-base-dev \
    libeigen3-dev \
    libsuitesparse-dev