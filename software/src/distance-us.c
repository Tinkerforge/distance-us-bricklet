/* distance-us-bricklet
 * Copyright (C) 2013 Olaf Lüke <olaf@tinkerforge.com>
 *
 * distance-us.c: Implementation of Distance US Bricklet messages
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

#include "distance-us.h"

#include "bricklib/bricklet/bricklet_communication.h"
#include "bricklib/utility/util_definitions.h"
#include "bricklib/drivers/adc/adc.h"
#include "brickletlib/bricklet_entry.h"
#include "brickletlib/bricklet_simple.h"
#include "config.h"

#define SIMPLE_UNIT_ANALOG_VALUE 0
#define SIMPLE_UNIT_DISTANCE 1

const SimpleMessageProperty smp[] = {
	{SIMPLE_UNIT_DISTANCE, SIMPLE_TRANSFER_VALUE, SIMPLE_DIRECTION_GET}, // TYPE_GET_DISTANCE
	{SIMPLE_UNIT_ANALOG_VALUE, SIMPLE_TRANSFER_VALUE, SIMPLE_DIRECTION_GET}, // TYPE_GET_ANALOG_VALUE
	{SIMPLE_UNIT_DISTANCE, SIMPLE_TRANSFER_PERIOD, SIMPLE_DIRECTION_SET}, // TYPE_SET_DISTANCE_CALLBACK_PERIOD
	{SIMPLE_UNIT_DISTANCE, SIMPLE_TRANSFER_PERIOD, SIMPLE_DIRECTION_GET}, // TYPE_GET_DISTANCE_CALLBACK_PERIOD
	{SIMPLE_UNIT_ANALOG_VALUE, SIMPLE_TRANSFER_PERIOD, SIMPLE_DIRECTION_SET}, // TYPE_SET_ANALOG_VALUE_CALLBACK_PERIOD
	{SIMPLE_UNIT_ANALOG_VALUE, SIMPLE_TRANSFER_PERIOD, SIMPLE_DIRECTION_GET}, // TYPE_GET_ANALOG_VALUE_CALLBACK_PERIOD
	{SIMPLE_UNIT_DISTANCE, SIMPLE_TRANSFER_THRESHOLD, SIMPLE_DIRECTION_SET}, // TYPE_SET_DISTANCE_CALLBACK_THRESHOLD
	{SIMPLE_UNIT_DISTANCE, SIMPLE_TRANSFER_THRESHOLD, SIMPLE_DIRECTION_GET}, // TYPE_GET_DISTANCE_CALLBACK_THRESHOLD
	{SIMPLE_UNIT_ANALOG_VALUE, SIMPLE_TRANSFER_THRESHOLD, SIMPLE_DIRECTION_SET}, // TYPE_SET_ANALOG_VALUE_CALLBACK_THRESHOLD
	{SIMPLE_UNIT_ANALOG_VALUE, SIMPLE_TRANSFER_THRESHOLD, SIMPLE_DIRECTION_GET}, // TYPE_GET_ANALOG_VALUE_CALLBACK_THRESHOLD
	{0, SIMPLE_TRANSFER_DEBOUNCE, SIMPLE_DIRECTION_SET}, // TYPE_SET_DEBOUNCE_PERIOD
	{0, SIMPLE_TRANSFER_DEBOUNCE, SIMPLE_DIRECTION_GET}, // TYPE_GET_DEBOUNCE_PERIOD
};

const SimpleUnitProperty sup[] = {
	{analog_value_from_mc, SIMPLE_SIGNEDNESS_UINT, FID_ANALOG_VALUE, FID_ANALOG_VALUE_REACHED, SIMPLE_UNIT_ANALOG_VALUE}, // analog value
	{distance_from_analog_value, SIMPLE_SIGNEDNESS_INT, FID_DISTANCE, FID_DISTANCE_REACHED, SIMPLE_UNIT_ANALOG_VALUE}, // distance
};

const uint8_t smp_length = sizeof(smp);


void invocation(const ComType com, const uint8_t *data) {
	simple_invocation(com, data);

	if(((MessageHeader*)data)->fid > FID_LAST) {
		BA->com_return_error(data, sizeof(MessageHeader), MESSAGE_ERROR_CODE_NOT_SUPPORTED, com);
	}
}

// TODO: Change to new sensor type when prototype arrives
void constructor(void) {
	PIN_ENABLE.type = PIO_INPUT;
	PIN_ENABLE.attribute = PIO_DEFAULT;
	BA->PIO_Configure(&PIN_ENABLE, 1);

    PIN_SWITCH_SENSOR.type = PIO_OUTPUT_0;
    BA->PIO_Configure(&PIN_SWITCH_SENSOR, 1);

	while(true) {
		adc_channel_disable(BS->adc_channel);
		PIN_ANALOG.type = PIO_OUTPUT_0;
		PIN_ANALOG.attribute = PIO_DEFAULT;
		BA->PIO_Configure(&PIN_ANALOG, 1);
		SLEEP_MS(6);

	    PIN_SWITCH_SENSOR.type = PIO_OUTPUT_1;
	    BA->PIO_Configure(&PIN_SWITCH_SENSOR, 1);
	    SLEEP_MS(1);
	    PIN_SWITCH_SENSOR.type = PIO_OUTPUT_0;
	    BA->PIO_Configure(&PIN_SWITCH_SENSOR, 1);

		PIN_ANALOG.type = PIO_DEFAULT;
		PIN_ANALOG.attribute = PIO_DEFAULT;
		BA->PIO_Configure(&PIN_ANALOG, 1);
		adc_channel_enable(BS->adc_channel);

		while(!(PIN_ENABLE.pio->PIO_PDSR & PIN_ENABLE.mask));
		while(PIN_ENABLE.pio->PIO_PDSR & PIN_ENABLE.mask);
		SLEEP_MS(50);
		BA->printf("value: %d\n\r", BA->adc_channel_get_data(BS->adc_channel));

	}


	adc_channel_enable(BS->adc_channel);

    PIN_ANALOG.type = PIO_INPUT;
    PIN_ANALOG.attribute = PIO_DEFAULT;
    BA->PIO_Configure(&PIN_ANALOG, 1);

    PIN_ENABLE.type = PIO_OUTPUT_1;
    BA->PIO_Configure(&PIN_ENABLE, 1);

    PIN_SWITCH_SENSOR.type = PIO_OUTPUT_0;
    BA->PIO_Configure(&PIN_SWITCH_SENSOR, 1);

    PIN_SWITCH_VCC.type = PIO_OUTPUT_1;
    BA->PIO_Configure(&PIN_SWITCH_VCC, 1);

    BC->state = STATE_WAIT_VCC;
    BC->state_counter = 2;

	simple_constructor();
}

void destructor(void) {
	simple_destructor();

	PIN_ANALOG.type = PIO_INPUT;
	PIN_ANALOG.attribute = PIO_PULLUP;
    BA->PIO_Configure(&PIN_ANALOG, 1);

    PIN_ENABLE.type = PIO_INPUT;
    PIN_ENABLE.attribute = PIO_PULLUP;
    BA->PIO_Configure(&PIN_ENABLE, 1);

    PIN_SWITCH_SENSOR.type = PIO_INPUT;
    PIN_SWITCH_SENSOR.attribute = PIO_PULLUP;
    BA->PIO_Configure(&PIN_SWITCH_SENSOR, 1);

    PIN_SWITCH_VCC.type = PIO_INPUT;
    PIN_SWITCH_VCC.attribute = PIO_PULLUP;
    BA->PIO_Configure(&PIN_SWITCH_VCC, 1);

	adc_channel_disable(BS->adc_channel);
}

int32_t analog_value_from_mc(const int32_t value) {
	return BA->adc_channel_get_data(BS->adc_channel);
}

int32_t distance_from_analog_value(const int32_t value) {
	switch(BC->state) {
		case STATE_WAIT_VCC: {
			if(BC->state_counter == 0) {
				BC->state = STATE_VCC;
			} else {
				BC->state_counter--;
			}
			break;
		}

		case STATE_VCC: {
			BC->state_counter = 2;
			BC->last_vcc = value;
			BC->state = STATE_WAIT_ANALOG;

		    PIN_SWITCH_VCC.type = PIO_OUTPUT_0;
		    BA->PIO_Configure(&PIN_SWITCH_VCC, 1);

		    PIN_SWITCH_SENSOR.type = PIO_OUTPUT_1;
		    BA->PIO_Configure(&PIN_SWITCH_SENSOR, 1);
			break;
		}

		case STATE_WAIT_ANALOG: {
			if(BC->state_counter == 0) {
				BC->state = STATE_ANALOG;
			} else {
				BC->state_counter--;
			}
			break;
		}

		case STATE_ANALOG: {
			// vcc = vcc_value*3300*1680/(4095*1000)
			// analog = analog_value*3300/4095
			// cm = analog/(vcc/1024)
			const uint32_t vcc = ((uint32_t)BC->last_vcc)*3300*168/(4095*100);
			const uint32_t analog = value*3300/4095;
			BC->last_distance = analog*1024/vcc;

			BA->printf("values: %d %d, %d %d -> %d\n\r", BC->last_vcc, value, vcc, analog, BC->last_distance);

			BC->state_counter = 2;
			BC->state = STATE_WAIT_VCC;

		    PIN_SWITCH_SENSOR.type = PIO_OUTPUT_0;
		    BA->PIO_Configure(&PIN_SWITCH_SENSOR, 1);

		    PIN_SWITCH_VCC.type = PIO_OUTPUT_1;
		    BA->PIO_Configure(&PIN_SWITCH_VCC, 1);
			break;
		}

		default: {
			break; // TODO: Error?
		}
	}

	return BC->last_distance;
}

void tick(const uint8_t tick_type) {
	simple_tick(tick_type);
}
