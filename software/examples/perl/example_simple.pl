#!/usr/bin/perl

use strict;
use Tinkerforge::IPConnection;
use Tinkerforge::BrickletDistanceUS;

use constant HOST => 'localhost';
use constant PORT => 4223;
use constant UID => 'XYZ'; # Change XYZ to the UID of your Distance US Bricklet

my $ipcon = Tinkerforge::IPConnection->new(); # Create IP connection
my $dus = Tinkerforge::BrickletDistanceUS->new(&UID, $ipcon); # Create device object

$ipcon->connect(&HOST, &PORT); # Connect to brickd
# Don't use device before ipcon is connected

# Get current distance value
my $distance = $dus->get_distance_value();
print "Distance Value: $distance\n";

print "Press key to exit\n";
<STDIN>;
$ipcon->disconnect();
