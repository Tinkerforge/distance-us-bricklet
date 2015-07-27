#include <stdio.h>

#include "ip_connection.h"
#include "bricklet_distance_us.h"

#define HOST "localhost"
#define PORT 4223
#define UID "XYZ" // Change to your UID

// Callback function for distance value smaller than 200
void cb_distance_reached(uint16_t distance, void *user_data) {
	(void)user_data; // avoid unused parameter warning

	printf("Distance Value: %d\n", distance);
}

int main() {
	// Create IP connection
	IPConnection ipcon;
	ipcon_create(&ipcon);

	// Create device object
	DistanceUS dus;
	distance_us_create(&dus, UID, &ipcon);

	// Connect to brickd
	if(ipcon_connect(&ipcon, HOST, PORT) < 0) {
		fprintf(stderr, "Could not connect\n");
		exit(1);
	}
	// Don't use device before ipcon is connected

	// Get threshold callbacks with a debounce time of 10 seconds (10000ms)
	distance_us_set_debounce_period(&dus, 10000);

	// Register threshold reached callback to function cb_distance_reached
	distance_us_register_callback(&dus,
	                              DISTANCE_US_CALLBACK_DISTANCE_REACHED,
	                              (void *)cb_distance_reached,
	                              NULL);

	// Configure threshold for "smaller than 200"
	distance_us_set_distance_callback_threshold(&dus, '<', 200, 0);

	printf("Press key to exit\n");
	getchar();
	ipcon_destroy(&ipcon); // Calls ipcon_disconnect internally
}
