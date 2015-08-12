#include <stdio.h>

#include "ip_connection.h"
#include "bricklet_distance_us.h"

#define HOST "localhost"
#define PORT 4223
#define UID "XYZ" // Change to your UID

int main(void) {
	// Create IP connection
	IPConnection ipcon;
	ipcon_create(&ipcon);

	// Create device object
	DistanceUS dus;
	distance_us_create(&dus, UID, &ipcon);

	// Connect to brickd
	if(ipcon_connect(&ipcon, HOST, PORT) < 0) {
		fprintf(stderr, "Could not connect\n");
		return 1;
	}
	// Don't use device before ipcon is connected

	// Get current distance value
	uint16_t distance_value;
	if(distance_us_get_distance_value(&dus, &distance_value) < 0) {
		fprintf(stderr, "Could not get distance value, probably timeout\n");
		return 1;
	}

	printf("Distance Value: %d\n", distance_value);

	printf("Press key to exit\n");
	getchar();
	ipcon_destroy(&ipcon); // Calls ipcon_disconnect internally
	return 0;
}
