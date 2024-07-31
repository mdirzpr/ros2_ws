#!/bin/bash
set -e

# Source ROS 2 setup script
source /opt/ros/$ROS_DISTRO/setup.bash

# Navigate to the workspace
cd /home/$WORKSPACE

# Import the ROS 2 repository sources
vcs import src < src/ros2.repos

# Install dependencies
apt-get update
rosdep update
rosdep install --from-paths src --ignore-src -r -y
