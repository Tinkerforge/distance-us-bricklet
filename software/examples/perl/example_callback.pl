#!/usr/bin/perl  

use Tinkerforge::IPConnection;
use Tinkerforge::BrickletDistanceUS;

use constant HOST => 'localhost';
use constant PORT => 4223;
use constant UID => 'abc'; # Change to your UID

my $ipcon = IPConnection->new(); # Create IP connection
my $dist = BrickletDistanceUS->new(&UID, $ipcon); # Create device object

# Callback function for distance value
sub cb_distance
{
    my($distance) = @_;
    print "\nDistance Value: ".$distance."\n";
}

$ipcon->connect(&HOST, &PORT); # Connect to brickd
# Don't use device before ipcon is connected

# Set Period for distance callback to 0.2s (200ms)
# Note: The callback is only called every 200ms if the 
#       distance has changed since the last call!
$dist->set_distance_callback_period(200);

# Register distance callback to function cb_distance
$dist->register_callback($dist->CALLBACK_DISTANCE, 'cb_distance');

print "\nPress any key to exit...\n";
<STDIN>;
$ipcon->disconnect();
