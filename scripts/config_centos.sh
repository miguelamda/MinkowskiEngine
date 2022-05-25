#!/bin/bash

# this script configures an environment for CentOS 7 servers using CVMFS in order to compile Minkowski
# Log in as root and then type:
#   source config_centos.sh
#   python -m setup.py install

# Open BLAS
alias python=python2 
source /cvmfs/sft.cern.ch/lcg/releases/blas/0.3.5.openblas-78827/x86_64-centos7-gcc7-opt/blas-env.sh 
unalias python 
export CPLUS_INCLUDE_PATH=/cvmfs/sft.cern.ch/lcg/releases/blas/0.3.5.openblas-78827/x86_64-centos7-gcc7-opt/include:$CPLUS_INCLUDE_PATH
export LD_LIBRARY_PATH=cvmfs/sft.cern.ch/lcg/releases/blas/0.3.5.openblas-78827/x86_64-centos7-gcc7-opt/lib64:$LD_LIBRARY_PATH

# GCC
export PATH=/usr/local/cuda/bin:/usr/local/bin:$PATH
export LD_LIBRARY_PATH=/usr/local/cuda/lib64:/usr/local/lib:/usr/lib:$LD_LIBRARY_PATH

source /cvmfs/sft.cern.ch/lcg/releases/gcc/9.2.0/x86_64-centos7/setup.sh

export CPLUS_INCLUDE_PATH=/cvmfs/sft.cern.ch/lcg/releases/gcc/9.2.0/x86_64-centos7/include:$CPLUS_INCLUDE_PATH
export CPLUS_INCLUDE_PATH=/cvmfs/sft.cern.ch/lcg/releases/Boost/1.72.0-f05af/x86_64-centos7-gcc7-opt/include:$CPLUS_INCLUDE_PATH
export LD_LIBRARY_PATH=/cvmfs/sft.cern.ch/lcg/releases/Boost/1.72.0-f05af/x86_64-centos7-gcc7-opt/lib:$LD_LIBRARY_PATH

export LIBRARY_PATH=$LD_LIBRARY_PATH

alias python=python3

# CUDA
#source /cvmfs/sft.cern.ch/lcg/releases/cuda/11.0RC-d9c38/x86_64-centos7-gcc62-opt/setup.sh
