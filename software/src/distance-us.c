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

void constructor(void) {
	BC->state = STATE_ANALOG_LOW;

	PIN_ANALOG.type = PIO_INPUT;
	PIN_ANALOG.attribute = PIO_DEFAULT;
	BA->PIO_Configure(&PIN_ANALOG, 1);

	PIN_TRIGGER.type = PIO_OUTPUT_0;
	PIN_TRIGGER.attribute = PIO_DEFAULT;
	BA->PIO_Configure(&PIN_TRIGGER, 1);

	PIN_DEPLEATE_CAP.type = PIO_OUTPUT_1;
	PIN_DEPLEATE_CAP.attribute = PIO_DEFAULT;
	BA->PIO_Configure(&PIN_DEPLEATE_CAP, 1);

	adc_channel_enable(BS->adc_channel);

	simple_constructor();
}

void destructor(void) {
	simple_destructor();

	PIN_ANALOG.type = PIO_INPUT;
	PIN_ANALOG.attribute = PIO_PULLUP;
    BA->PIO_Configure(&PIN_ANALOG, 1);

    PIN_TRIGGER.type = PIO_INPUT;
    PIN_TRIGGER.attribute = PIO_PULLUP;
    BA->PIO_Configure(&PIN_TRIGGER, 1);

	adc_channel_disable(BS->adc_channel);
}

int32_t analog_value_from_mc(const int32_t value) {
	return BA->adc_channel_get_data(BS->adc_channel);
}

int32_t distance_from_analog_value(const int32_t value) {
	int32_t ret_value = BC->last_distance;

	switch(BC->state) {
		case STATE_ANALOG_LOW: {
			if(BC->state_counter == 0) {
				PIN_DEPLEATE_CAP.type = PIO_OUTPUT_0;
				BA->PIO_Configure(&PIN_DEPLEATE_CAP, 1);

				PIN_TRIGGER.type = PIO_OUTPUT_0;
			    BA->PIO_Configure(&PIN_TRIGGER, 1);

			    SLEEP_US(10);

			    PIN_TRIGGER.type = PIO_OUTPUT_1;
			    BA->PIO_Configure(&PIN_TRIGGER, 1);

			    adc_channel_enable(BS->adc_channel);

				BC->state = STATE_ANALOG_MEASURE;
				BC->state_counter = 25;


				break;

				BC->state = STATE_TRIGGER_LOW;
				BC->state_counter = 0;
			} else {
				BC->state_counter--;
			}
			break;
		}

		case STATE_TRIGGER_LOW: {
			if(BC->state_counter == 0) {
			    PIN_TRIGGER.type = PIO_OUTPUT_1;
			    BA->PIO_Configure(&PIN_TRIGGER, 1);

			    adc_channel_enable(BS->adc_channel);

				BC->state = STATE_ANALOG_MEASURE;
				BC->state_counter = 25;
			} else {
				BC->state_counter--;
			}
			break;
		}

		case STATE_ANALOG_MEASURE: {
			if(BC->state_counter == 0) {
				ret_value = BA->adc_channel_get_data(BS->adc_channel);
				BA->printf("value: %d\n\r", ret_value);
			    adc_channel_disable(BS->adc_channel);

			    PIN_DEPLEATE_CAP.type = PIO_OUTPUT_1;
				BA->PIO_Configure(&PIN_DEPLEATE_CAP, 1);

				BC->state = STATE_ANALOG_LOW;
				BC->state_counter = 1;
			} else {
				BC->state_counter--;
			}
			break;
		}

		default: {
			BC->state = STATE_ANALOG_LOW;
			break; // TODO: Error?
		}
	}

	BC->last_distance = ret_value;
	return ret_value;
}

void tick(const uint8_t tick_type) {
	simple_tick(tick_type);
}
