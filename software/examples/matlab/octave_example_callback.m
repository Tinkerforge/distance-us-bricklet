function octave_example_callback()
    more off;

    HOST = "localhost";
    PORT = 4223;
    UID = "XYZ"; % Change XYZ to the UID of your Distance US Bricklet

    ipcon = java_new("com.tinkerforge.IPConnection"); % Create IP connection
    dus = java_new("com.tinkerforge.BrickletDistanceUS", UID, ipcon); % Create device object

    ipcon.connect(HOST, PORT); % Connect to brickd
    % Don't use device before ipcon is connected

    % Register distance value callback to function cb_distance
    dus.addDistanceCallback(@cb_distance);

    % Set period for distance value callback to 0.2s (200ms)
    % Note: The distance value callback is only called every 0.2 seconds
    %       if the distance value has changed since the last call!
    dus.setDistanceCallbackPeriod(200);

    input("Press key to exit\n", "s");
    ipcon.disconnect();
end

% Callback function for distance value callback
function cb_distance(e)
    fprintf("Distance Value: %d\n", e.distance);
end
