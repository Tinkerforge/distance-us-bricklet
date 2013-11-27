#!/bin/sh
# connects to localhost:4223 by default, use --host and --port to change it

# change to your UID
uid=XYZ

# get current distance value
tinkerforge call distance-us-bricklet $uid get-distance-value
