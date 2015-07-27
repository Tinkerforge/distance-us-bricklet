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

# Set period for distance value callback to 0.2s (200ms)
# Note: The distance value callback is only called every 0.2 seconds
#       if the distance value has changed since the last call!
dus.set_distance_callback_period 200

# Register distance value callback
dus.register_callback(BrickletDistanceUS::CALLBACK_DISTANCE) do |distance|
  puts "Distance Value: #{distance}"
end

puts 'Press key to exit'
$stdin.gets
ipcon.disconnect
