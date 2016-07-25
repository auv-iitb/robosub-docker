FROM osrf/ros:indigo-desktop-full
MAINTAINER Kunal Tyagi tyagi.kunal@live.com

# nvidia-docker hooks
LABEL com.nvidia.volumes.needed="nvidia_driver"
ENV PATH /usr/local/nvidia/bin:${PATH}
ENV LD_LIBRARY_PATH /usr/local/nvidia/lib:/usr/local/nvidia/lib64:${LD_LIBRARY_PATH}

# keep image up to date
ADD startup.sh /usr/bin/docker-startup.sh
#ADD setup.sh /usr/bin/docker-setup.sh
ADD ros.sh /etc/profile.d/ros.sh

# install dependencies for auv-iitb/robosub
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
#   apt-get upgrade -y && \
    apt-get install -y \
        libfftw3-dev \
        libpugixml-dev \
        ros-indigo-uvc-camera && \
    cat /etc/profile.d/ros.sh >> /etc/bash.bashrc && \
    rm -rf /var/lib/apt/lists/*
