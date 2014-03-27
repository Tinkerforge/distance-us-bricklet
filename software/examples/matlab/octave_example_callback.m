function octave_example_callback
    more off;
    
    HOST = "localhost";
    PORT = 4223;
    UID = "mYj"; % Change to your UID

    ipcon = java_new("com.tinkerforge.IPConnection"); % Create IP connection
    dist = java_new("com.tinkerforge.BrickletDistanceUS", UID, ipcon); % Create device object

    ipcon.connect(HOST, PORT); % Connect to brickd
    % Don't use device before ipcon is connected

    % Set Period for distance callback to 0.2s (200ms)
    % Note: The callback is only called every 200ms if the 
    %       distance has changed since the last call!
    dist.setDistanceCallbackPeriod(200);

    % Register distance callback to function cb_distance
    dist.addDistanceListener("cb_distance");

    input("\nPress any key to exit...\n", "s");
    ipcon.disconnect();
end

% Callback function for distance value
function cb_distance(distance)
    fprintf("Distance Value: %g\n", distance);
end
