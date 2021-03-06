#!/usr/bin/env ruby
# -*- ruby encoding: utf-8 -*-

require 'tinkerforge/ip_connection'
require 'tinkerforge/bricklet_distance_us'

include Tinkerforge

HOST = 'localhost'
PORT = 4223
UID = 'XYZ' # Change XYZ to the UID of your Distance US Bricklet

ipcon = IPConnection.new # Create IP connection
dus = BrickletDistanceUS.new UID, ipcon # Create device object

ipcon.connect HOST, PORT # Connect to brickd
# Don't use device before ipcon is connected

# Get current distance value
distance = dus.get_distance_value
puts "Distance Value: #{distance}"

puts 'Press key to exit'
$stdin.gets
ipcon.disconnect
