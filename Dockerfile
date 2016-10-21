FROM ipropertygroup/python-base:latest
MAINTAINER MOHSEN@IPROPERTY

ENV DEBIAN_FRONTEND noninteractive

# Pick up some TF dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
        python-opencv \
        libopencv-dev \
        && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Install TensorFlow CPU version from central repo
ENV TENSORFLOW_VERSION 0.11.0rc0
RUN pip install \
    http://storage.googleapis.com/tensorflow/linux/cpu/tensorflow-${TENSORFLOW_VERSION}-cp27-none-linux_x86_64.whl
