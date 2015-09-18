#!/bin/sh
# Connects to localhost:4223 by default, use --host and --port to change this

uid=XYZ # Change to your UID

# Get current distance value
tinkerforge call distance-us-bricklet $uid get-distance-value
