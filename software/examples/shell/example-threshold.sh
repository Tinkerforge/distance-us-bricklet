#!/bin/sh
# Connects to localhost:4223 by default, use --host and --port to change this

uid=XYZ # Change XYZ to the UID of your Distance US Bricklet

# Get threshold callbacks with a debounce time of 10 seconds (10000ms)
tinkerforge call distance-us-bricklet $uid set-debounce-period 10000

# Handle incoming distance value reached callbacks
tinkerforge dispatch distance-us-bricklet $uid distance-reached &

# Configure threshold for distance value "smaller than 200"
tinkerforge call distance-us-bricklet $uid set-distance-callback-threshold threshold-option-smaller 200 0

echo "Press key to exit"; read dummy

kill -- -$$ # Stop callback dispatch in background
