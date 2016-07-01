#!/bin/sh
# Connects to localhost:4223 by default, use --host and --port to change this

uid=XYZ # Change XYZ to the UID of your Distance US Bricklet

# Get current distance value
tinkerforge call distance-us-bricklet $uid get-distance-value
