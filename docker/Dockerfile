# Dockerfile for ROS2-jazzy

FROM ros:jazzy-ros-base AS ros2_jazzy_ws

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

# Set environment variables
ENV ROS_DISTRO=jazzy
ENV AMENT_PREFIX_PATH=/opt/ros/${ROS_DISTRO}
ENV COLCON_PREFIX_PATH=/opt/ros/${ROS_DISTRO}
ENV LD_LIBRARY_PATH=/opt/ros/${ROS_DISTRO}/lib
ENV PATH=/opt/ros/${ROS_DISTRO}/bin:$PATH
ENV PYTHONPATH=/opt/ros/${ROS_DISTRO}/local/lib/python3.10/dist-packages:/opt/ros/${ROS_DISTRO}/lib/python3.10/site-packages
ENV ROS_PYTHON_VERSION=3
ENV ROS_VERSION=2
ENV DEBIAN_FRONTEND=noninteractive

# Install necessary packages
RUN apt-get update && apt-get install -y \
    build-essential git cmake bash bash-completion vim \
    python3-pip python3-colcon-common-extensions python3-vcstool python3-argcomplete \
    openssh-client \
    ros-${ROS_DISTRO}-ament-cmake ros-dev-tools \
    && rm -rf /var/lib/apt/lists/*

# Initialize and update rosdep
RUN rosdep init || echo "rosdep already initialized" && \
    rosdep update

# Define the arguments
ARG WORKSPACE=ros2_ws

# Create a ROS 2 workspace
RUN mkdir -p /home/${WORKSPACE}/src

# Copy src and ws_files to the container
COPY src /home/${WORKSPACE}/src
COPY ws_files /home/${WORKSPACE}/ws_files
COPY *.sh /home/${WORKSPACE}

# Source ROS 2 setup script
RUN echo "source /opt/ros/${ROS_DISTRO}/setup.bash" >> ~/.bashrc

# Set up ROS 2 and autocompletion
RUN echo "if [ -f /usr/share/colcon_cd/function/colcon_cd-argcomplete.bash ]; then source /usr/share/colcon_cd/function/colcon_cd-argcomplete.bash; fi" >> ~/.bashrc

# Installing CPP demo-nodes
RUN apt-get update && apt-get install -y \
    ros-jazzy-demo-nodes-cpp

WORKDIR /home/${WORKSPACE}

# Default command
CMD ["/bin/bash"]
