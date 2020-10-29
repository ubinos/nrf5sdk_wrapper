/*
 * Copyright (c) 2020 Sung Ho Park and CSOS
 *
 * SPDX-License-Identifier: Apache-2.0
 */

#include <ubinos.h>

#if (INCLUDE__UBINOS__BSP == 1)

#if (UBINOS__BSP__USE_DTTY == 1)

#if (UBINOS__BSP__DTTY_TYPE == UBINOS__BSP__DTTY_TYPE__EXTERNAL)

#if (NRF5SDK__DTTY_NRF_UART_ENABLE == 1)

#if (INCLUDE__UBINOS__UBIK != 1)
    #error "ubik is necessary"
#endif

#include <ubinos/bsp.h>
#include <ubinos/bsp_ubik.h>

#include <assert.h>

#include "bsp.h"
#include "nrf_drv_uart.h"

#define SLEEP_TIMEMS	1

extern int _g_bsp_dtty_init;
extern int _g_bsp_dtty_echo;
extern int _g_bsp_dtty_autocr;

#define DTTY_NRF_UART_READ_BUFFER_SIZE (512)
#define DTTY_NRF_UART_WRITE_BUFFER_SIZE (1024 * 4)

static nrf_drv_uart_t _g_dtty_nrf_uart = NRF_DRV_UART_INSTANCE(0);

cbuf_def_init(_g_dtty_nrf_uart_rbuf, DTTY_NRF_UART_READ_BUFFER_SIZE);
cbuf_def_init(_g_dtty_nrf_uart_wbuf, DTTY_NRF_UART_WRITE_BUFFER_SIZE);

uint8_t _g_dtty_nrf_uart_overflow = 0;

sem_pt _g_dtty_nrf_uart_read_sem = NULL;

static void dtty_nrf_uart_event_handler(nrf_drv_uart_event_t *p_event, void *p_context)
{
    int need_signal = 0;
    uint8_t * buf;
    uint32_t len;

    switch (p_event->type)
    {
    case NRF_DRV_UART_EVT_ERROR:
        break;

    case NRF_DRV_UART_EVT_RX_DONE:
        len = 1;

        if (p_event->data.rxtx.bytes == 0)
        {
            buf = cbuf_get_tail_addr(_g_dtty_nrf_uart_rbuf);
            nrf_drv_uart_rx(&_g_dtty_nrf_uart, buf, len);
            break;
        }

        if (cbuf_is_full(_g_dtty_nrf_uart_rbuf))
        {
            _g_dtty_nrf_uart_overflow = 1;
            break;
        }

        if (cbuf_get_len(_g_dtty_nrf_uart_rbuf) == 0)
        {
            need_signal = 1;
        }

        cbuf_write(_g_dtty_nrf_uart_rbuf, NULL, len, NULL);

        if (need_signal && _bsp_kernel_active)
        {
            sem_give(_g_dtty_nrf_uart_read_sem);
        }

        buf = cbuf_get_tail_addr(_g_dtty_nrf_uart_rbuf);
        nrf_drv_uart_rx(&_g_dtty_nrf_uart, buf, len);
        break;

    case NRF_DRV_UART_EVT_TX_DONE:
        if (p_event->data.rxtx.bytes > 0)
        {
            cbuf_read(_g_dtty_nrf_uart_wbuf, NULL, p_event->data.rxtx.bytes, NULL);
        }

        if (cbuf_get_len(_g_dtty_nrf_uart_wbuf) > 0)
        {
            buf = cbuf_get_head_addr(_g_dtty_nrf_uart_wbuf);
            len = 1;
            nrf_drv_uart_tx(&_g_dtty_nrf_uart, buf, len);
        }
        break;

    default:
        break;
    }
}

