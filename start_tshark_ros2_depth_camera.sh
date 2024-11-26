#!/bin/bash

source /opt/ros/jazzy/setup.bash
source install/setup.bash
export RMW_IMPLEMENTATION=rmw_fastrtps_cpp

export FASTDDS_BUILTIN_TRANSPORTS=LARGE_DATA

# Check if a filename was provided as a parameter
if [ -z "$1" ]; then
  echo "Please provide a base filename for the Tshark output."
  echo "Usage: $0 <base_filename>"
  exit 1
fi

# Check if the time was provided as a parameter
if [ -z "$2" ]; then
  echo "Bitte die Laufzeit in Sekunden angeben."
  echo "Verwendung: $0 <base_filename> <time_in_seconds>"
  exit 1
fi

# Base filename provided by the user
BASE_FILENAME=$1
TIME=$2

# Define the directory for saving files
OUTPUT_DIR="$HOME/dds_ros2_ws/wireshark/depth_camera"

# Create the Wireshark folder if it doesn't exist
if [ ! -d "$OUTPUT_DIR" ]; then
  mkdir -p "$OUTPUT_DIR"
  echo "Created directory: $OUTPUT_DIR"
fi

# Full path for the raw capture and filtered RTPS file
RAW_FILE="$OUTPUT_DIR/${BASE_FILENAME}_raw.pcap"

cleanup() {
  ROS2_PID=$(ps -eo pid,cmd | grep ros2 | grep subscriber_node | awk '{print $1}')

  # Stop both processes
  kill $TSHARK_PID
  kill $ROS2_PID

  echo "Tshark and ROS 2 programs have been stopped."
}

trap cleanup SIGINT SIGTERM

ros2 daemon stop

# Step 1: Capture all packets and save them to a raw file
echo "Capturing all packets..."
tshark -f "not tcp port 22"  -w "$RAW_FILE" &
TSHARK_PID=$!

sleep 5

echo "Restarting ROS 2 daemon..."
ros2 daemon start

ros2 launch simulated_depth_camera simulated_depth_camera_subscriber.launch.py &

sleep "$TIME"

cleanup
