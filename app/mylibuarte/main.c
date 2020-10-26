/**
 * Copyright (c) 2014 - 2020, Nordic Semiconductor ASA
 *
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without modification,
 * are permitted provided that the following conditions are met:
 *
 * 1. Redistributions of source code must retain the above copyright notice, this
 *    list of conditions and the following disclaimer.
 *
 * 2. Redistributions in binary form, except as embedded into a Nordic
 *    Semiconductor ASA integrated circuit in a product or a software update for
 *    such product, must reproduce the above copyright notice, this list of
 *    conditions and the following disclaimer in the documentation and/or other
 *    materials provided with the distribution.
 *
 * 3. Neither the name of Nordic Semiconductor ASA nor the names of its
 *    contributors may be used to endorse or promote products derived from this
 *    software without specific prior written permission.
 *
 * 4. This software, with or without modification, must only be used with a
 *    Nordic Semiconductor ASA integrated circuit.
 *
 * 5. Any software provided in binary form under this license must not be reverse
 *    engineered, decompiled, modified and/or disassembled.
 *
 * THIS SOFTWARE IS PROVIDED BY NORDIC SEMICONDUCTOR ASA "AS IS" AND ANY EXPRESS
 * OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
 * OF MERCHANTABILITY, NONINFRINGEMENT, AND FITNESS FOR A PARTICULAR PURPOSE ARE
 * DISCLAIMED. IN NO EVENT SHALL NORDIC SEMICONDUCTOR ASA OR CONTRIBUTORS BE
 * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
 * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE
 * GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
 * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
 * LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT
 * OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 *
 */
/** @file
 * @defgroup pin_change_int_example_main main.c
 * @{
 * @ingroup pin_change_int_example
 * @brief Pin Change Interrupt Example Application main file.
 *
 * This file contains the source code for a sample application using interrupts triggered by GPIO pins.
 *
 */

#include <ubinos.h>

#if (INCLUDE__APP__mylibuarte == 1)

#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <stdbool.h>
#include <stdint.h>

#include <bsp.h>
#include "nrf_drv_clock.h"
#include "nrf_libuarte_async.h"

static void task1func(void *arg);
static void task2func(void *arg);

NRF_LIBUARTE_ASYNC_DEFINE(libuarte, 1, 0, 0, NRF_LIBUARTE_PERIPHERAL_NOT_USED, 255, 3);

static uint8_t text[] = "UART example started.\r\n Loopback:\r\n";
static uint8_t text_size = sizeof(text);
static volatile bool m_loopback_phase;

typedef struct {
    uint8_t * p_data;
    uint32_t length;
} buffer_t;

NRF_QUEUE_DEF(buffer_t, m_buf_queue, 10, NRF_QUEUE_MODE_NO_OVERFLOW);

void uart_event_handler(void * context, nrf_libuarte_async_evt_t * p_evt)
{
    nrf_libuarte_async_t * p_libuarte = (nrf_libuarte_async_t *)context;
    ret_code_t ret;

    switch (p_evt->type)
    {
        case NRF_LIBUARTE_ASYNC_EVT_ERROR:
            bsp_board_led_invert(0);
            break;
        case NRF_LIBUARTE_ASYNC_EVT_RX_DATA:
            ret = nrf_libuarte_async_tx(p_libuarte,p_evt->data.rxtx.p_data, p_evt->data.rxtx.length);
            if (ret == NRF_ERROR_BUSY)
            {
                buffer_t buf = {
                    .p_data = p_evt->data.rxtx.p_data,
                    .length = p_evt->data.rxtx.length,
                };

                ret = nrf_queue_push(&m_buf_queue, &buf);
                APP_ERROR_CHECK(ret);
            }
            else
            {
                APP_ERROR_CHECK(ret);
            }
            bsp_board_led_invert(1);
            m_loopback_phase = true;
            break;
        case NRF_LIBUARTE_ASYNC_EVT_TX_DONE:
            if (m_loopback_phase)
            {
                nrf_libuarte_async_rx_free(p_libuarte, p_evt->data.rxtx.p_data, p_evt->data.rxtx.length);
                if (!nrf_queue_is_empty(&m_buf_queue))
                {
                    buffer_t buf;
                    ret = nrf_queue_pop(&m_buf_queue, &buf);
                    APP_ERROR_CHECK(ret);
                    UNUSED_RETURN_VALUE(nrf_libuarte_async_tx(p_libuarte, buf.p_data, buf.length));
                }
            }
            bsp_board_led_invert(2);
            break;
        default:
            break;
    }
}

int appmain(int argc, char *argv[]) {
	int r;

	printf("\n\n\n");
	printf("================================================================================\n");
	printf("mylibuarte (build time: %s %s)\n", __TIME__, __DATE__);
	printf("================================================================================\n");
	printf("\n");

	srand(time(NULL));

    bsp_board_init(BSP_INIT_LEDS);

    ret_code_t ret = nrf_drv_clock_init();
    APP_ERROR_CHECK(ret);

    nrf_drv_clock_lfclk_request(NULL);

    nrf_libuarte_async_config_t nrf_libuarte_async_config = {
            .tx_pin     = ARDUINO_1_PIN,
            .rx_pin     = ARDUINO_0_PIN,
            .baudrate   = NRF_UARTE_BAUDRATE_115200,
            .parity     = NRF_UARTE_PARITY_EXCLUDED,
            .hwfc       = NRF_UARTE_HWFC_DISABLED,
            .timeout_us = 100,
            .int_prio   = APP_IRQ_PRIORITY_LOW
    };

    ret_code_t err_code = nrf_libuarte_async_init(&libuarte, &nrf_libuarte_async_config, uart_event_handler, (void *)&libuarte);
    APP_ERROR_CHECK(err_code);

    nrf_libuarte_async_enable(&libuarte);

    err_code = nrf_libuarte_async_tx(&libuarte, text, text_size);
    APP_ERROR_CHECK(err_code);

    do {
		r = task_create(NULL, task1func, NULL, task_getmiddlepriority(), 0, "task1");
		if (0 != r) {
			logmfe("fail at task_create, err=%\n", r);
			break;
		}

		r = task_create(NULL, task2func, NULL, task_getmiddlepriority(), 0, "task2");
		if (0 != r) {
			logmfe("fail at task_create, err=%\n", r);
			break;
		}

		break;
	} while (1);

	ubik_comp_start();

	return 0;
}

static void task1func(void *arg) {
	unsigned int delayms;

	task_sleepms(1000);

	for (unsigned int i = 0;; i++) {
		delayms = (rand() % 10 + 1) * 200;
		printf("1: hello world ! (%u) (delay = %4d ms)\n", i, delayms);
		task_sleepms(delayms);
	}
}

static void task2func(void *arg) {
	unsigned int delayms;

	task_sleepms(1000);

	for (unsigned int i = 0;; i++) {
		delayms = (rand() % 10 + 1) * 200;
		printf("2: hello world ! (%u) (delay = %4d ms)\n", i, delayms);
		task_sleepms(delayms);
	}
}

#endif /* (INCLUDE__APP__mylibuarte == 1) */

