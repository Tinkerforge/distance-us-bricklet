using System;
using Tinkerforge;

class Example
{
	private static string HOST = "localhost";
	private static int PORT = 4223;
	private static string UID = "XYZ"; // Change XYZ to the UID of your Distance US Bricklet

	// Callback function for distance value callback
	static void DistanceCB(BrickletDistanceUS sender, int distance)
	{
		Console.WriteLine("Distance Value: " + distance);
	}

	static void Main()
	{
		IPConnection ipcon = new IPConnection(); // Create IP connection
		BrickletDistanceUS dus = new BrickletDistanceUS(UID, ipcon); // Create device object

		ipcon.Connect(HOST, PORT); // Connect to brickd
		// Don't use device before ipcon is connected

		// Register distance value callback to function DistanceCB
		dus.Distance += DistanceCB;

		// Set period for distance value callback to 0.2s (200ms)
		// Note: The distance value callback is only called every 0.2 seconds
		//       if the distance value has changed since the last call!
		dus.SetDistanceCallbackPeriod(200);

		Console.WriteLine("Press enter to exit");
		Console.ReadLine();
		ipcon.Disconnect();
	}
}
