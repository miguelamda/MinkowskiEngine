#!/bin/bash

# this script install all packages for Ubuntu 20.04, compiles and install Minkowski

# correct version of pytorch
sudo pip3 uninstall torch torchvision torchaudio
sudo pip3 install torch==1.10.2+cu113 torchvision==0.11.3+cu113 torchaudio==0.10.2 -f https://download.pytorch.org/whl/torch_stable.html

# Open BLAS, Ninja, essentials...
sudo apt install -y libopenblas-dev build-essential python3-dev ninja-build gcc g++

# CUDA
# Install following instructions https://developer.nvidia.com/cuda-11.3.0-download-archive?target_os=Linux&target_arch=x86_64&Distribution=Ubuntu&target_version=20.04&target_type=deb_network
# Uncomment the following to install CUDA 11.3
#wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/cuda-ubuntu2004.pin
#sudo mv cuda-ubuntu2004.pin /etc/apt/preferences.d/cuda-repository-pin-600
#sudo apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/7fa2af80.pub
#sudo add-apt-repository "deb https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/ /"
#sudo apt-get update
#sudo apt-get -y install cuda

# Select the folder where your CUDA installation is
# Need to install CUDA 11.3, since it is not in cvmfs

export CUDA_HOME=/usr/local/cuda-11.3
# Doing the above, you don't need the following
#export PATH=/usr/local/cuda/bin:$PATH
#export LD_LIBRARY_PATH=/usr/local/cuda/lib64:$LD_LIBRARY_PATH
#export CUDA_HOME=/usr/local/cuda

# Finally, install Minkowski
sudo -E python setup.py install

