#!/usr/bin/perl

use Tinkerforge::IPConnection;
use Tinkerforge::BrickletDistanceUS;

use constant HOST => 'localhost';
use constant PORT => 4223;
use constant UID => 'XYZ'; # Change to your UID

my $ipcon = Tinkerforge::IPConnection->new(); # Create IP connection
my $dus = Tinkerforge::BrickletDistanceUS->new(&UID, $ipcon); # Create device object

# Callback subroutine for distance value callback
sub cb_distance
{
    my ($distance) = @_;

    print "Distance Value: " . $distance . "\n";
}

$ipcon->connect(&HOST, &PORT); # Connect to brickd
# Don't use device before ipcon is connected

# Set period for distance value callback to 0.2s (200ms)
# Note: The distance value callback is only called every 0.2 seconds
#       if the distance value has changed since the last call!
$dus->set_distance_callback_period(200);

# Register distance value callback to subroutine cb_distance
$dus->register_callback($dus->CALLBACK_DISTANCE, 'cb_distance');

print "Press any key to exit...\n";
<STDIN>;
$ipcon->disconnect();
