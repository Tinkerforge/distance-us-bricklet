#!/usr/bin/perl

use Tinkerforge::IPConnection;
use Tinkerforge::BrickletDistanceUS;

use constant HOST => 'localhost';
use constant PORT => 4223;
use constant UID => 'XYZ'; # Change XYZ to the UID of your Distance US Bricklet

# Callback subroutine for distance value reached callback
sub cb_distance_reached
{
    my ($distance) = @_;

    print "Distance Value: $distance\n";
}

my $ipcon = Tinkerforge::IPConnection->new(); # Create IP connection
my $dus = Tinkerforge::BrickletDistanceUS->new(&UID, $ipcon); # Create device object

$ipcon->connect(&HOST, &PORT); # Connect to brickd
# Don't use device before ipcon is connected

# Get threshold callbacks with a debounce time of 10 seconds (10000ms)
$dus->set_debounce_period(10000);

# Register distance value reached callback to subroutine cb_distance_reached
$dus->register_callback($dus->CALLBACK_DISTANCE_REACHED, 'cb_distance_reached');

# Configure threshold for distance value "smaller than 200"
$dus->set_distance_callback_threshold('<', 200, 0);

print "Press key to exit\n";
<STDIN>;
$ipcon->disconnect();
