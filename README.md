# Evaluation of DDS and Zenoh using ROS2

## Installing DDS

Creating a deployment key first.

```bash
git clone git@github.com:louisschraeder/ros_dds_evaluation.git dds_ros2_ws
cd dds_ros2_ws
git submodule init
git submodule update
```

```bash
git pull --recurse-submodules
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
General TCP
```bash
export FASTRTPS_DEFAULT_PROFILES_FILE=$HOME/dds_ros2_ws/dds_config/dds_evaluation_tcp_config.xml
export RMW_FASTRTPS_USE_QOS_FROM_XML=1
```

General UDP
```bash
export FASTRTPS_DEFAULT_PROFILES_FILE=$HOME/dds_ros2_ws/dds_config/dds_evaluation_udp_config.xml
export RMW_FASTRTPS_USE_QOS_FROM_XML=1
```

For Server:
```bash
fastdds discovery --server-id 0 -x $HOME/dds_ros2_ws/dds_config/dds_evaluation_server_tcp_config.xml 
```

```bash
fastdds discovery --server-id 0 -x $HOME/dds_ros2_ws/dds_config/dds_evaluation_server_udp_config.xml 
```

For Client:
```bash
export FASTRTPS_DEFAULT_PROFILES_FILE=$HOME/dds_ros2_ws/dds_config/dds_evaluation_tcp_client_config.xml
export RMW_FASTRTPS_USE_QOS_FROM_XML=1
```

```bash
export FASTRTPS_DEFAULT_PROFILES_FILE=$HOME/dds_ros2_ws/dds_config/dds_evaluation_udp_client_config.xml
export RMW_FASTRTPS_USE_QOS_FROM_XML=1
```

## Run example

### Depth Camera

```bash
ros2 launch simulated_depth_camera simulated_depth_camera_publisher.launch.py
```

### IMU

```bash
ros2 launch simulated_imu simulated_imu_publisher.launch.py 
```

### Lidar

```bash
ros2 launch simulated_lidar simulated_lidar_publisher.launch.py
```

```bash

```