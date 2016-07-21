# robosub-docker
Docker file for robosub

## Known Issues
* Docker is in UTC
* Ignore warnings about not able to create directory.

## Running Docker Image
From anywhere run

```
$ docker run -it \
    --rm \
    --name="matsya" \
    --user=$(id -u) \
    --env="DISPLAY" \
    --env="QT_X11_NO_MITSHM=1" \
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
    /usr/bin/docker-setup.sh
```

In order to run another command concurrently, use

```
$ docker exec -it matsya bash
```

This will drop you into root (/) of the docker. Only use it after the image is already running

## Compiling image (after modification)
From this directory, run

```
$ docker build -t kunaltyagi/robosub:indigo --rm=true .
```

Remember the dot at the end.

## Additional notes
* parent docker is osrf/ros:indigo-desktop-full
* if required, use the --net='host' or --privileged options (not needed now)
