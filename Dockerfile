# This ARG will be overriden by the build argument
ARG ROS_DISTRO 

## ---------------- Base setup ----------------
FROM osrf/ros:$ROS_DISTRO-desktop as base_setup

ARG USERNAME=rosdev
ARG UID=1000
ARG GID=$UID

# Install some dependencies packages
RUN apt update -q \
    && apt upgrade -q -y \
    && apt install -y --no-install-recommends \
    software-properties-common \
    python3-pip \
    xauth \
    git
## -------------------------------------------

## --------------- Dev setup -----------------
FROM base_setup as dev_setup
# Mount the workspace and recursively search 
# for dependencies to install
COPY workspace/ /workspace/
# Iterate recursively through /workspace/non_ros_pkgs 
# and run all files that match "install-deps.sh"
RUN find /workspace/non_ros_pkgs -name \
    "install-deps.sh" -exec sh {} \;

# Iterate recursively through /workspace/ros_ws 
# and run all files that match "install-deps.sh"
RUN find /workspace/ros_ws -name "install-deps.sh" \
    -exec sh {} \;
# Clean up
RUN rm -rf /grab-workspace-deps.sh /workspace
RUN apt clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
## ------------------------------------------

## --------------- Final stage --------------
FROM dev_setup as final_stage
# Create and switch to user
RUN groupadd -g $GID $USERNAME \
    && useradd -lm -u $UID -g $USERNAME -s /bin/bash $USERNAME \
    && echo "$USERNAME ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
USER $USERNAME

# Create workspace so that user own this directory
RUN mkdir -p /home/$USERNAME/workspace/src
WORKDIR /home/$USERNAME/workspace

# Copy configuration files
RUN echo 'source /opt/ros/'$ROS_DISTRO'/setup.bash' >> /home/$USERNAME/.bashrc \
    && echo 'source /home/'$USERNAME'/workspace/install/setup.bash' >> /home/$USERNAME/.bashrc

# Setup entrypoint
COPY ./.devcontainer/ros_entrypoint.sh /
ENTRYPOINT ["/ros_entrypoint.sh"]
CMD ["bash"]
## ------------------------------------------