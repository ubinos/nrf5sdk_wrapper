#include <ubinos.h>

#if (INCLUDE__APP__mycli == 1)

#include <time.h>
#include <stdio.h>
#include <stdbool.h>
#include <stddef.h>

#include <ubinos.h>

#include "nrf.h"
#include "nrf_drv_clock.h"
#include "nrf_gpio.h"
#include "nrf_delay.h"

#include "app_timer.h"
#include "fds.h"
#include "app_error.h"
#include "app_util.h"

#include "nrf_cli.h"
#include "nrf_cli_types.h"

#include "boards.h"

#include "nrf_log.h"
#include "nrf_log_ctrl.h"
#include "nrf_log_default_backends.h"
#include "nrf_log_backend_flash.h"
#include "nrf_fstorage_nvmc.h"

#include "nrf_mpu_lib.h"
#include "nrf_stack_guard.h"

#if defined(APP_USBD_ENABLED) && APP_USBD_ENABLED
#define CLI_OVER_USB_CDC_ACM 1
#define CLI_OVER_DTTY 0
#define CLI_OVER_UART 0
#define CLI_OVER_RTT 0
#else
#define CLI_OVER_USB_CDC_ACM 0
#endif

#if CLI_OVER_USB_CDC_ACM
#include "nrf_cli_cdc_acm.h"
#include "nrf_drv_usbd.h"
#include "app_usbd_core.h"
#include "app_usbd.h"
#include "app_usbd_string_desc.h"
#include "app_usbd_cdc_acm.h"
#endif //CLI_OVER_USB_CDC_ACM

#if (CLI_OVER_USB_CDC_ACM == 0)
#if (NRF_CLI_DTTY_ENABLED == 1)
	#define CLI_OVER_DTTY 1
	#define CLI_OVER_UART 0
	#define CLI_OVER_RTT  0
#elif (NRF_CLI_UART_ENABLED == 1)
	#define CLI_OVER_DTTY 0
	#define CLI_OVER_UART 1
	#define CLI_OVER_RTT  0
#else
	#define CLI_OVER_DTTY 0
	#define CLI_OVER_UART 0
	#define CLI_OVER_RTT  1
#endif
#endif

#if CLI_OVER_UART
#include "nrf_cli_uart.h"
#endif

#if CLI_OVER_DTTY
#include "nrf_cli_dtty.h"
#endif

#if CLI_OVER_RTT
#include "nrf_cli_rtt.h"
#endif

static void task1func(void *arg);
static void task2func(void *arg);

/* If enabled then CYCCNT (high resolution) timestamp is used for the logger. */
#define USE_CYCCNT_TIMESTAMP_FOR_LOG 0

/**@file
 * @defgroup CLI_example main.c
 *
 * @{
 *
 */

#if NRF_LOG_BACKEND_FLASHLOG_ENABLED
NRF_LOG_BACKEND_FLASHLOG_DEF(m_flash_log_backend);
#endif

#if NRF_LOG_BACKEND_CRASHLOG_ENABLED
NRF_LOG_BACKEND_CRASHLOG_DEF(m_crash_log_backend);
#endif

/* Counter timer. */
APP_TIMER_DEF(m_timer_0);

/* Declared in demo_cli.c */
extern uint32_t m_counter;
extern bool m_counter_active;

#if CLI_OVER_USB_CDC_ACM

/**
 * @brief Enable power USB detection
 *
 * Configure if example supports USB port connection
 */
#ifndef USBD_POWER_DETECTION
#define USBD_POWER_DETECTION true
#endif


static void usbd_user_ev_handler(app_usbd_event_type_t event)
{
    switch (event)
    {
        case APP_USBD_EVT_STOPPED:
            app_usbd_disable();
            break;
        case APP_USBD_EVT_POWER_DETECTED:
            if (!nrf_drv_usbd_is_enabled())
            {
                app_usbd_enable();
            }
            break;
        case APP_USBD_EVT_POWER_REMOVED:
            app_usbd_stop();
            break;
        case APP_USBD_EVT_POWER_READY:
            app_usbd_start();
            break;
        default:
            break;
    }
}

#endif //CLI_OVER_USB_CDC_ACM

/**
 * @brief Command line interface instance
 * */
#define CLI_EXAMPLE_LOG_QUEUE_SIZE  (4)

#if CLI_OVER_USB_CDC_ACM
NRF_CLI_CDC_ACM_DEF(m_cli_cdc_acm_transport);
NRF_CLI_DEF(m_cli_cdc_acm,
            "usb_mycli:~$ ",
            &m_cli_cdc_acm_transport.transport,
            '\r',
            CLI_EXAMPLE_LOG_QUEUE_SIZE);
#endif //CLI_OVER_USB_CDC_ACM

