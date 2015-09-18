function matlab_example_simple()
    import com.tinkerforge.IPConnection;
    import com.tinkerforge.BrickletDistanceUS;

    HOST = 'localhost';
    PORT = 4223;
    UID = 'XYZ'; % Change to your UID

    ipcon = IPConnection(); % Create IP connection
    dus = BrickletDistanceUS(UID, ipcon); % Create device object

    ipcon.connect(HOST, PORT); % Connect to brickd
    % Don't use device before ipcon is connected

    % Get current distance value
    distance = dus.getDistanceValue();
    fprintf('Distance Value: %i\n', distance);

    input('Press key to exit\n', 's');
    ipcon.disconnect();
end
