#
# Copyright (c) 2019 Sung Ho Park and CSOS
#
# SPDX-License-Identifier: Apache-2.0
#

set(INCLUDE__NRF5SDK TRUE)

set_cache_default(NRF5SDK__BASE_DIR "${PROJECT_LIBRARY_DIR}/nrf5sdk_v17.00.00" STRING "nrf5sdk project base dir")

if(UBINOS__BSP__BOARD_MODEL STREQUAL "NRF52DK")
    set_cache(NRF5SDK__BOARD_NAME "PCA10040" STRING)
elseif((UBINOS__BSP__BOARD_MODEL STREQUAL "NRF52840DK") OR (UBINOS__BSP__BOARD_MODEL STREQUAL "ARDUINONANO33BLE"))
    set_cache(NRF5SDK__BOARD_NAME "PCA10056" STRING)
elseif(UBINOS__BSP__BOARD_MODEL STREQUAL "NRF52840DONGLE")
    set_cache(NRF5SDK__BOARD_NAME "PCA10059" STRING)
else()
    message(FATAL_ERROR "Unsupported UBINOS__BSP__BOARD_MODEL")
endif(UBINOS__BSP__BOARD_MODEL STREQUAL "NRF52DK")

set_cache_default(NRF5SDK__BOARD_NAME "" STRING "[PCA10040 | PCA10056]")

set_cache_default(NRF5SDK__APP_UART_ENABLED FALSE BOOL "")
set_cache_default(NRF5SDK__APP_UART_DRIVER_INSTANCE "0" STRING "[0 | 1]")
set_cache_default(NRF5SDK__APP_FIFO_ENABLED FALSE BOOL "")

set_cache_default(NRF5SDK__USE_ALT_TRACE_PIN FALSE BOOL "")

set_cache_default(NRF5SDK__BSP_DEFINES_ONLY FALSE BOOL "")
set_cache_default(NRF5SDK__SYSTICK_ENABLED FALSE BOOL "")
set_cache_default(NRF5SDK__UART_ENABLED FALSE BOOL "")
set_cache_default(NRF5SDK__RTT_ENABLED FALSE BOOL "")
set_cache_default(NRF5SDK__CLI_ENABLED FALSE BOOL "")
set_cache_default(NRF5SDK__FREERTOS FALSE BOOL "Include freertos component")
set_cache_default(NRF5SDK__CRYPTO_ENABLED FALSE BOOL "")
set_cache_default(NRF5SDK__CRYPTO_MBEDTLS_ENABLED FALSE BOOL "")
set_cache_default(NRF5SDK__USBD_ENABLED FALSE BOOL "")
set_cache_default(NRF5SDK__IOT_ENABLED FALSE BOOL "")
set_cache_default(NRF5SDK__LWIP_ENABLED FALSE BOOL "")
set_cache_default(NRF5SDK__LWIP_DEBUG_ENABLED FALSE BOOL "")
set_cache_default(NRF5SDK__MQTT_ENABLED FALSE BOOL "")
set_cache_default(NRF5SDK__SPIM_ENABLED FALSE BOOL "Enable SPI Master")
set_cache_default(NRF5SDK__SPIS_ENABLED FALSE BOOL "Enable SPI Slave")
set_cache_default(NRF5SDK__TWI_ENABLED FALSE BOOL "Enable TWI")

set_cache_default(NRF5SDK__SWI_DISABLE0 FALSE BOOL "Exclude SWI0 from being utilized by the driver")
set_cache_default(NRF5SDK__APP_TIMER_V2 FALSE BOOL "")
set_cache_default(NRF5SDK__APP_TIMER_V2_RTC0_ENABLED FALSE BOOL "")
set_cache_default(NRF5SDK__APP_TIMER_V2_RTC1_ENABLED FALSE BOOL "")
set_cache_default(NRF5SDK__APP_TIMER_V2_RTC2_ENABLED FALSE BOOL "")
set_cache_default(NRF5SDK__DEBUG FALSE BOOL "")
set_cache_default(NRF5SDK__DEBUG_NRF FALSE BOOL "")
set_cache_default(NRF5SDK__BLE_STACK_SUPPORT_REQD FALSE BOOL "")

