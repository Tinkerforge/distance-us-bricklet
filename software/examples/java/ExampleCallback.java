import com.tinkerforge.BrickletDistanceUS;
import com.tinkerforge.IPConnection;

public class ExampleCallback {
	private static final String HOST = "localhost";
	private static final int PORT = 4223;
	private static final String UID = "XYZ"; // Change to your UID
	
	// Note: To make the example code cleaner we do not handle exceptions. Exceptions you
	//       might normally want to catch are described in the documentation
	public static void main(String args[]) throws Exception {
		IPConnection ipcon = new IPConnection(); // Create IP connection
		BrickletDistanceUS dir = new BrickletDistanceUS(UID, ipcon); // Create device object

		ipcon.connect(HOST, PORT); // Connect to brickd
		// Don't use device before ipcon is connected

		// Set Period for distance callback to 1s (1000ms)
		// Note: The distance callback is only called every second if the 
		//       distance has changed since the last call!
		dir.setDistanceCallbackPeriod(1000);

		// Add and implement distance listener (called if distance changes)
		dir.addDistanceListener(new BrickletDistanceUS.DistanceListener() {
			public void distance(int distance) {
				System.out.println("Distance Value: " + distance);
			}
		});

		System.console().readLine("Press key to exit\n");
		ipcon.disconnect();
	}
}
