#!/usr/bin/perl  

use Tinkerforge::IPConnection;
use Tinkerforge::BrickletDistanceUS;

use constant HOST => 'localhost';
use constant PORT => 4223;
use constant UID => 'abc'; # Change to your UID

my $ipcon = Tinkerforge::IPConnection->new(); # Create IP connection
my $dist = Tinkerforge::BrickletDistanceUS->new(&UID, $ipcon); # Create device object

$ipcon->connect(&HOST, &PORT); # Connect to brickd
# Don't use device before ipcon is connected

# Get current distance value
my $distance = $dist->get_distance_value();
print "Distance Value: $distance\n";

print "Press any key to exit...\n";
<STDIN>;
$ipcon->disconnect();