int dtty_init(void)
{
    int r;
    ret_code_t nrf_err;
    uint8_t * buf;
    uint32_t len;
    nrf_drv_uart_config_t config;

    if (!_g_bsp_dtty_init && !bsp_isintr() && _bsp_kernel_active)
    {
        r = semb_create(&_g_dtty_nrf_uart_read_sem);
        assert(r == 0);

        _g_bsp_dtty_echo = 1;
        _g_bsp_dtty_autocr = 1;

        config.pseltxd = TX_PIN_NUMBER;
        config.pselrxd = RX_PIN_NUMBER;
        config.pselcts = CTS_PIN_NUMBER;
        config.pselrts = RTS_PIN_NUMBER;
        config.p_context = NULL;
        config.hwfc = NRF_UART_HWFC_DISABLED;
        config.parity = NRF_UART_PARITY_EXCLUDED;
        config.baudrate = NRF_UART_BAUDRATE_115200;
        config.interrupt_priority = NVIC_PRIO_LOWEST;
#if defined(NRF_DRV_UART_WITH_UARTE) && defined(NRF_DRV_UART_WITH_UART)
        config.use_easy_dma = true;
#endif
        nrf_err = nrf_drv_uart_init(&_g_dtty_nrf_uart, &config, dtty_nrf_uart_event_handler);
        assert(nrf_err == NRF_SUCCESS);

        if (!cbuf_is_full(_g_dtty_nrf_uart_rbuf))
        {
            buf = cbuf_get_tail_addr(_g_dtty_nrf_uart_rbuf);
            len = 1;
            nrf_drv_uart_rx(&_g_dtty_nrf_uart, buf, len);
        }

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
    ubi_err_t ubi_err;
    uint8_t * buf;
    uint32_t len;

    if (!_g_bsp_dtty_init)
    {
        dtty_init();
    }

    if (_g_bsp_dtty_init && !bsp_isintr())
    {
        while (1)
        {
            if (cbuf_get_len(_g_dtty_nrf_uart_rbuf) == 0)
            {
                sem_take(_g_dtty_nrf_uart_read_sem);
            }

            ubi_err = cbuf_read(_g_dtty_nrf_uart_rbuf, (uint8_t*) ch_p, 1, NULL);
            if (ubi_err == UBI_ERR_OK)
            {
                if (_g_dtty_nrf_uart_overflow)
                {
                    _g_dtty_nrf_uart_overflow = 0;
                    buf = cbuf_get_tail_addr(_g_dtty_nrf_uart_rbuf);
                    len = 1;
                    nrf_drv_uart_rx(&_g_dtty_nrf_uart, buf, len);
                }
                break;
            }
        }
    }

    if (0 != _g_bsp_dtty_echo)
    {
        dtty_putc(*ch_p);
    }

    return 0;
}

int dtty_putc(int ch)
{
    uint32_t written;
    uint8_t * buf;
    size_t len;
    uint8_t data[2];
    int ret;

    if (!_g_bsp_dtty_init)
    {
        dtty_init();
    }

    ret = 0;
    do
    {
        if (0 != _g_bsp_dtty_autocr && '\n' == ch)
        {
            data[0] = '\r';
            data[1] = '\n';
            len = 2;
        }
        else
        {
            data[0] = (uint8_t) ch;
            len = 1;
        }

        cbuf_write(_g_dtty_nrf_uart_wbuf, data, len, &written);
        if (written == 0)
        {
            break;
        }
        ret = 1;

        if (_g_bsp_dtty_init && !bsp_isintr())
        {
            if (!nrf_drv_uart_tx_in_progress(&_g_dtty_nrf_uart))
            {
                buf = cbuf_get_head_addr(_g_dtty_nrf_uart_wbuf);
                len = 1;
                nrf_drv_uart_tx(&_g_dtty_nrf_uart, buf, len);
            }
        }
    } while (0);

    return ret;
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
        if (cbuf_get_len(_g_dtty_nrf_uart_rbuf) != 0)
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

#endif /* (NRF5SDK__DTTY_NRF_UART_ENABLE == 1) */

#endif /* (UBINOS__BSP__DTTY_TYPE == UBINOS__BSP__DTTY_TYPE__EXTERNAL) */

#endif /* (UBINOS__BSP__USE_DTTY == 1) */

#endif /* (INCLUDE__UBINOS__BSP == 1) */

