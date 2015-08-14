import com.tinkerforge.IPConnection;
import com.tinkerforge.BrickletDistanceUS;

public class ExampleThreshold {
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

		// Get threshold callbacks with a debounce time of 10 seconds (10000ms)
		dus.setDebouncePeriod(10000);

		// Configure threshold for "smaller than 200"
		dus.setDistanceCallbackThreshold('<', 200, 0);

		// Add threshold reached listener for distance value smaller than 200
		dus.addDistanceReachedListener(new BrickletDistanceUS.DistanceReachedListener() {
			public void distanceReached(int distance) {
				System.out.println("Distance Value: " + distance);
			}
		});

		System.out.println("Press key to exit"); System.in.read();
		ipcon.disconnect();
	}
}
