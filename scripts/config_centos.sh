#!/bin/bash

# this script configures an environment for CentOS 7 servers using CVMFS in order to compile Minkowski

# Open BLAS
# Either install it as follows
sudo yum -y install openblas-devel openblas

# configure the following. I recommend doing both things
alias python=python2 
source /cvmfs/sft.cern.ch/lcg/releases/blas/0.3.5.openblas-78827/x86_64-centos7-gcc7-opt/blas-env.sh 
unalias python 
export CPLUS_INCLUDE_PATH=/cvmfs/sft.cern.ch/lcg/releases/blas/0.3.5.openblas-78827/x86_64-centos7-gcc7-opt/include:$CPLUS_INCLUDE_PATH
export LD_LIBRARY_PATH=cvmfs/sft.cern.ch/lcg/releases/blas/0.3.5.openblas-78827/x86_64-centos7-gcc7-opt/lib64:$LD_LIBRARY_PATH

# Install Ninja
sudo yum -y install ninja-build

# GCC
export PATH=/usr/local/cuda/bin:/usr/local/bin:$PATH
export LD_LIBRARY_PATH=/usr/local/cuda/lib64:/usr/local/lib:/usr/lib:$LD_LIBRARY_PATH

source /cvmfs/sft.cern.ch/lcg/releases/gcc/9.2.0/x86_64-centos7/setup.sh

export CPLUS_INCLUDE_PATH=/cvmfs/sft.cern.ch/lcg/releases/gcc/9.2.0/x86_64-centos7/include:$CPLUS_INCLUDE_PATH
export CPLUS_INCLUDE_PATH=/cvmfs/sft.cern.ch/lcg/releases/Boost/1.72.0-f05af/x86_64-centos7-gcc7-opt/include:$CPLUS_INCLUDE_PATH
export LD_LIBRARY_PATH=/cvmfs/sft.cern.ch/lcg/releases/Boost/1.72.0-f05af/x86_64-centos7-gcc7-opt/lib:$LD_LIBRARY_PATH

export LIBRARY_PATH=$LD_LIBRARY_PATH

# CUDA
#source /cvmfs/sft.cern.ch/lcg/releases/cuda/11.0RC-d9c38/x86_64-centos7-gcc62-opt/setup.sh
# Need to install CUDA 11.3 since it is not available in cvmfs. Follow instructions at 
# https://developer.nvidia.com/cuda-11.3.0-download-archive?target_os=Linux&target_arch=x86_64&Distribution=CentOS&target_version=7&target_type=rpm_network 
# or uncomment the following
#sudo yum-config-manager --add-repo https://developer.download.nvidia.com/compute/cuda/repos/rhel7/x86_64/cuda-rhel7.repo
#sudo yum clean all
#sudo yum -y install nvidia-driver-latest-dkms cuda-11-3
#sudo yum -y install cuda-drivers

# Installation only works as root
sudo su -l

python3 setup.py install
