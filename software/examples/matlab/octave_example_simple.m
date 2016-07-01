function octave_example_simple()
    more off;

    HOST = "localhost";
    PORT = 4223;
    UID = "XYZ"; % Change XYZ to the UID of your Distance US Bricklet

    ipcon = java_new("com.tinkerforge.IPConnection"); % Create IP connection
    dus = java_new("com.tinkerforge.BrickletDistanceUS", UID, ipcon); % Create device object

    ipcon.connect(HOST, PORT); % Connect to brickd
    % Don't use device before ipcon is connected

    % Get current distance value
    distance = dus.getDistanceValue();
    fprintf("Distance Value: %d\n", distance);

    input("Press key to exit\n", "s");
    ipcon.disconnect();
end
