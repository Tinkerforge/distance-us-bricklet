/* distance-us-bricklet
 * Copyright (C) 2013 Olaf Lüke <olaf@tinkerforge.com>
 *
 * distance-us.h: Implementation of Distance US Bricklet messages
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

#ifndef DISTANCE_US_H
#define DISTANCE_US_H

#include <stdint.h>
#include "bricklib/com/com_common.h"

#define STATE_WAIT_VCC     0
#define STATE_VCC          1
#define STATE_WAIT_ANALOG  2
#define STATE_ANALOG       3


#define FID_GET_DISTANCE 1
#define FID_GET_ANALOG_VALUE 2
#define FID_SET_DISTANCE_CALLBACK_PERIOD 3
#define FID_GET_DISTANCE_CALLBACK_PERIOD 4
#define FID_SET_ANALOG_VALUE_CALLBACK_PERIOD 5
#define FID_GET_ANALOG_VALUE_CALLBACK_PERIOD 6
#define FID_SET_DISTANCE_CALLBACK_THRESHOLD 7
#define FID_GET_DISTANCE_CALLBACK_THRESHOLD 8
#define FID_SET_ANALOG_VALUE_CALLBACK_THRESHOLD 9
#define FID_GET_ANALOG_VALUE_CALLBACK_THRESHOLD 10
#define FID_SET_DEBOUNCE_PERIOD 11
#define FID_GET_DEBOUNCE_PERIOD 12
#define FID_DISTANCE 13
#define FID_ANALOG_VALUE 14
#define FID_DISTANCE_REACHED 15
#define FID_ANALOG_VALUE_REACHED 16

#define FID_LAST 12

int32_t analog_value_from_mc(const int32_t value);
int32_t distance_from_analog_value(const int32_t value);

void invocation(const ComType com, const uint8_t *data);
void constructor(void);
void destructor(void);
void tick(const uint8_t tick_type);

#endif