set_cache_default(NRF5SDK__LWIP_DONT_PROVIDE_BYTEORDER_FUNCTIONS FALSE BOOL "")
set_cache_default(NRF5SDK__SDK_MUTEX_ENABLE FALSE BOOL "")

set_cache_default(NRF5SDK__NRF_LOG_BACKEND_UART_ENABLED FALSE BOOL "")
set_cache_default(NRF5SDK__NRF_LOG_BACKEND_RTT_ENABLED FALSE BOOL "")

set_cache_default(NRF5SDK__NRF_LIBUARTE_DRV_UARTE0_ENABLED FALSE BOOL "")
set_cache_default(NRF5SDK__NRF_LIBUARTE_DRV_UARTE1_ENABLED FALSE BOOL "")

set_cache_default(NRF5SDK__NRFX_UARTE0_ENABLED FALSE BOOL "")
set_cache_default(NRF5SDK__NRFX_UARTE1_ENABLED FALSE BOOL "")

set_cache_default(NRF5SDK__NRFX_TIMER0_ENABLED FALSE BOOL "")
set_cache_default(NRF5SDK__NRFX_TIMER1_ENABLED FALSE BOOL "")
set_cache_default(NRF5SDK__NRFX_TIMER2_ENABLED FALSE BOOL "")

set_cache_default(NRF5SDK__NRFX_CLOCK_ENABLED TRUE BOOL "")
set_cache_default(NRF5SDK__NRFX_POWER_ENABLED TRUE BOOL "")

set_cache_default(NRF5SDK__ENABLE_BOOTLOADER FALSE BOOL "")

set_cache_default(NRF5SDK__SVC_INTERFACE_CALL_AS_NORMAL_FUNCTION FALSE BOOL "")

set_cache_default(NRF5SDK__NRF_DFU_DEBUG_VERSION FALSE BOOL "")
set_cache_default(NRF5SDK__NRF_DFU_SETTINGS_VERSION 2 STRING "")

set_cache_default(NRF5SDK__DTTY_NRF_LIBUARTE_ENABLE FALSE BOOL "")
set_cache_default(NRF5SDK__DTTY_NRF_UART_ENABLE FALSE BOOL "")
set_cache_default(NRF5SDK__DTTY_NRF_BLE_UART_ENABLE FALSE BOOL "")

set_cache_default(NRF5SDK__BLE_STACK_SUPPORT_REQD FALSE BOOL "")

if(NRF5SDK__IOT_ENABLED)

    set_cache_default(NRF5SDK__BLE_IPSP_RX_BUFFER_COUNT 2 STRING "")

    set_cache_default(NRF5SDK__IOT_TIMER_ENABLED TRUE BOOL "")
    set_cache_default(NRF5SDK__IOT_SOCKET_ENABLED FALSE BOOL "")

endif(NRF5SDK__IOT_ENABLED)

####

if(NOT NRF5SDK__BOARD_NAME STREQUAL "")
    add_definitions("-DBOARD_${NRF5SDK__BOARD_NAME}")
else()
    message(FATAL_ERROR "Unsupported NRF5SDK__BOARD_NAME")
endif(NOT NRF5SDK__BOARD_NAME STREQUAL "")

if(UBINOS__BSP__USE_DTTY)

    add_definitions("-DNRF_LOG_BACKEND_DTTY_ENABLED=1")
    add_definitions("-DNRF_LOG_BACKEND_DTTY_TEMP_BUFFER_SIZE=64")

    if(NRF5SDK__CLI_ENABLED)
        add_definitions("-DNRF_CLI_DTTY_ENABLED=1")
        add_definitions("-DNRF_CLI_CMD_BUFF_SIZE=384")
        add_definitions("-DNRF_CLI_PRINTF_BUFF_SIZE=23")
        add_definitions("-DAPP_TIMER_CONFIG_RTC_FREQUENCY=0")
    else()
        add_definitions("-DNRF_CLI_DTTY_ENABLED=0")
    endif(NRF5SDK__CLI_ENABLED)

    if(NRF5SDK__RTT_ENABLED)
        message(FATAL_ERROR "If UBINOS__BSP__USE_DTTY is TRUE, then NRF5SDK__RTT_ENABLED must be FALSE")
    endif(NRF5SDK__RTT_ENABLED)

