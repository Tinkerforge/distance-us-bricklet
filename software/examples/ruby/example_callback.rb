#!/usr/bin/env ruby
# -*- ruby encoding: utf-8 -*-

require 'tinkerforge/ip_connection'
require 'tinkerforge/bricklet_distance_us'

include Tinkerforge

HOST = 'localhost'
PORT = 4223
UID = 'XYZ' # Change to your UID

ipcon = IPConnection.new # Create IP connection
dir = BrickletDistanceUS.new UID, ipcon # Create device object

ipcon.connect HOST, PORT # Connect to brickd
# Don't use device before ipcon is connected

# Set Period for distance callback to 0.2s (200ms)
# Note: The callback is only called every 200ms if the 
#       distance has changed since the last call!
dir.set_distance_callback_period 200

# Register distance callback (parameter has unit mm)
dir.register_callback(BrickletDistanceUS::CALLBACK_DISTANCE) do |distance|
  puts "Distance: #{distance/10.0} cm"
end

puts 'Press key to exit'
$stdin.gets
ipcon.disconnect
