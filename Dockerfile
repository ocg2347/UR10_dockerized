FROM ros:noetic-robot

WORKDIR /ur10_env

SHELL ["/bin/bash", "-c"]

# copy catkin workspace
COPY catkin_ws catkin_ws

# install ros dependencies and build the catkin workspace
RUN cd catkin_ws \
    && sudo apt-get update \
    && rosdep install --from-paths src --ignore-src -r -y

# add source commands to bashrc
RUN touch ~/.bashrc \
    && echo "source /ur10_env/catkin_ws/devel/setup.bash" >> ~/.bashrc \
    && echo "source /opt/ros/noetic/setup.bash" >> ~/.bashrc

RUN source /opt/ros/noetic/setup.bash \
    && cd catkin_ws \
    && catkin_make

COPY ur10colors_calibration.yaml .

COPY launchfile.sh .

RUN chmod +x launchfile.sh

CMD source /ur10_env/catkin_ws/devel/setup.bash && ./launchfile.sh
# CMD bash
# set entrypoint
