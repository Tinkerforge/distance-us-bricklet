package main

import (
	"fmt"
	"github.com/tinkerforge/go-api-bindings/distance_us_bricklet"
	"github.com/tinkerforge/go-api-bindings/ipconnection"
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

	dus.RegisterDistanceCallback(func(distance uint16) {
		fmt.Printf("Distance Value: %d\n", distance)
	})

	// Set period for distance value receiver to 0.2s (200ms).
	// Note: The distance value callback is only called every 0.2 seconds
	//       if the distance value has changed since the last call!
	dus.SetDistanceCallbackPeriod(200)

	fmt.Print("Press enter to exit.")
	fmt.Scanln()

}
