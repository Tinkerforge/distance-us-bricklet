using Tinkerforge;

class Example
{
	private static string HOST = "localhost";
	private static int PORT = 4223;
	private static string UID = "XYZ"; // Change to your UID

	// Callback function for distance value
	static void DistanceCB(BrickletDistanceUS sender, int distance)
	{
		System.Console.WriteLine("Distance Value: " + distance);
	}

	static void Main() 
	{
		IPConnection ipcon = new IPConnection(); // Create IP connection
		BrickletDistanceUS dir = new BrickletDistanceUS(UID, ipcon); // Create device object

		ipcon.Connect(HOST, PORT); // Connect to brickd
		// Don't use device before ipcon is connected

		// Set Period for distance callback to 1s (1000ms)
		// Note: The distance callback is only called every second if the 
		//       distance has changed since the last call!
		dir.SetDistanceCallbackPeriod(1000);

		// Register distance callback to function DistanceCB
		dir.Distance += DistanceCB;

		System.Console.WriteLine("Press key to exit");
		System.Console.ReadKey();
		ipcon.Disconnect();
	}
}
