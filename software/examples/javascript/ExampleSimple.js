var Tinkerforge = require('tinkerforge');

var HOST = 'localhost';
var PORT = 4223;
var UID = 'jAw';// Change to your UID

var ipcon = new Tinkerforge.IPConnection();// Create IP connection
var dist = new Tinkerforge.BrickletDistanceUS(UID, ipcon);// Create device object

ipcon.connect(HOST, PORT,
    function(error) {
        console.log('Error: '+error);        
    }
);// Connect to brickd

// Don't use device before ipcon is connected
ipcon.on(Tinkerforge.IPConnection.CALLBACK_CONNECTED,
    function(connectReason) {
        // Get current distance value
        dist.getDistanceValue(
            function(distance) {
                console.log('Distance: '+distance);
            },
            function(error) {
                console.log('Error: '+error);
            }
        );
    }
);

console.log("Press any key to exit ...");
process.stdin.on('data',
    function(data) {
        ipcon.disconnect();
        process.exit(0);
    }
);

