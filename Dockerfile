FROM ros:humble-ros-base-jammy
ENV ROS_DISTRO humble

RUN apt update && apt install -y \
    python3-rosinstall \
    git \
    nano \
    tmux \
    wget \
    curl \
    iputils-ping \
    net-tools

RUN apt update && apt install -y \
    libeigen3-dev

RUN sudo apt update && apt install -y \
    python3-shapely \
    python3-yaml \
    python3-requests \
    python3-colcon-clean \
    python3-pip \
    python3-rosdep \
    python3-vcstool \
    python3-colcon-common-extensions

# RUN apt update && apt install -y \
#     ros-${ROS_DISTRO}-tf2-tools

# RUN sudo apt update && sudo apt install -y \
#     qtbase5-dev \
#     qtchooser \
#     qt5-qmake \
#     qtbase5-dev-tools

COPY ./autostart.sh /autostart.sh
RUN chmod +x /autostart.sh

ENTRYPOINT [ "/ros_entrypoint.sh" ]
