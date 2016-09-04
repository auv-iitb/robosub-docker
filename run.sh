#! /usr/bin/env bash

docker run -it \
    --rm \
    --name="matsya" \
    --user=$(id -u) \
    --env="DISPLAY" \
    --env="QT_X11_NO_MITSHM=1" \
    --workdir="/home/$USER" \
    --volume="/etc/localtime:/etc/localtime:ro" \
    --volume="/etc/group:/etc/group:ro" \
    --volume="/etc/passwd:/etc/passwd:ro" \
    --volume="/etc/shadow:/etc/shadow:ro" \
    --volume="/etc/sudoers.d:/etc/sudoers.d:ro" \
    --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
    --volume=$HOME"/.ros:"$HOME"/.ros:rw" \
    --volume=$HOME"/catkin_ws:"$HOME"/catkin_ws:rw" \
    --device /dev/nvidia0:/dev/nvidia0:rw \
    --device /dev/nvidiactl:/dev/nvidiactl:rw \
    --device /dev/bus/usb:/dev/bus/usb:rwm \
    --device /dev/ttyS0:/dev/ttyS0:rw \
    --device /dev/ttyS1:/dev/ttyS1:rw \
    --device /dev/ttyS2:/dev/ttyS2:rw \
    --device /dev/ttyS3:/dev/ttyS3:rw \
    kunaltyagi/robosub:indigo \
    /usr/bin/docker-startup.sh
