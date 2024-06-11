# Under this line comand which define version of docker syntax. Common we can't use this. 
# syntax=docker/dockerfile:1

# Here base Docker image. We use for youbot linux ubuntu 16.04.
# More any images is access in Dockerhub.

FROM ubuntu:18.04
RUN apt-get update && apt-get install -y apt-utils \
                                         lsb-release \
                                         mesa-utils \
                                         gnupg2 \
                                         net-tools \
                                         build-essential \
                                         wget \
                                         unzip \
                                         curl \
                                         git \
                                         mc


# Timezone Configuration

ENV TZ=Europe/Moscow
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Install ROS desktop and Gazebo

RUN sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list' && \
    apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654 && \
    apt-get update && DEBIAN_FRONTEND=noninteractive \
                      apt-get install -y ros-noetic-desktop-full \
                                         gazebo9 \
                                         ros-noetic-gazebo-ros-pkgs \
                                         ros-noetic-ros-control \
                                         ros-noetic-gazebo-ros-control \
                                         ros-noetic-geographic-info \
                                         ros-noetic-teleop-twist-keyboard \
                                         ros-noetic-joy \
                                         ros-noetic-effort-controllers \
                                         ros-noetic-controller-manager \
                                         python-rosdep \
                                         python-rosinstall \
                                         python-rosinstall-generator \
                                         python-wstool \
                                         python-catkin-tools \
                                         libcanberra-gtk-module \
                                         libcanberra-gtk3-module \
                                         ros-noetic-pid \
                                         ros-noetic-visp* && \
    rosdep init && rosdep update && \
    echo "source /opt/ros/noetic/setup.bash"  >> ~/.bashrc && \
    echo "source /catkin_ws/devel/setup.bash"  >> ~/.bashrc

# Install extra libraries
RUN apt-get install -y libvisp-dev libvisp-doc 
RUN apt-get install -y python-pip
RUN pip install pathlib statistics scipy

RUN apt-get update && DEBIAN_FRONTEND=noninteractive \
                      apt-get install -y ros-noetic-ecl-geometry \
                                            ros-noetic-tf2-sensor-msgs \
                                            ros-noetic-move-base-msgs \
                                            ros-noetic-image-proc

RUN apt-get update && apt-get install -y \
                libopencv-dev libx11-dev liblapack-dev libv4l-dev libzbar-dev libpthread-stubs0-dev libsdl-dev libsdl-image1.2-dev \
                libeigen3-dev

RUN pip install numpy scikit-image 
RUN pip install pillow 
RUN pip install opencv-contrib-python