else()

    add_definitions("-DNRF_LOG_BACKEND_DTTY_ENABLED=0")

    add_definitions("-DNRF_CLI_DTTY_ENABLED=0")

endif(UBINOS__BSP__USE_DTTY)

if(NRF5SDK__USE_ALT_TRACE_PIN)
    add_definitions("-DUSE_ALT_TRACE_PIN")
endif(NRF5SDK__USE_ALT_TRACE_PIN)

if(NRF5SDK__BSP_DEFINES_ONLY)
    add_definitions("-DBSP_DEFINES_ONLY")
endif(NRF5SDK__BSP_DEFINES_ONLY)

if(NRF5SDK__SYSTICK_ENABLED)
    add_definitions("-DSYSTICK_ENABLED=1")
else()
    add_definitions("-DSYSTICK_ENABLED=0")
endif(NRF5SDK__SYSTICK_ENABLED)

if(NRF5SDK__UART_ENABLED)
    add_definitions("-DUART_ENABLED=1")

    if(NRF5SDK__NRFX_UARTE0_ENABLED)
        add_definitions("-DNRFX_UARTE0_ENABLED=1")
    else()
        add_definitions("-DNRFX_UARTE0_ENABLED=0")
    endif(NRF5SDK__NRFX_UARTE0_ENABLED)
    if(NRF5SDK__NRFX_UARTE1_ENABLED)
        add_definitions("-DNRFX_UARTE1_ENABLED=1")
    else()
        add_definitions("-DNRFX_UARTE1_ENABLED=0")
    endif(NRF5SDK__NRFX_UARTE1_ENABLED)

    if(NRF5SDK__NRF_LOG_BACKEND_UART_ENABLED)
        add_definitions("-DNRF_LOG_BACKEND_UART_ENABLED=1")
    else()
        add_definitions("-DNRF_LOG_BACKEND_UART_ENABLED=0")
    endif(NRF5SDK__NRF_LOG_BACKEND_UART_ENABLED)

    if(NRF5SDK__CLI_ENABLED)
        add_definitions("-DNRF_CLI_UART_ENABLED=1")
        add_definitions("-DNRF_CLI_CMD_BUFF_SIZE=384")
        add_definitions("-DNRF_CLI_PRINTF_BUFF_SIZE=23")
        add_definitions("-DAPP_TIMER_CONFIG_RTC_FREQUENCY=0")
    else()
        add_definitions("-DNRF_CLI_UART_ENABLED=0")
    endif(NRF5SDK__CLI_ENABLED)

else()
    add_definitions("-DUART_ENABLED=0")

    add_definitions("-DNRFX_UARTE0_ENABLED=0")
    add_definitions("-DNRFX_UARTE1_ENABLED=0")

    add_definitions("-DNRF_LOG_BACKEND_UART_ENABLED=0")

    add_definitions("-DNRF_CLI_UART_ENABLED=0")
endif(NRF5SDK__UART_ENABLED)

if(NRF5SDK__RTT_ENABLED)
    if(NRF5SDK__NRF_LOG_BACKEND_RTT_ENABLED)
        add_definitions("-DNRF_LOG_BACKEND_RTT_ENABLED=1")
    else()
        add_definitions("-DNRF_LOG_BACKEND_RTT_ENABLED=0")
    endif(NRF5SDK__NRF_LOG_BACKEND_RTT_ENABLED)

    if(NRF5SDK__CLI_ENABLED)
        add_definitions("-DNRF_CLI_RTT_ENABLED=1")
        add_definitions("-DNRF_CLI_CMD_BUFF_SIZE=384")
        add_definitions("-DNRF_CLI_PRINTF_BUFF_SIZE=23")
        add_definitions("-DAPP_TIMER_CONFIG_RTC_FREQUENCY=0")
    else()
        add_definitions("-DNRF_CLI_RTT_ENABLED=0")
    endif(NRF5SDK__CLI_ENABLED)

