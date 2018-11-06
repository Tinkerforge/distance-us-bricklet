use std::{error::Error, io, thread};
use tinkerforge::{distance_us_bricklet::*, ipconnection::IpConnection};

const HOST: &str = "127.0.0.1";
const PORT: u16 = 4223;
const UID: &str = "XYZ"; // Change XYZ to the UID of your Distance US Bricklet

fn main() -> Result<(), Box<dyn Error>> {
    let ipcon = IpConnection::new(); // Create IP connection
    let distance_us_bricklet = DistanceUSBricklet::new(UID, &ipcon); // Create device object

    ipcon.connect(HOST, PORT).recv()??; // Connect to brickd
                                        // Don't use device before ipcon is connected

    // Get threshold listeners with a debounce time of 10 seconds (10000ms)
    distance_us_bricklet.set_debounce_period(10000);

    //Create listener for distance value reached events.
    let distance_reached_listener = distance_us_bricklet.get_distance_reached_receiver();
    // Spawn thread to handle received events. This thread ends when the distance_us_bricklet
    // is dropped, so there is no need for manual cleanup.
    thread::spawn(move || {
        for event in distance_reached_listener {
            println!("Distance Value: {}", event);
        }
    });

    // Configure threshold for distance value "smaller than 200"
    distance_us_bricklet.set_distance_callback_threshold('<', 200, 0);

    println!("Press enter to exit.");
    let mut _input = String::new();
    io::stdin().read_line(&mut _input)?;
    ipcon.disconnect();
    Ok(())
}
