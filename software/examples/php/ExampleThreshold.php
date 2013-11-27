<?php

require_once('Tinkerforge/IPConnection.php');
require_once('Tinkerforge/BrickletDistanceUS.php');

use Tinkerforge\IPConnection;
use Tinkerforge\BrickletDistanceUS;

$host = 'localhost';
$port = 4223;
$uid = 'XYZ'; // Change to your UID

// Callback for distance value smaller than 200
function cb_reached($distance)
{
    echo "Distance Value is smaller than 200: $distance\n";
}

$ipcon = new IPConnection(); // Create IP connection
$dist = new BrickletDistanceUS($uid, $ipcon); // Create device object

$ipcon->connect($host, $port); // Connect to brickd
// Don't use device before ipcon is connected

// Get threshold callbacks with a debounce time of 10 second (10000ms)
$dist->setDebouncePeriod(10000);

// Register threshold reached callback to function cb_reached
$dist->registerCallback(BrickletDistanceUS::CALLBACK_DISTANCE_REACHED, 'cb_reached');

// Configure threshold for "smaller than 200"
$dist->setDistanceCallbackThreshold('<', 200, 0);

echo "Press ctrl+c to exit\n";
$ipcon->dispatchCallbacks(-1); // Dispatch callbacks forever

?>
