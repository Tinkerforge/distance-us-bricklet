/* distance-us-bricklet
 * Copyright (C) 2013 Olaf Lüke <olaf@tinkerforge.com>
 *
 * config.h: Distance US Bricklet specific configuration
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the
 * Free Software Foundation, Inc., 59 Temple Place - Suite 330,
 * Boston, MA 02111-1307, USA.
 */

#ifndef CONFIG_H
#define CONFIG_H

#include <stdint.h>
#include <stdbool.h>

#include "bricklib/drivers/board/sam3s/SAM3S.h"

#include "distance-us.h"

#define BRICKLET_FIRMWARE_VERSION_MAJOR 2
#define BRICKLET_FIRMWARE_VERSION_MINOR 0
#define BRICKLET_FIRMWARE_VERSION_REVISION 2

#define BRICKLET_HARDWARE_VERSION_MAJOR 1
#define BRICKLET_HARDWARE_VERSION_MINOR 0
#define BRICKLET_HARDWARE_VERSION_REVISION 0

#define BRICKLET_DEVICE_IDENTIFIER 229

#define MAX_ADC_VALUE ((1 << 12) - 1)
#define MAX_VOLTAGE 3300

#define PIN_ANALOG (BS->pin1_ad)
#define PIN_TRIGGER (BS->pin3_pwm)
#define PIN_DEPLEATE_CAP (BS->pin2_da)

#define BOARD_MCK 64000000

#define LOGGING_LEVEL LOGGING_DEBUG
#define DEBUG_BRICKLET 0

#define BRICKLET_HAS_SIMPLE_SENSOR
#define BRICKLET_NO_OFFSET
#define INVOCATION_IN_BRICKLET_CODE
#define NUM_SIMPLE_VALUES 1

typedef struct {
	int32_t value[NUM_SIMPLE_VALUES];
	int32_t last_value[NUM_SIMPLE_VALUES];

	uint32_t signal_period[NUM_SIMPLE_VALUES];
	uint32_t signal_period_counter[NUM_SIMPLE_VALUES];

	uint32_t threshold_debounce;
	uint32_t threshold_period_current[NUM_SIMPLE_VALUES];
	int32_t threshold_min[NUM_SIMPLE_VALUES];
	int32_t threshold_max[NUM_SIMPLE_VALUES];

	int32_t threshold_min_save[NUM_SIMPLE_VALUES];
	int32_t threshold_max_save[NUM_SIMPLE_VALUES];

	uint32_t tick;
	uint32_t moving_average_sum;

	uint16_t moving_average[MOVING_AVERAGE_MAX];

	uint16_t last_distance_value;
	uint8_t moving_average_num;
	uint8_t moving_average_tick;

	char threshold_option_save[NUM_SIMPLE_VALUES];
	char threshold_option[NUM_SIMPLE_VALUES];
	uint8_t state;
	uint8_t state_counter;
} BrickContext;

#endif
