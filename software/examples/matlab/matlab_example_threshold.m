function matlab_example_threshold
    import com.tinkerforge.IPConnection;
    import com.tinkerforge.BrickletDistanceUS;

    HOST = 'localhost';
    PORT = 4223;
    UID = 'mYj'; % Change to your UID
    
    ipcon = IPConnection(); % Create IP connection
    dist = BrickletDistanceUS(UID, ipcon); % Create device object

    ipcon.connect(HOST, PORT); % Connect to brickd
    % Don't use device before ipcon is connected

    % Get threshold callbacks with a debounce time of 10 seconds (10000ms)
    dist.setDebouncePeriod(10000);

    % Register threshold reached callback to function cb_reached
    set(dist, 'DistanceReachedCallback', @(h, e) cb_reached(e));

    % Configure threshold for "smaller than 200"
    dist.setDistanceCallbackThreshold('<', 200, 0);

    input('Press any key to exit...\n', 's');
    ipcon.disconnect();
end

% Callback for distance value smaller than 200
function cb_reached(e)
    fprintf('Distance Value is smaller than 200: %g\n', e.distance);
end
