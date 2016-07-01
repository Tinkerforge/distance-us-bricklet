#!/bin/sh
# Connects to localhost:4223 by default, use --host and --port to change this

uid=XYZ # Change XYZ to the UID of your Distance US Bricklet

# Handle incoming distance value callbacks
tinkerforge dispatch distance-us-bricklet $uid distance &

# Set period for distance value callback to 0.2s (200ms)
# Note: The distance value callback is only called every 0.2 seconds
#       if the distance value has changed since the last call!
tinkerforge call distance-us-bricklet $uid set-distance-callback-period 200

echo "Press key to exit"; read dummy

kill -- -$$ # Stop callback dispatch in background