#if CLI_OVER_UART
NRF_CLI_UART_DEF(m_cli_uart_transport, 0, 64, 16);
NRF_CLI_DEF(m_cli_uart,
            "uart_mycli:~$ ",
            &m_cli_uart_transport.transport,
            '\r',
            CLI_EXAMPLE_LOG_QUEUE_SIZE);
#endif

#if CLI_OVER_DTTY
NRF_CLI_DTTY_DEF(m_cli_dtty_transport);
NRF_CLI_DEF(m_cli_dtty,
            "dtty_mycli:~$ ",
            &m_cli_dtty_transport.transport,
            '\n',
            CLI_EXAMPLE_LOG_QUEUE_SIZE);
#endif

#if CLI_OVER_RTT
NRF_CLI_RTT_DEF(m_cli_rtt_transport);
NRF_CLI_DEF(m_cli_rtt,
            "rtt_mycli:~$ ",
            &m_cli_rtt_transport.transport,
            '\n',
            CLI_EXAMPLE_LOG_QUEUE_SIZE);
#endif

static void timer_handle(void * p_context)
{
    UNUSED_PARAMETER(p_context);

    if (m_counter_active)
    {
        m_counter++;
        NRF_LOG_RAW_INFO("counter = %d\n", m_counter);
    }
}

static void cli_start(void)
{
    ret_code_t ret;

#if CLI_OVER_USB_CDC_ACM
    ret = nrf_cli_start(&m_cli_cdc_acm);
    APP_ERROR_CHECK(ret);
#endif

#if CLI_OVER_UART
    ret = nrf_cli_start(&m_cli_uart);
    APP_ERROR_CHECK(ret);
#endif

#if CLI_OVER_DTTY
    ret = nrf_cli_start(&m_cli_dtty);
    APP_ERROR_CHECK(ret);
#endif

#if CLI_OVER_RTT
    ret = nrf_cli_start(&m_cli_rtt);
    APP_ERROR_CHECK(ret);
#endif
}

static void cli_init(void)
{
    ret_code_t ret;

#if CLI_OVER_USB_CDC_ACM
    ret = nrf_cli_init(&m_cli_cdc_acm, NULL, true, true, NRF_LOG_SEVERITY_INFO);
    APP_ERROR_CHECK(ret);
#endif

#if CLI_OVER_UART
    nrf_drv_uart_config_t uart_config = NRF_DRV_UART_DEFAULT_CONFIG;
    uart_config.pseltxd = TX_PIN_NUMBER;
    uart_config.pselrxd = RX_PIN_NUMBER;
    uart_config.hwfc    = NRF_UART_HWFC_DISABLED;
    ret = nrf_cli_init(&m_cli_uart, &uart_config, true, true, NRF_LOG_SEVERITY_INFO);
    APP_ERROR_CHECK(ret);
#endif

#if CLI_OVER_DTTY
    ret = nrf_cli_init(&m_cli_dtty, NULL, true, true, NRF_LOG_SEVERITY_INFO);
    APP_ERROR_CHECK(ret);
#endif

#if CLI_OVER_RTT
    ret = nrf_cli_init(&m_cli_rtt, NULL, true, true, NRF_LOG_SEVERITY_INFO);
    APP_ERROR_CHECK(ret);
#endif
}


static void usbd_init(void)
{
#if CLI_OVER_USB_CDC_ACM
    ret_code_t ret;
    static const app_usbd_config_t usbd_config = {
        .ev_handler = app_usbd_event_execute,
        .ev_state_proc = usbd_user_ev_handler
    };
    ret = app_usbd_init(&usbd_config);
    APP_ERROR_CHECK(ret);

    app_usbd_class_inst_t const * class_cdc_acm =
            app_usbd_cdc_acm_class_inst_get(&nrf_cli_cdc_acm);
    ret = app_usbd_class_append(class_cdc_acm);
    APP_ERROR_CHECK(ret);

    if (USBD_POWER_DETECTION)
    {
        ret = app_usbd_power_events_enable();
        APP_ERROR_CHECK(ret);
    }
    else
    {
        NRF_LOG_INFO("No USB power detection enabled\nStarting USB now");

        app_usbd_enable();
        app_usbd_start();
    }

    /* Give some time for the host to enumerate and connect to the USB CDC port */
    nrf_delay_ms(1000);
#endif
}


static void cli_process(void)
{
#if CLI_OVER_USB_CDC_ACM
    nrf_cli_process(&m_cli_cdc_acm);
#endif

#if CLI_OVER_UART
    nrf_cli_process(&m_cli_uart);
#endif

#if CLI_OVER_DTTY
    nrf_cli_process(&m_cli_dtty);
#endif

#if CLI_OVER_RTT
    nrf_cli_process(&m_cli_rtt);
#endif
}


