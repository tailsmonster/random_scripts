#!/bin/sh

# Store the memory usage output in a variable
memory_usage=$(free -h | awk '/^Mem/ { print $3"/"$2 }' | sed s/i//g)

# Print the memory usage
echo "󰍛 $memory_usage"
