#include <stdio.h>

#include "ip_connection.h"
#include "bricklet_distance_us.h"

#define HOST "localhost"
#define PORT 4223
#define UID "XYZ" // Change to your UID

// Callback function for distance value callback
void cb_distance(uint16_t distance, void *user_data) {
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

	// Set period for distance value callback to 0.2s (200ms)
	// Note: The distance value callback is only called every 0.2 seconds
	//       if the distance value has changed since the last call!
	distance_us_set_distance_callback_period(&dus, 200);

	// Register distance value callback to function cb_distance
	distance_us_register_callback(&dus,
	                              DISTANCE_US_CALLBACK_DISTANCE,
	                              (void *)cb_distance,
	                              NULL);

	printf("Press key to exit\n");
	getchar();
	ipcon_destroy(&ipcon); // Calls ipcon_disconnect internally
}
