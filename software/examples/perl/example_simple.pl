#!/usr/bin/perl  

use Tinkerforge::IPConnection;
use Tinkerforge::BrickletDistanceUS;

use constant HOST => 'localhost';
use constant PORT => 4223;
use constant UID => 'abc'; # Change to your UID

my $ipcon = IPConnection->new(); # Create IP connection
my $dist = BrickletDistanceUS->new(&UID, $ipcon); # Create device object

$ipcon->connect(&HOST, &PORT); # Connect to brickd
# Don't use device before ipcon is connected

# Get current distance value
my $distance = $dist->get_distance_value();

print "\nDistance Value: ".$distance."\n";

print "\nPress any key to exit...\n";
<STDIN>;
$ipcon->disconnect();
