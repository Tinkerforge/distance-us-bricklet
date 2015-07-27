import com.tinkerforge.IPConnection;
import com.tinkerforge.BrickletDistanceUS;

public class ExampleSimple {
	private static final String HOST = "localhost";
	private static final int PORT = 4223;
	private static final String UID = "XYZ"; // Change to your UID

	// Note: To make the example code cleaner we do not handle exceptions. Exceptions you
	//       might normally want to catch are described in the documentation
	public static void main(String args[]) throws Exception {
		IPConnection ipcon = new IPConnection(); // Create IP connection
		BrickletDistanceUS dus = new BrickletDistanceUS(UID, ipcon); // Create device object

		ipcon.connect(HOST, PORT); // Connect to brickd
		// Don't use device before ipcon is connected

		// Get current distance value
		int distanceValue = dus.getDistanceValue(); // Can throw com.tinkerforge.TimeoutException
		System.out.println("Distance Value: " + distanceValue);

		System.out.println("Press key to exit"); System.in.read();
		ipcon.disconnect();
	}
}
