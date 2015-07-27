#!/usr/bin/env python
# -*- coding: utf-8 -*-

HOST = "localhost"
PORT = 4223
UID = "XYZ" # Change to your UID

from tinkerforge.ip_connection import IPConnection
from tinkerforge.bricklet_distance_us import DistanceUS

# Callback function for distance value smaller than 200
def cb_distance_reached(distance):
    print('Distance Value: ' + str(distance))

if __name__ == "__main__":
    ipcon = IPConnection() # Create IP connection
    dus = DistanceUS(UID, ipcon) # Create device object

    ipcon.connect(HOST, PORT) # Connect to brickd
    # Don't use device before ipcon is connected

    # Get threshold callbacks with a debounce time of 10 seconds (10000ms)
    dus.set_debounce_period(10000)

    # Register threshold reached callback to function cb_distance_reached
    dus.register_callback(dus.CALLBACK_DISTANCE_REACHED, cb_distance_reached)

    # Configure threshold for "smaller than 200"
    dus.set_distance_callback_threshold('<', 200, 0)

    raw_input('Press key to exit\n') # Use input() in Python 3
    ipcon.disconnect()
