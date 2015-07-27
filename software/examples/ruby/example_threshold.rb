#!/usr/bin/env ruby
# -*- ruby encoding: utf-8 -*-

require 'tinkerforge/ip_connection'
require 'tinkerforge/bricklet_distance_us'

include Tinkerforge

HOST = 'localhost'
PORT = 4223
UID = 'XYZ' # Change to your UID

ipcon = IPConnection.new # Create IP connection
dus = BrickletDistanceUS.new UID, ipcon # Create device object

ipcon.connect HOST, PORT # Connect to brickd
# Don't use device before ipcon is connected

# Get threshold callbacks with a debounce time of 10 seconds (10000ms)
dus.set_debounce_period 10000

# Register threshold reached callback for distance value smaller than 200
dus.register_callback(BrickletDistanceUS::CALLBACK_DISTANCE_REACHED) do |distance|
  puts "Distance Value: #{distance}"
end

# Configure threshold for "smaller than 200"
dus.set_distance_callback_threshold '<', 200, 0

puts 'Press key to exit'
$stdin.gets
ipcon.disconnect
