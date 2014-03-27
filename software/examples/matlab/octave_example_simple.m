function octave_example_simple
    more off;
    
    HOST = "localhost";
    PORT = 4223;
    UID = "mYj"; % Change to your UID

    ipcon = java_new("com.tinkerforge.IPConnection"); % Create IP connection
    dist = java_new("com.tinkerforge.BrickletDistanceUS", UID, ipcon); % Create device object

    ipcon.connect(HOST, PORT); % Connect to brickd
    % Don't use device before ipcon is connected

    % Get current distance value
    distance = dist.getDistanceValue();

    fprintf("Distance Value: %g\n", distance);

    input("\nPress any key to exit...\n", "s");
    ipcon.disconnect();
end