static void flashlog_init(void)
{
    ret_code_t ret;
    int32_t backend_id;

    ret = nrf_log_backend_flash_init(&nrf_fstorage_nvmc);
    APP_ERROR_CHECK(ret);
#if NRF_LOG_BACKEND_FLASHLOG_ENABLED
    backend_id = nrf_log_backend_add(&m_flash_log_backend, NRF_LOG_SEVERITY_WARNING);
    APP_ERROR_CHECK_BOOL(backend_id >= 0);

    nrf_log_backend_enable(&m_flash_log_backend);
#endif

#if NRF_LOG_BACKEND_CRASHLOG_ENABLED
    backend_id = nrf_log_backend_add(&m_crash_log_backend, NRF_LOG_SEVERITY_INFO);
    APP_ERROR_CHECK_BOOL(backend_id >= 0);

    nrf_log_backend_enable(&m_crash_log_backend);
#endif
}

static inline void stack_guard_init(void)
{
    APP_ERROR_CHECK(nrf_mpu_lib_init());
    APP_ERROR_CHECK(nrf_stack_guard_init());
}

uint32_t cyccnt_get(void)
{
    return DWT->CYCCNT;
}


static void taskfunc(void *arg);

int appmain(int argc, char *argv[]) {
	int r;

    ret_code_t ret;

    if (USE_CYCCNT_TIMESTAMP_FOR_LOG)
    {
        CoreDebug->DEMCR |= CoreDebug_DEMCR_TRCENA_Msk;
        DWT->CTRL |= DWT_CTRL_CYCCNTENA_Msk;
        DWT->CYCCNT = 0;
        APP_ERROR_CHECK(NRF_LOG_INIT(cyccnt_get, 64000000));
    }
    else
    {
        APP_ERROR_CHECK(NRF_LOG_INIT(app_timer_cnt_get));
    }

#if (UBINOS__UBIK__TICK_TYPE == UBINOS__UBIK__TICK_TYPE__RTC)
#else
    ret = nrf_drv_clock_init();
    APP_ERROR_CHECK(ret);
    nrf_drv_clock_lfclk_request(NULL);
#endif /* (UBINOS__UBIK__TICK_TYPE == UBINOS__UBIK__TICK_TYPE__RTC) */

    ret = app_timer_init();
    APP_ERROR_CHECK(ret);

    ret = app_timer_create(&m_timer_0, APP_TIMER_MODE_REPEATED, timer_handle);
    APP_ERROR_CHECK(ret);

    ret = app_timer_start(m_timer_0, APP_TIMER_TICKS(1000), NULL);
    APP_ERROR_CHECK(ret);

    cli_init();

    usbd_init();

    ret = fds_init();
    APP_ERROR_CHECK(ret);

	srand(time(NULL));

	r = task_create(NULL, taskfunc, NULL, task_getmiddlepriority(), 0, "task0");
	if (0 != r) {
		logme("fail at task_create\r\n");
	}

	ubik_comp_start();

	return 0;
}

static void taskfunc(void *arg) {
	int r;

    UNUSED_RETURN_VALUE(nrf_log_config_load());

    cli_start();

    flashlog_init();

    stack_guard_init();

    NRF_LOG_RAW_INFO("My Command Line Interface 2 example started.\n");
    NRF_LOG_RAW_INFO("Please press the Tab key to see all available commands.\n");

	r = task_create(NULL, task1func, NULL, task_getmiddlepriority(), 0, "task1");
	if (0 != r) {
		logme("fail at task_create\r\n");
	}

	r = task_create(NULL, task2func, NULL, task_getmiddlepriority(), 0, "task2");
	if (0 != r) {
		logme("fail at task_create\r\n");
	}

    while (true)
    {
        UNUSED_RETURN_VALUE(NRF_LOG_PROCESS());
#if CLI_OVER_USB_CDC_ACM && APP_USBD_CONFIG_EVENT_QUEUE_ENABLE
        while (app_usbd_event_queue_process())
        {
            /* Nothing to do */
        }
#endif
        cli_process();
    }

}

static void task1func(void *arg) {
	unsigned int delayms;

	task_sleepms(1000);

	for (unsigned int i = 0;; i++) {
		delayms = (rand() % 10 + 1) * 500;
		printf("1: hello world ! (%u) (delay = %4d ms)\r\n", i, delayms);
		task_sleepms(delayms);
	}
}

static void task2func(void *arg) {
	unsigned int delayms;

	task_sleepms(1000);

	for (unsigned int i = 0;; i++) {
		delayms = (rand() % 10 + 1) * 500;
		printf("2: hello world ! (%u) (delay = %4d ms)\r\n", i, delayms);
		task_sleepms(delayms);
	}
}

/** @} */

#endif /* (INCLUDE__APP__mycli == 1) */



