<?php

require_once('Tinkerforge/IPConnection.php');
require_once('Tinkerforge/BrickletDistanceUS.php');

use Tinkerforge\IPConnection;
use Tinkerforge\BrickletDistanceUS;

$host = 'localhost';
$port = 4223;
$uid = 'XYZ'; // Change to your UID

$ipcon = new IPConnection(); // Create IP connection
$dist = new BrickletDistanceUS($uid, $ipcon); // Create device object

$ipcon->connect($host, $port); // Connect to brickd
// Don't use device before ipcon is connected

// Get current distance (unit is mm)
$distance = $dist->getDistance() / 10.0;

echo "Distance: $distance cm\n";

echo "Press key to exit\n";
fgetc(fopen('php://stdin', 'r'));
$ipcon->disconnect();

?>
