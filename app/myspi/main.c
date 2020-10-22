/**
 * Copyright (c) 2015 - 2020, Nordic Semiconductor ASA
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

#include <ubinos.h>

#if (INCLUDE__APP__myspi == 1)

#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <stdbool.h>
#include <stdint.h>

#include "nrf_drv_spi.h"
#include "app_util_platform.h"
#include "nrf_gpio.h"
#include "nrf_delay.h"
#include "boards.h"
#include "app_error.h"
#include <string.h>
#include "nrf_log.h"
#include "nrf_log_ctrl.h"
#include "nrf_log_default_backends.h"

#define SPI_INSTANCE  0 /**< SPI instance index. */
static const nrf_drv_spi_t spi = NRF_DRV_SPI_INSTANCE(SPI_INSTANCE); /**< SPI instance. */

#define TEST_STRING "Nordic"
static uint8_t m_tx_buf[] = TEST_STRING; /**< TX buffer. */
static uint8_t m_rx_buf[sizeof(TEST_STRING) + 1]; /**< RX buffer. */
static const uint8_t m_length = sizeof(m_tx_buf); /**< Transfer length. */

static sem_pt spi_xfer_done_sem = NULL;

static void task1func(void *arg);
static void task2func(void *arg);
static void task3func(void *arg);

/**
 * @brief SPI user event handler.
 * @param event
 */
void spi_event_handler(nrf_drv_spi_evt_t const *p_event, void *p_context) {
	NRF_LOG_INFO("Transfer completed.");
	if (m_rx_buf[0] != 0) {
		NRF_LOG_INFO(" Received:");
		NRF_LOG_HEXDUMP_INFO(m_rx_buf, strlen((const char* )m_rx_buf));
	}

	sem_give(spi_xfer_done_sem);
}

int appmain(int argc, char *argv[]) {
	int r;

	printf("\n\n\n");
	printf("================================================================================\n");
	printf("myspi (build time: %s %s)\n", __TIME__, __DATE__);
	printf("================================================================================\n");
	printf("\n");

	bsp_board_init(BSP_INIT_LEDS);

	APP_ERROR_CHECK(NRF_LOG_INIT(NULL));
	NRF_LOG_DEFAULT_BACKENDS_INIT();

	nrf_drv_spi_config_t spi_config = NRF_DRV_SPI_DEFAULT_CONFIG;
	spi_config.ss_pin = SPI_SS_PIN;
	spi_config.miso_pin = SPI_MISO_PIN;
	spi_config.mosi_pin = SPI_MOSI_PIN;
	spi_config.sck_pin = SPI_SCK_PIN;
	APP_ERROR_CHECK(nrf_drv_spi_init(&spi, &spi_config, spi_event_handler, NULL));

	srand(time(NULL));

	do {
		r = sem_create(&spi_xfer_done_sem);
		if (0 != r) {
			logmfe("fail at sem_create, err=%\n", r);
			break;
		}

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

		r = task_create(NULL, task3func, NULL, task_getmiddlepriority(), 0, "task3");
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

static void task3func(void *arg) {
	task_sleepms(1000);

	while (1) {
		// Reset rx buffer and transfer done flag
		memset(m_rx_buf, 0, m_length);

		APP_ERROR_CHECK(nrf_drv_spi_transfer(&spi, m_tx_buf, m_length, m_rx_buf, m_length));

		sem_take(spi_xfer_done_sem);

		NRF_LOG_FLUSH();

		bsp_board_led_invert(BSP_BOARD_LED_0);
		task_sleepms(200);
	}
}

#endif /* (INCLUDE__APP__myspi == 1) */

