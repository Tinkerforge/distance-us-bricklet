use std::{io, error::Error};
use std::thread;
use tinkerforge::{ip_connection::IpConnection, 
                  distance_us_bricklet::*};


const HOST: &str = "localhost";
const PORT: u16 = 4223;
const UID: &str = "XYZ"; // Change XYZ to the UID of your Distance US Bricklet.

fn main() -> Result<(), Box<dyn Error>> {
    let ipcon = IpConnection::new(); // Create IP connection.
    let dus = DistanceUsBricklet::new(UID, &ipcon); // Create device object.

    ipcon.connect((HOST, PORT)).recv()??; // Connect to brickd.
    // Don't use device before ipcon is connected.

		// Get threshold receivers with a debounce time of 10 seconds (10000ms).
		dus.set_debounce_period(10000);

     let distance_reached_receiver = dus.get_distance_reached_callback_receiver();

        // Spawn thread to handle received callback messages. 
        // This thread ends when the `dus` object
        // is dropped, so there is no need for manual cleanup.
        thread::spawn(move || {
            for distance_reached in distance_reached_receiver {           
                		println!("Distance Value: {}", distance_reached);
            }
        });

		// Configure threshold for distance value "smaller than 200".
		dus.set_distance_callback_threshold('<', 200, 0);

    println!("Press enter to exit.");
    let mut _input = String::new();
    io::stdin().read_line(&mut _input)?;
    ipcon.disconnect();
    Ok(())
}
