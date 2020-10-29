/*
 * Copyright (c) 2020 Sung Ho Park and CSOS
 *
 * SPDX-License-Identifier: Apache-2.0
 */

#include <ubinos.h>

#if (INCLUDE__UBINOS__BSP == 1)

#if (UBINOS__BSP__USE_DTTY == 1)

#if (UBINOS__BSP__DTTY_TYPE == UBINOS__BSP__DTTY_TYPE__EXTERNAL)

#if (NRF5SDK__DTTY_NRF_LIBUARTE_ENABLE == 1)

#if (INCLUDE__UBINOS__UBIK != 1)
    #error "ubik is necessary"
#endif

#include <ubinos/bsp.h>
#include <ubinos/bsp_ubik.h>

#include <assert.h>

#include <boards.h>
#include <app_error.h>

#include "nrf_libuarte_async.h"

#define SLEEP_TIMEMS	1

extern int _g_bsp_dtty_init;
extern int _g_bsp_dtty_echo;
extern int _g_bsp_dtty_autocr;

NRF_LIBUARTE_ASYNC_DEFINE(_g_dtty_async_libuarte, 0, 0, 0, NRF_LIBUARTE_PERIPHERAL_NOT_USED, 255, 3);

#define DTTY_ASYNC_READ_BUFFER_SIZE 256

typedef struct _dtty_async_buffer_t
{
    uint8_t data[DTTY_ASYNC_READ_BUFFER_SIZE];
    uint16_t head;
    uint16_t tail;
} dtty_async_buffer_t;

dtty_async_buffer_t _g_dtty_async_read_buffer;

sem_pt _g_dtty_async_read_sem = NULL;

static void dtty_async_event_handler(void *context, nrf_libuarte_async_evt_t *p_evt)
{
    int need_signal = 0;

    switch (p_evt->type)
    {
    case NRF_LIBUARTE_ASYNC_EVT_ERROR:
        break;

    case NRF_LIBUARTE_ASYNC_EVT_RX_DATA:
        if (_g_dtty_async_read_buffer.tail == _g_dtty_async_read_buffer.head)
        {
            need_signal = 1;
        }

        for (size_t i = 0; i < p_evt->data.rxtx.length; i++)
        {
            _g_dtty_async_read_buffer.data[_g_dtty_async_read_buffer.tail] = p_evt->data.rxtx.p_data[i];
            _g_dtty_async_read_buffer.tail = (_g_dtty_async_read_buffer.tail + 1) % DTTY_ASYNC_READ_BUFFER_SIZE;
        }

        if (need_signal && _bsp_kernel_active)
        {
            sem_give(_g_dtty_async_read_sem);
        }
        break;

    case NRF_LIBUARTE_ASYNC_EVT_TX_DONE:
        break;

    default:
        break;
    }
}

int dtty_init(void)
{
    int r;
    ret_code_t err_code;

    if (!_g_bsp_dtty_init && !bsp_isintr() && _bsp_kernel_active)
    {
        _g_dtty_async_read_buffer.head = 0;
        _g_dtty_async_read_buffer.tail = 0;

        r = semb_create(&_g_dtty_async_read_sem);
        assert(r == 0);

        nrf_libuarte_async_config_t nrf_libuarte_async_config =
        {
                .tx_pin = TX_PIN_NUMBER,
                .rx_pin = RX_PIN_NUMBER,
                .baudrate = NRF_UARTE_BAUDRATE_115200,
                .parity = NRF_UARTE_PARITY_EXCLUDED,
                .hwfc = NRF_UARTE_HWFC_DISABLED,
                .timeout_us = 100,
                .int_prio = APP_IRQ_PRIORITY_LOW };

        err_code = nrf_libuarte_async_init(&_g_dtty_async_libuarte, &nrf_libuarte_async_config, dtty_async_event_handler, (void*) &_g_dtty_async_libuarte);

        APP_ERROR_CHECK(err_code);

        nrf_libuarte_async_enable(&_g_dtty_async_libuarte);

        _g_bsp_dtty_echo = 1;
        _g_bsp_dtty_autocr = 1;

        _g_bsp_dtty_init = 1;
    }

    return 0;
}

int dtty_enable(void)
{
    return 0;
}

int dtty_disable(void)
{
    return 0;
}

int dtty_geterror(void)
{
    return 0;
}

int dtty_getc(char *ch_p)
{
    if (!_g_bsp_dtty_init)
    {
        dtty_init();
    }

    if (_g_bsp_dtty_init && !bsp_isintr())
    {
        do
        {
            if (_g_dtty_async_read_buffer.head != _g_dtty_async_read_buffer.tail)
            {
                *ch_p = _g_dtty_async_read_buffer.data[_g_dtty_async_read_buffer.head];
                _g_dtty_async_read_buffer.head = (_g_dtty_async_read_buffer.head + 1) % DTTY_ASYNC_READ_BUFFER_SIZE;
                break;
            }
            else
            {
                sem_take(_g_dtty_async_read_sem);
            }
        } while (1);
    }

    if (0 != _g_bsp_dtty_echo) {
        dtty_putc(*ch_p);
    }

    return 0;
}

int dtty_putc(int ch)
{
    ret_code_t ret;
    uint8_t buf[2];
    size_t len;

    if (!_g_bsp_dtty_init)
    {
        dtty_init();
    }

    if (_g_bsp_dtty_init && !bsp_isintr())
    {
        if (0 != _g_bsp_dtty_autocr && '\n' == ch)
        {
            buf[0] = '\r';
            buf[1] = '\n';
            len = 2;
        }
        else
        {
            buf[0] = (uint8_t) ch;
            len = 1;
        }

        do
        {
            ret = nrf_libuarte_async_tx(&_g_dtty_async_libuarte, buf, len);
            if (ret == NRF_ERROR_BUSY)
            {
                continue;
            }

            APP_ERROR_CHECK(ret);

            break;
        } while (1);
    }
    return 0;
}

int dtty_putn(const char *str, int len)
{
    int i = 0;

    if (!_g_bsp_dtty_init)
    {
        dtty_init();
    }

    if (_g_bsp_dtty_init && !bsp_isintr())
    {
        if (NULL == str)
        {
            return -2;
        }

        if (0 > len)
        {
            return -3;
        }

        for (i = 0; i < len; i++)
        {
            dtty_putc(*str);
            str++;
        }
    }
    return i;
}

int dtty_kbhit(void)
{
    int r = 0;

    if (!_g_bsp_dtty_init)
    {
        dtty_init();
    }

    if (_g_bsp_dtty_init && !bsp_isintr())
    {
        if (_g_dtty_async_read_buffer.head != _g_dtty_async_read_buffer.tail)
        {
            r = 1;
        }
        else
        {
            r = 0;
        }
    }

    return r;
}

#endif /* (NRF5SDK__DTTY_NRF_LIBUARTE_ENABLE == 1) */

#endif /* (UBINOS__BSP__DTTY_TYPE == UBINOS__BSP__DTTY_TYPE__EXTERNAL) */

#endif /* (UBINOS__BSP__USE_DTTY == 1) */

#endif /* (INCLUDE__UBINOS__BSP == 1) */

