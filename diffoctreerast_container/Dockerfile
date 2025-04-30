# Use NVIDIA CUDA base image
FROM nvidia/cuda:12.2.2-cudnn8-devel-ubuntu22.04

ENV TORCH_CUDA_ARCH_LIST=8.0;8.6;8.7;8.9

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive
ENV CUDA_HOME=/usr/local/cuda
# ENV PATH=${CUDA_HOME}/bin:${PATH}
# ENV LD_LIBRARY_PATH=${CUDA_HOME}/lib64:${LD_LIBRARY_PATH}
# ENV CUDA_INCLUDE_PATH=${CUDA_HOME}/include
# ENV CUDA_LIB_PATH=${CUDA_HOME}/lib64
# ENV CPATH=${CUDA_HOME}/include

# Install system dependencies
RUN apt-get update && apt-get install -y \
    git \
    wget \
    build-essential \
    python3 \
    python3-pip \
    python3-dev \
    && rm -rf /var/lib/apt/lists/*

# Upgrade pip
RUN python3 -m pip install --upgrade pip

# Install Torch
RUN pip install torch==2.3.1+cu121 torchvision==0.18.1+cu121 --extra-index-url https://download.pytorch.org/whl/cu121

# Install additional dependencies
RUN apt-get update && apt-get install -y \
    ninja-build \
    && rm -rf /var/lib/apt/lists/*

# Clone the mip-splatting repository
RUN git clone --recurse-submodules https://github.com/JeffreyXiang/diffoctreerast.git /tmp/extensions/diffoctreerast 

# Set working directory
WORKDIR /tmp/extensions/diffoctreerast 

# Install and build the wheel
RUN pip install . && \
    python3 setup.py bdist_wheel

# Keep the container running for debugging
CMD ["sleep", "infinity"]

