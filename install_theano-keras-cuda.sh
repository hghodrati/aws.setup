#!/bin/bash
# This bash script installs Theano, Keras, and CUDA as well as all required dependencies
# on an Amazon AWS EC2 instance. It has been successfully installed on the g2.2xlarge instance.
# The following applications are prerequisites: git, wget

# Update packages
sudo apt-get update
sudo apt-get -y dist-upgrade

# Install dependencies
sudo apt-get install -y gcc g++ gfortran build-essential linux-image-generic libopenblas-dev python-dev python-pip python-nose python-numpy python-scipy

# Install bleeding-edge version of Theano
sudo pip install git+git://github.com/Theano/Theano.git

# Download and install Keras
git clone https://github.com/fchollet/keras
cd keras/
sudo python setup.py install
cd ..

# Download CUDA toolkit v7.0, depackage it, update packages and install it
sudo wget http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1404/x86_64/cuda-repo-ubuntu1404_7.0-28_amd64.deb 
sudo dpkg -i cuda-repo-ubuntu1404_7.0-28_amd64.deb
sudo apt-get update
sudo apt-get install -y cuda 

# Include CUDA to path library
echo -e "\nexport PATH=/usr/local/cuda/bin:$PATH\n\nexport LD_LIBRARY_PATH=/usr/local/cuda/lib64" >> .bashrc 

echo "Please reboot and run afterwards nvidia-smi."


