<?php

require_once('Tinkerforge/IPConnection.php');
require_once('Tinkerforge/BrickletDistanceUS.php');

use Tinkerforge\IPConnection;
use Tinkerforge\BrickletDistanceUS;

const HOST = 'localhost';
const PORT = 4223;
const UID = 'XYZ'; // Change to your UID

// Callback function for distance value reached callback
function cb_distanceReached($distance)
{
    echo "Distance Value: $distance\n";
}

$ipcon = new IPConnection(); // Create IP connection
$dus = new BrickletDistanceUS(UID, $ipcon); // Create device object

$ipcon->connect(HOST, PORT); // Connect to brickd
// Don't use device before ipcon is connected

// Get threshold callbacks with a debounce time of 10 seconds (10000ms)
$dus->setDebouncePeriod(10000);

// Register distance value reached callback to function cb_distanceReached
$dus->registerCallback(BrickletDistanceUS::CALLBACK_DISTANCE_REACHED, 'cb_distanceReached');

// Configure threshold for distance value "smaller than 200"
$dus->setDistanceCallbackThreshold('<', 200, 0);

echo "Press ctrl+c to exit\n";
$ipcon->dispatchCallbacks(-1); // Dispatch callbacks forever

?>
