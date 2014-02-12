var IPConnection = require('Tinkerforge/IPConnection');
var BrickletDistanceUS = require('Tinkerforge/BrickletDistanceUS');

var HOST = 'localhost';
var PORT = 4223;
var UID = 'jAw';// Change to your UID

var ipcon = new IPConnection();// Create IP connection
var dist = new BrickletDistanceUS(UID, ipcon);// Create device object

ipcon.connect(HOST, PORT,
    function(error) {
        console.log('Error: '+error);        
    }
);// Connect to brickd

// Don't use device before ipcon is connected
ipcon.on(IPConnection.CALLBACK_CONNECTED,
    function(connectReason) {
        // Get threshold callbacks with a debounce time of 10 seconds (10000ms)
        dist.setDebouncePeriod(10000);
        // Configure threshold for "smaller than 200"
        dist.setDistanceCallbackThreshold('<', 200, 0);
        // Set Period for distance callback to 0.2s (200ms)
        // Note: The callback is only called every 200ms if the 
        // distance has changed since the last call!
        dist.setDistanceCallbackPeriod(200);       
    }
);

// Register threshold reached callback
dist.on(BrickletDistanceUS.CALLBACK_DISTANCE_REACHED,
    // Callback for distance value smaller than 200
    function(distance) {
        console.log('Distance value is smaller than 200: '+distance);
    }
);

console.log("Press any key to exit ...");
process.stdin.on('data',
    function(data) {
        ipcon.disconnect();
        process.exit(0);
    }
);

