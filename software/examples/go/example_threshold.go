package main

import (
	"fmt"
	"tinkerforge/distance_us_bricklet"
	"tinkerforge/ipconnection"
)

const ADDR string = "localhost:4223"
const UID string = "XYZ" // Change XYZ to the UID of your Distance US Bricklet.

func main() {
	ipcon := ipconnection.New()
	defer ipcon.Close()
	dus, _ := distance_us_bricklet.New(UID, &ipcon) // Create device object.

	ipcon.Connect(ADDR) // Connect to brickd.
	defer ipcon.Disconnect()
	// Don't use device before ipcon is connected.

	// Get threshold receivers with a debounce time of 10 seconds (10000ms).
	dus.SetDebouncePeriod(10000)

	dus.RegisterDistanceReachedCallback(func(distance uint16) {
		fmt.Printf("Distance Value: %d\n", distance)
	})

	// Configure threshold for distance value "smaller than 200".
	dus.SetDistanceCallbackThreshold('<', 200, 0)

	fmt.Print("Press enter to exit.")
	fmt.Scanln()

}
