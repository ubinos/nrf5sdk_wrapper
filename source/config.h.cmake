////////


#cmakedefine01 INCLUDE__NRF5SDK

#if (INCLUDE__NRF5SDK == 1)

#define NRF5SDK__BOARD_NAME "@NRF5SDK__BOARD_NAME@"

#cmakedefine01 NRF5SDK__USE_ALT_TRACE_PIN

#cmakedefine01 NRF5SDK__BSP_DEFINES_ONLY
#cmakedefine01 NRF5SDK__SYSTICK_ENABLED
#cmakedefine01 NRF5SDK__UART_ENABLED
#cmakedefine01 NRF5SDK__RTT_ENABLED
#cmakedefine01 NRF5SDK__CLI_ENABLED
#cmakedefine01 NRF5SDK__FREERTOS
#cmakedefine01 NRF5SDK__CRYPTO_ENABLED
#cmakedefine01 NRF5SDK__CRYPTO_MBEDTLS_ENABLED
#cmakedefine01 NRF5SDK__USBD_ENABLED
#cmakedefine01 NRF5SDK__IOT_ENABLED
#cmakedefine01 NRF5SDK__LWIP_ENABLED
#cmakedefine01 NRF5SDK__LWIP_DEBUG_ENABLED
#cmakedefine01 NRF5SDK__MQTT_ENABLED
#cmakedefine01 NRF5SDK__SPIM_ENABLED
#cmakedefine01 NRF5SDK__SPIS_ENABLED
#cmakedefine01 NRF5SDK__TWI_ENABLED

#cmakedefine01 NRF5SDK__SWI_DISABLE0
#cmakedefine01 NRF5SDK__APP_TIMER_V2
#cmakedefine01 NRF5SDK__APP_TIMER_V2_RTC0_ENABLED
#cmakedefine01 NRF5SDK__APP_TIMER_V2_RTC1_ENABLED
#cmakedefine01 NRF5SDK__APP_TIMER_V2_RTC2_ENABLED
#cmakedefine01 NRF5SDK__DEBUG
#cmakedefine01 NRF5SDK__DEBUG_NRF
#cmakedefine01 NRF5SDK__BLE_STACK_SUPPORT_REQD

#cmakedefine01 NRF5SDK__LWIP_DONT_PROVIDE_BYTEORDER_FUNCTIONS
#cmakedefine01 NRF5SDK__SDK_MUTEX_ENABLE

#cmakedefine01 NRF5SDK__NRF_LIBUARTE_DRV_UARTE0_ENABLED
#cmakedefine01 NRF5SDK__NRF_LIBUARTE_DRV_UARTE1_ENABLED

#cmakedefine01 NRF5SDK__NRF_LOG_BACKEND_UART_ENABLED
#cmakedefine01 NRF5SDK__NRF_LOG_BACKEND_RTT_ENABLED

#cmakedefine01 NRF5SDK__NRFX_UARTE0_ENABLED
#cmakedefine01 NRF5SDK__NRFX_UARTE1_ENABLED

#cmakedefine01 NRF5SDK__NRFX_TIMER0_ENABLED
#cmakedefine01 NRF5SDK__NRFX_TIMER1_ENABLED
#cmakedefine01 NRF5SDK__NRFX_TIMER2_ENABLED

#cmakedefine01 NRF5SDK__NRFX_CLOCK_ENABLED
#cmakedefine01 NRF5SDK__NRFX_POWER_ENABLED

#cmakedefine01 NRF5SDK__ENABLE_BOOTLOADER

#cmakedefine01 NRF5SDK__SVC_INTERFACE_CALL_AS_NORMAL_FUNCTION

#cmakedefine01 NRF5SDK__NRF_DFU_DEBUG_VERSION

#define NRF5SDK__NRF_DFU_SETTINGS_VERSION "@NRF5SDK__NRF_DFU_SETTINGS_VERSION@"

#cmakedefine01 NRF5SDK__DTTY_NRF_LIBUARTE_ENABLE
#cmakedefine01 NRF5SDK__DTTY_NRF_UART_ENABLE
#cmakedefine01 NRF5SDK__DTTY_NRF_BLE_UART_ENABLE

#cmakedefine01 NRF5SDK__IOT_TIMER_ENABLED
#cmakedefine01 NRF5SDK__IOT_SOCKET_ENABLED

#cmakedefine01 NRF5SDK__ENABLE_APP_UART
#define NRF5SDK__APP_UART_DRIVER_INSTANCE "@NRF5SDK__APP_UART_DRIVER_INSTANCE@"

#cmakedefine01 NRF5SDK__ENABLE_APP_FIFO

#endif /* (INCLUDE__NRF5SDK == 1) */


