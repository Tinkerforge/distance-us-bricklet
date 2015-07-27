#!/usr/bin/env python
# -*- coding: utf-8 -*-

HOST = "localhost"
PORT = 4223
UID = "XYZ" # Change to your UID

from tinkerforge.ip_connection import IPConnection
from tinkerforge.bricklet_distance_us import DistanceUS

if __name__ == "__main__":
    ipcon = IPConnection() # Create IP connection
    dus = DistanceUS(UID, ipcon) # Create device object

    ipcon.connect(HOST, PORT) # Connect to brickd
    # Don't use device before ipcon is connected

    # Get current distance value
    distance_value = dus.get_distance_value()
    print('Distance Value: ' + str(distance_value))

    raw_input('Press key to exit\n') # Use input() in Python 3
    ipcon.disconnect()
