#! /usr/bin/env bash

set -e

source /opt/ros/indigo/setup.bash
cd $HOME/catkin_ws/src
cp -av CMakeLists-indigo.txt CMakeLists.txt
# source ../devel/setup.bash  # No need
roscore
cp -av CMakeLists-kinetic.txt CMakeLists.txt
