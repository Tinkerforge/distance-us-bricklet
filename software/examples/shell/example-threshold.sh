#!/bin/sh
# connects to localhost:4223 by default, use --host and --port to change it

# change to your UID
uid=XYZ

# get threshold callbacks with a debounce time of 1 second (1000ms)
tinkerforge call distance-us-bricklet $uid set-debounce-period 1000

# configure threshold for "smaller than 200"
tinkerforge call distance-us-bricklet $uid set-distance-callback-threshold smaller 200 0

# handle incoming distance-reached callbacks
tinkerforge dispatch distance-us-bricklet $uid distance-reached\
 --execute "echo Distance Value is smaller than 200: {distance}"
