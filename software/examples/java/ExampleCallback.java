import com.tinkerforge.IPConnection;
import com.tinkerforge.BrickletDistanceUS;

public class ExampleCallback {
	private static final String HOST = "localhost";
	private static final int PORT = 4223;

	// Change XYZ to the UID of your Distance US Bricklet
	private static final String UID = "XYZ";

	// Note: To make the example code cleaner we do not handle exceptions. Exceptions
	//       you might normally want to catch are described in the documentation
	public static void main(String args[]) throws Exception {
		IPConnection ipcon = new IPConnection(); // Create IP connection
		BrickletDistanceUS dus = new BrickletDistanceUS(UID, ipcon); // Create device object

		ipcon.connect(HOST, PORT); // Connect to brickd
		// Don't use device before ipcon is connected

		// Add distance value listener
		dus.addDistanceListener(new BrickletDistanceUS.DistanceListener() {
			public void distance(int distance) {
				System.out.println("Distance Value: " + distance);
			}
		});

		// Set period for distance value callback to 0.2s (200ms)
		// Note: The distance value callback is only called every 0.2 seconds
		//       if the distance value has changed since the last call!
		dus.setDistanceCallbackPeriod(200);

		System.out.println("Press key to exit"); System.in.read();
		ipcon.disconnect();
	}
}
