#!/bin/bash

# Function to get Memory Usage
get_memory_usage() {
    echo "Memory Usage:"
    # Using 'free' command to fetch memory usage details
    free -h | awk '/^Mem/ {print "Used: "$3" / Total: "$2" | Free: "$4}'
}

# Function to get CPU Usage
get_cpu_usage() {
    echo "CPU Usage:"
    # Using 'top' command and 'grep' to get the first line with CPU stats
    top -bn1 | grep "Cpu(s)" | \
    awk '{print "CPU Load: " $2 + $4 "%"}'  # $2 is user%, $4 is system%
}

# Display memory and CPU usage
echo "System Resource Usage:"
get_memory_usage
get_cpu_usage

