# Evaluation of DDS and Zenoh using ROS2

## Installing DDS

Creating a deployment key first.

```bash
git clone git@github.com:louisschraeder/ros_dds_evaluation.git ros2_ws
```

If it's the first time using ROS2, use:

```bash
rosdep install -i --from-path src --rosdistro jazzy -y
```

Build the project

```bash
colcon build --symlink-install
```

Source the packages

```bash
source /opt/ros/jazzy/setup.bash
```

```bash
source install/setup.bash
```

## Source FastDDS

```bash
cd $HOME/ros2_ws
source /opt/ros/jazzy/setup.bash
source install/setup.bash
export RMW_IMPLEMENTATION=rmw_fastrtps_cpp
```

```bash

```