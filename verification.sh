#!/bin/bash

# These verification steps are taken from the 
# NVIDIA CUDA GETTING STARTED GUIDE FOR LINUX
# DU-05347-001_v7.0 | March 2015
# available here: http://developer.download.nvidia.com/compute/cuda/7_0/Prod/doc/CUDA_Getting_Started_Linux.pdf

echo "######################## Verify CUDA-capable GPU ########################"
lspci | grep -i nvidia

echo "######################## Verify supported Linux version ########################"
uname -m && cat /etc/*release

echo "######################## Verify GCC is installed ########################"
gcc --version
