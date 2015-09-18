<?php

require_once('Tinkerforge/IPConnection.php');
require_once('Tinkerforge/BrickletDistanceUS.php');

use Tinkerforge\IPConnection;
use Tinkerforge\BrickletDistanceUS;

const HOST = 'localhost';
const PORT = 4223;
const UID = 'XYZ'; // Change to your UID

// Callback function for distance value callback
function cb_distance($distance)
{
    echo "Distance Value: $distance\n";
}

$ipcon = new IPConnection(); // Create IP connection
$dus = new BrickletDistanceUS(UID, $ipcon); // Create device object

$ipcon->connect(HOST, PORT); // Connect to brickd
// Don't use device before ipcon is connected

// Register distance value callback to function cb_distance
$dus->registerCallback(BrickletDistanceUS::CALLBACK_DISTANCE, 'cb_distance');

// Set period for distance value callback to 0.2s (200ms)
// Note: The distance value callback is only called every 0.2 seconds
//       if the distance value has changed since the last call!
$dus->setDistanceCallbackPeriod(200);

echo "Press ctrl+c to exit\n";
$ipcon->dispatchCallbacks(-1); // Dispatch callbacks forever

?>
