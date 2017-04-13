using System;
using Tinkerforge;

class Example
{
	private static string HOST = "localhost";
	private static int PORT = 4223;
	private static string UID = "XYZ"; // Change XYZ to the UID of your Distance US Bricklet

	// Callback function for distance value reached callback
	static void DistanceReachedCB(BrickletDistanceUS sender, int distance)
	{
		Console.WriteLine("Distance Value: " + distance);
	}

	static void Main()
	{
		IPConnection ipcon = new IPConnection(); // Create IP connection
		BrickletDistanceUS dus = new BrickletDistanceUS(UID, ipcon); // Create device object

		ipcon.Connect(HOST, PORT); // Connect to brickd
		// Don't use device before ipcon is connected

		// Get threshold callbacks with a debounce time of 10 seconds (10000ms)
		dus.SetDebouncePeriod(10000);

		// Register distance value reached callback to function DistanceReachedCB
		dus.DistanceReachedCallback += DistanceReachedCB;

		// Configure threshold for distance value "smaller than 200"
		dus.SetDistanceCallbackThreshold('<', 200, 0);

		Console.WriteLine("Press enter to exit");
		Console.ReadLine();
		ipcon.Disconnect();
	}
}
