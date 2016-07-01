function matlab_example_threshold()
    import com.tinkerforge.IPConnection;
    import com.tinkerforge.BrickletDistanceUS;

    HOST = 'localhost';
    PORT = 4223;
    UID = 'XYZ'; % Change XYZ to the UID of your Distance US Bricklet

    ipcon = IPConnection(); % Create IP connection
    dus = handle(BrickletDistanceUS(UID, ipcon), 'CallbackProperties'); % Create device object

    ipcon.connect(HOST, PORT); % Connect to brickd
    % Don't use device before ipcon is connected

    % Get threshold callbacks with a debounce time of 10 seconds (10000ms)
    dus.setDebouncePeriod(10000);

    % Register distance value reached callback to function cb_distance_reached
    set(dus, 'DistanceReachedCallback', @(h, e) cb_distance_reached(e));

    % Configure threshold for distance value "smaller than 200"
    dus.setDistanceCallbackThreshold('<', 200, 0);

    input('Press key to exit\n', 's');
    ipcon.disconnect();
end

% Callback function for distance value reached callback
function cb_distance_reached(e)
    fprintf('Distance Value: %i\n', e.distance);
end
