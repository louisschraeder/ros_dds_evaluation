# Evaluation of DDS and Zenoh using ROS2

## Installing DDS

Creating a deployment key first.

```bash
git clone git@github.com:louisschraeder/ros_dds_evaluation.git ros2_ws
git submodule init
git submodule update
```

If it's the first time using ROS2, use:

```bash
rosdep install --from src -i
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

```bash
chmod +x file
```

## Source FastDDS

```bash
cd $HOME/dds_ros2_ws
source /opt/ros/jazzy/setup.bash
source install/setup.bash
export RMW_IMPLEMENTATION=rmw_fastrtps_cpp
```
General 
```bash
export FASTDDS_DEFAULT_PROFILES_FILE=$HOME/dds_ros2_ws/dds_config/dds_evalation_tcp_conig.xml
export RMW_FASTRTPS_USE_QOS_FROM_XML=1
```

For Server:
```bash
export FASTDDS_DEFAULT_PROFILES_FILE=$HOME/dds_ros2_ws/dds_config/dds_evalation_server_conig.xml
export RMW_FASTRTPS_USE_QOS_FROM_XML=1
```

For Client:
```bash
export FASTDDS_DEFAULT_PROFILES_FILE=$HOME/dds_ros2_ws/dds_config/dds_evalation_client_conig.xml
export RMW_FASTRTPS_USE_QOS_FROM_XML=1
```


```bash

```