function matlab_example_callback()
    import com.tinkerforge.IPConnection;
    import com.tinkerforge.BrickletDistanceUS;

    HOST = 'localhost';
    PORT = 4223;
    UID = 'XYZ'; % Change to your UID

    ipcon = IPConnection(); % Create IP connection
    dus = BrickletDistanceUS(UID, ipcon); % Create device object

    ipcon.connect(HOST, PORT); % Connect to brickd
    % Don't use device before ipcon is connected

    % Register distance value callback to function cb_distance
    set(dus, 'DistanceCallback', @(h, e) cb_distance(e));

    % Set period for distance value callback to 0.2s (200ms)
    % Note: The distance value callback is only called every 0.2 seconds
    %       if the distance value has changed since the last call!
    dus.setDistanceCallbackPeriod(200);

    input('Press key to exit\n', 's');
    ipcon.disconnect();
end

% Callback function for distance value callback
function cb_distance(e)
    fprintf('Distance Value: %i\n', e.distance);
end