else()
    add_definitions("-DNRF_LOG_BACKEND_RTT_ENABLED=0")

    add_definitions("-DNRF_CLI_RTT_ENABLED=0")
endif(NRF5SDK__RTT_ENABLED)

if(NRF5SDK__NRF_LOG_BACKEND_UART_ENABLED OR NRF5SDK__NRF_LOG_BACKEND_RTT_ENABLED)
    add_definitions("-DRETARGET_ENABLED=1")
else()
    add_definitions("-DRETARGET_ENABLED=0")
endif(NRF5SDK__NRF_LOG_BACKEND_UART_ENABLED OR NRF5SDK__NRF_LOG_BACKEND_RTT_ENABLED)

if(NRF5SDK__USBD_ENABLED)
    add_definitions("-DUSBD_ENABLED=1")
    add_definitions("-DAPP_USBD_ENABLED=1")
else()
    add_definitions("-DUSBD_ENABLED=0")
    add_definitions("-DAPP_USBD_ENABLED=0")
endif(NRF5SDK__USBD_ENABLED)

if(NRF5SDK__NRF_LIBUARTE_DRV_UARTE0_ENABLED)
    add_definitions("-DNRF_LIBUARTE_DRV_UARTE0_ENABLED=1")
    add_definitions("-DNRF_LIBUARTE_DRV_UARTE0=1")
else()
    add_definitions("-DNRF_LIBUARTE_DRV_UARTE0_ENABLED=0")
    add_definitions("-DNRF_LIBUARTE_DRV_UARTE0=0")
endif(NRF5SDK__NRF_LIBUARTE_DRV_UARTE0_ENABLED)

if(NRF5SDK__NRF_LIBUARTE_DRV_UARTE1_ENABLED)
    add_definitions("-DNRF_LIBUARTE_DRV_UARTE1_ENABLED=1")
    add_definitions("-DNRF_LIBUARTE_DRV_UARTE1=1")
else()
    add_definitions("-DNRF_LIBUARTE_DRV_UARTE1_ENABLED=0")
    add_definitions("-DNRF_LIBUARTE_DRV_UARTE1=0")
endif(NRF5SDK__NRF_LIBUARTE_DRV_UARTE1_ENABLED)

if(NRF5SDK__NRFX_CLOCK_ENABLED)
    add_definitions("-DNRFX_CLOCK_ENABLED=1")
else()
    add_definitions("-DNRFX_CLOCK_ENABLED=0")
endif(NRF5SDK__NRFX_CLOCK_ENABLED)

if(NRF5SDK__NRFX_POWER_ENABLED)
    add_definitions("-DNRFX_POWER_ENABLED=1")
else()
    add_definitions("-DNRFX_POWER_ENABLED=0")
endif(NRF5SDK__NRFX_POWER_ENABLED)

if(NRF5SDK__SVC_INTERFACE_CALL_AS_NORMAL_FUNCTION)
    add_definitions("-DSVC_INTERFACE_CALL_AS_NORMAL_FUNCTION")
endif(NRF5SDK__SVC_INTERFACE_CALL_AS_NORMAL_FUNCTION)

if(NRF5SDK__NRF_DFU_DEBUG_VERSION)
    add_definitions("-DNRF_DFU_DEBUG_VERSION")
    add_definitions("-DNRF_DFU_SETTINGS_VERSION=${NRF5SDK__NRF_DFU_SETTINGS_VERSION}")
endif(NRF5SDK__NRF_DFU_DEBUG_VERSION)

if(NRF5SDK__IOT_ENABLED)
    add_definitions("-DBLE_IPSP_RX_BUFFER_COUNT=${NRF5SDK__BLE_IPSP_RX_BUFFER_COUNT}")
endif(NRF5SDK__IOT_ENABLED)

if(NRF5SDK__LWIP_ENABLED AND NRF5SDK__LWIP_DEBUG_ENABLED)
    add_definitions("-DLWIP_DEBUG_ENABLED=1")
endif(NRF5SDK__LWIP_ENABLED AND NRF5SDK__LWIP_DEBUG_ENABLED)

