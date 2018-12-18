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

	// Get current distance value.
	distance, _ := dus.GetDistanceValue()
	fmt.Printf("Distance Value: \n", distance)

	fmt.Print("Press enter to exit.")
	fmt.Scanln()

}
