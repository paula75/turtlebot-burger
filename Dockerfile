FROM ros:kinetic

RUN apt-get update

# Install packages for Turtlebot3
RUN apt-get install -q -y \
python-catkin-tools \
ros-kinetic-joy \
ros-kinetic-teleop-twist-joy \
ros-kinetic-teleop-twist-keyboard \
ros-kinetic-laser-proc \
ros-kinetic-rgbd-launch \
ros-kinetic-depthimage-to-laserscan \
ros-kinetic-rosserial-arduino \
ros-kinetic-rosserial-python \
ros-kinetic-rosserial-server \
ros-kinetic-rosserial-client \
ros-kinetic-rosserial-msgs \
ros-kinetic-amcl \
ros-kinetic-map-server \
ros-kinetic-move-base \
ros-kinetic-urdf \
ros-kinetic-xacro \
ros-kinetic-compressed-image-transport \
ros-kinetic-rqt-image-view \
ros-kinetic-gmapping \
ros-kinetic-navigation \
ros-kinetic-interactive-markers


ADD ./catkin_ws /catkin_ws
RUN cd /catkin_ws/src  \
  && git clone https://github.com/ROBOTIS-GIT/turtlebot3.git \
  && git clone https://github.com/ROBOTIS-GIT/turtlebot3_msgs.git

# Create a catkin workspace
WORKDIR /catkin_ws
RUN bash -c " source /opt/ros/kinetic/setup.bash && \
              cd /catkin_ws/src && \
              catkin_init_workspace && \
              cd .. && \
              catkin_make"