if(NRF5SDK__CRYPTO_ENABLED)

    if(NRF5SDK__CRYPTO_MBEDTLS_ENABLED)

		set_cache_default(NRF5SDK__MBEDTLS_CONFIG_DIR "${NRF5SDK__BASE_DIR}/external/nrf_tls/mbedtls/tls/config" STRING "")
		set_cache_default(NRF5SDK__MBEDTLS_CONFIG_FILE "\\\"nrf_tls_config.h\\\"" STRING "")

		set_cache_default(NRF5SDK__NRF_TLS_MAX_INSTANCE_COUNT 1 STRING "")

        add_definitions("-DNRF_TLS_MAX_INSTANCE_COUNT=${NRF5SDK__NRF_TLS_MAX_INSTANCE_COUNT}")

    else()

		set_cache_default(NRF5SDK__MBEDTLS_CONFIG_DIR "${NRF5SDK__BASE_DIR}/external/nrf_tls/mbedtls/nrf_crypto/config" STRING "")
		set_cache_default(NRF5SDK__MBEDTLS_CONFIG_FILE "\\\"nrf_crypto_mbedtls_config.h\\\"" STRING "")

		set_cache_default(NRF5SDK__NRF_CRYPTO_MAX_INSTANCE_COUNT 1 STRING "")

        if(NRF5SDK__ENABLE_BOOTLOADER)
            set_cache_default(NRF5SDK__LIB_FILE_CC310 "${NRF5SDK__BASE_DIR}/external/nrf_cc310_bl/lib/cortex-m4/hard-float/libnrf_cc310_bl_0.9.13.a" STRING "")
            set_cache_default(NRF5SDK__LIB_INCLUDE_CC310 "${NRF5SDK__BASE_DIR}/external/nrf_cc310_bl/include" STRING "")
        else()
            set_cache_default(NRF5SDK__LIB_FILE_CC310 "${NRF5SDK__BASE_DIR}/external/nrf_cc310/lib/cortex-m4/hard-float/libnrf_cc310_0.9.13.a" STRING "")
            set_cache_default(NRF5SDK__LIB_INCLUDE_CC310 "${NRF5SDK__BASE_DIR}/external/nrf_cc310/include" STRING "")
        endif(NRF5SDK__ENABLE_BOOTLOADER)

		set_cache_default(NRF5SDK__LIB_FILE_OBERON "${NRF5SDK__BASE_DIR}/external/nrf_oberon/lib/cortex-m4/hard-float/liboberon_3.0.5.a" STRING "")

        add_definitions("-DNRF_CRYPTO_MAX_INSTANCE_COUNT=${NRF5SDK__NRF_CRYPTO_MAX_INSTANCE_COUNT}")

        set(PROJECT_LIBRARIES ${PROJECT_LIBRARIES} ${NRF5SDK__LIB_FILE_CC310})
        set(PROJECT_LIBRARIES ${PROJECT_LIBRARIES} ${NRF5SDK__LIB_FILE_OBERON})

        set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -u cc310_backend")
        set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -u cc310_bl_backend")

    endif(NRF5SDK__CRYPTO_MBEDTLS_ENABLED)

    add_definitions("-DNRF_CRYPTO_ENABLED=1")
    add_definitions("-DMBEDTLS_CONFIG_FILE=${NRF5SDK__MBEDTLS_CONFIG_FILE}")

    set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -u nrf_hw_backend")
    set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -u optiga_backend")
    set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -u mbedtls_backend")

else()

    add_definitions("-DNRF_CRYPTO_ENABLED=0")

endif(NRF5SDK__CRYPTO_ENABLED)

if(NRF5SDK__FREERTOS)
    add_definitions("-DFREERTOS")
endif(NRF5SDK__FREERTOS)

if(NRF5SDK__SWI_DISABLE0)
    add_definitions("-DSWI_DISABLE0")
endif(NRF5SDK__SWI_DISABLE0)

if(NRF5SDK__APP_TIMER_V2)
    add_definitions("-DAPP_TIMER_V2")
endif(NRF5SDK__APP_TIMER_V2)

