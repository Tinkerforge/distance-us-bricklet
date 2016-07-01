#!/usr/bin/perl

use Tinkerforge::IPConnection;
use Tinkerforge::BrickletDistanceUS;

use constant HOST => 'localhost';
use constant PORT => 4223;
use constant UID => 'XYZ'; # Change XYZ to the UID of your Distance US Bricklet

# Callback subroutine for distance value callback
sub cb_distance
{
    my ($distance) = @_;

    print "Distance Value: $distance\n";
}

my $ipcon = Tinkerforge::IPConnection->new(); # Create IP connection
my $dus = Tinkerforge::BrickletDistanceUS->new(&UID, $ipcon); # Create device object

$ipcon->connect(&HOST, &PORT); # Connect to brickd
# Don't use device before ipcon is connected

# Register distance value callback to subroutine cb_distance
$dus->register_callback($dus->CALLBACK_DISTANCE, 'cb_distance');

# Set period for distance value callback to 0.2s (200ms)
# Note: The distance value callback is only called every 0.2 seconds
#       if the distance value has changed since the last call!
$dus->set_distance_callback_period(200);

print "Press key to exit\n";
<STDIN>;
$ipcon->disconnect();
