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

     let distance_receiver = dus.get_distance_callback_receiver();

        // Spawn thread to handle received callback messages. 
        // This thread ends when the `dus` object
        // is dropped, so there is no need for manual cleanup.
        thread::spawn(move || {
            for distance in distance_receiver {           
                		println!("Distance Value: {}", distance);
            }
        });

		// Set period for distance value receiver to 0.2s (200ms).
		// Note: The distance value callback is only called every 0.2 seconds
		//       if the distance value has changed since the last call!
		dus.set_distance_callback_period(200);

    println!("Press enter to exit.");
    let mut _input = String::new();
    io::stdin().read_line(&mut _input)?;
    ipcon.disconnect();
    Ok(())
}
