function matlab_example_simple
    import com.tinkerforge.IPConnection;
    import com.tinkerforge.BrickletDistanceUS;

    HOST = 'localhost';
    PORT = 4223;
    UID = 'mYj'; % Change to your UID
    
    ipcon = IPConnection(); % Create IP connection
    dist = BrickletDistanceUS(UID, ipcon); % Create device object

    ipcon.connect(HOST, PORT); % Connect to brickd
    % Don't use device before ipcon is connected

    % Get current distance value
    distance = dist.getDistanceValue();
    fprintf('Distance Value: %g\n', distance);

    input('Press any key to exit...\n', 's');
    ipcon.disconnect();
end
