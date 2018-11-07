use std::{error::Error, io, thread};
use tinkerforge::{distance_us_bricklet::*, ip_connection::IpConnection};

const HOST: &str = "localhost";
const PORT: u16 = 4223;
const UID: &str = "XYZ"; // Change XYZ to the UID of your Distance US Bricklet.

fn main() -> Result<(), Box<dyn Error>> {
    let ipcon = IpConnection::new(); // Create IP connection.
    let dus = DistanceUsBricklet::new(UID, &ipcon); // Create device object.

    ipcon.connect((HOST, PORT)).recv()??; // Connect to brickd.
                                          // Don't use device before ipcon is connected.

    // Create receiver for distance value events.
    let distance_receiver = dus.get_distance_receiver();

    // Spawn thread to handle received events. This thread ends when the `dus` object
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