if(NRF5SDK__APP_TIMER_V2_RTC0_ENABLED)
    add_definitions("-DAPP_TIMER_V2_RTC0_ENABLED")
endif(NRF5SDK__APP_TIMER_V2_RTC0_ENABLED)
if(NRF5SDK__APP_TIMER_V2_RTC1_ENABLED)
    add_definitions("-DAPP_TIMER_V2_RTC1_ENABLED")
endif(NRF5SDK__APP_TIMER_V2_RTC1_ENABLED)
if(NRF5SDK__APP_TIMER_V2_RTC2_ENABLED)
    add_definitions("-DAPP_TIMER_V2_RTC2_ENABLED")
endif(NRF5SDK__APP_TIMER_V2_RTC2_ENABLED)

if(NRF5SDK__NRFX_TIMER0_ENABLED)
    add_definitions("-DNRFX_TIMER0_ENABLED")
endif(NRF5SDK__NRFX_TIMER0_ENABLED)
if(NRF5SDK__NRFX_TIMER1_ENABLED)
    add_definitions("-DNRFX_TIMER1_ENABLED")
endif(NRF5SDK__NRFX_TIMER1_ENABLED)
if(NRF5SDK__NRFX_TIMER2_ENABLED)
    add_definitions("-DNRFX_TIMER2_ENABLED")
endif(NRF5SDK__NRFX_TIMER2_ENABLED)

if(NRF5SDK__DEBUG)
    add_definitions("-DDEBUG")
endif(NRF5SDK__DEBUG)

if(NRF5SDK__DEBUG_NRF)
    add_definitions("-DDEBUG_NRF")
endif(NRF5SDK__DEBUG_NRF)

if(NRF5SDK__BLE_STACK_SUPPORT_REQD)
    add_definitions("-DBLE_STACK_SUPPORT_REQD")
endif(NRF5SDK__BLE_STACK_SUPPORT_REQD)

if(NRF5SDK__LWIP_DONT_PROVIDE_BYTEORDER_FUNCTIONS)
    add_definitions("-DLWIP_DONT_PROVIDE_BYTEORDER_FUNCTIONS")
endif(NRF5SDK__LWIP_DONT_PROVIDE_BYTEORDER_FUNCTIONS)

if(NRF5SDK__SDK_MUTEX_ENABLE)
    add_definitions("-DSDK_MUTEX_ENABLE")
endif(NRF5SDK__SDK_MUTEX_ENABLE)

if(UBINOS__BSP__NRF52_SOFTDEVICE_PRESENT)
    add_definitions("-D${UBINOS__BSP__NRF52_SOFTDEVICE_NAME}")
    add_definitions("-DNRF_SD_BLE_API_VERSION=${UBINOS__BSP__NRF52_SOFTDEVICE_BLE_API_VERSION}")
endif(UBINOS__BSP__NRF52_SOFTDEVICE_PRESENT)


if(NRF5SDK__APP_UART_ENABLED)
    add_definitions("-DAPP_UART_ENABLED=1")
    add_definitions("-DAPP_UART_DRIVER_INSTANCE=${NRF5SDK__APP_UART_DRIVER_INSTANCE}")
else()
    add_definitions("-DAPP_UART_ENABLED=0")
endif(NRF5SDK__APP_UART_ENABLED)

if(NRF5SDK__APP_FIFO_ENABLED)
    add_definitions("-DAPP_FIFO_ENABLED=1")
else()
    add_definitions("-DAPP_FIFO_ENABLED=0")
endif(NRF5SDK__APP_FIFO_ENABLED)

if(NRF5SDK__NRF_LOG_BACKEND_UART_ENABLED OR NRF5SDK__NRF_LOG_BACKEND_RTT_ENABLED)

    set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -u _write")
    set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -u _read")

endif(NRF5SDK__NRF_LOG_BACKEND_UART_ENABLED OR NRF5SDK__NRF_LOG_BACKEND_RTT_ENABLED)

if(NRF5SDK__BLE_STACK_SUPPORT_REQD)
    add_definitions("-DBLE_STACK_SUPPORT_REQD")
endif(NRF5SDK__BLE_STACK_SUPPORT_REQD)

