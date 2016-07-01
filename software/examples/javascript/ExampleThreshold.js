var Tinkerforge = require('tinkerforge');

var HOST = 'localhost';
var PORT = 4223;
var UID = 'XYZ'; // Change XYZ to the UID of your Distance US Bricklet

var ipcon = new Tinkerforge.IPConnection(); // Create IP connection
var dus = new Tinkerforge.BrickletDistanceUS(UID, ipcon); // Create device object

ipcon.connect(HOST, PORT,
    function (error) {
        console.log('Error: ' + error);
    }
); // Connect to brickd
// Don't use device before ipcon is connected

ipcon.on(Tinkerforge.IPConnection.CALLBACK_CONNECTED,
    function (connectReason) {
        // Get threshold callbacks with a debounce time of 10 seconds (10000ms)
        dus.setDebouncePeriod(10000);

        // Configure threshold for distance value "smaller than 200"
        dus.setDistanceCallbackThreshold('<', 200, 0);
    }
);

// Register distance value reached callback
dus.on(Tinkerforge.BrickletDistanceUS.CALLBACK_DISTANCE_REACHED,
    // Callback function for distance value reached callback
    function (distance) {
        console.log('Distance Value: ' + distance);
    }
);

console.log('Press key to exit');
process.stdin.on('data',
    function (data) {
        ipcon.disconnect();
        process.exit(0);
    }
);
