#
# Copyright (c) 2019 Sung Ho Park and CSOS
#
# SPDX-License-Identifier: Apache-2.0
#

if(INCLUDE__NRF5SDK)

    get_filename_component(_tmp_source_dir "${NRF5SDK__BASE_DIR}" ABSOLUTE)

    include_directories(${_tmp_source_dir}/components)

    include_directories(${_tmp_source_dir}/components/boards)

    include_directories(${_tmp_source_dir}/components/drivers_nrf/radio_config)

    include_directories(${_tmp_source_dir}/components/libraries)
    include_directories(${_tmp_source_dir}/components/libraries/atomic)
    include_directories(${_tmp_source_dir}/components/libraries/atomic_fifo)
    include_directories(${_tmp_source_dir}/components/libraries/atomic_flags)
    include_directories(${_tmp_source_dir}/components/libraries/balloc)
    include_directories(${_tmp_source_dir}/components/libraries/bootloader/ble_dfu)
    include_directories(${_tmp_source_dir}/components/libraries/bsp)
    include_directories(${_tmp_source_dir}/components/libraries/button)
    include_directories(${_tmp_source_dir}/components/libraries/crc16)
    include_directories(${_tmp_source_dir}/components/libraries/crc32)
    include_directories(${_tmp_source_dir}/components/libraries/crypto)
    include_directories(${_tmp_source_dir}/components/libraries/csense)
    include_directories(${_tmp_source_dir}/components/libraries/csense_drv)
    include_directories(${_tmp_source_dir}/components/libraries/delay)
    include_directories(${_tmp_source_dir}/components/libraries/ecc)
    include_directories(${_tmp_source_dir}/components/libraries/experimental_section_vars)
    include_directories(${_tmp_source_dir}/components/libraries/experimental_task_manager)
    include_directories(${_tmp_source_dir}/components/libraries/fds)
    include_directories(${_tmp_source_dir}/components/libraries/fifo)
    include_directories(${_tmp_source_dir}/components/libraries/fstorage)
    include_directories(${_tmp_source_dir}/components/libraries/gfx)
    include_directories(${_tmp_source_dir}/components/libraries/gpiote)
    include_directories(${_tmp_source_dir}/components/libraries/hardfault)
    include_directories(${_tmp_source_dir}/components/libraries/hardfault/nrf52)
    include_directories(${_tmp_source_dir}/components/libraries/hci)
    include_directories(${_tmp_source_dir}/components/libraries/led_softblink)
    include_directories(${_tmp_source_dir}/components/libraries/log)
    include_directories(${_tmp_source_dir}/components/libraries/log/src)
    include_directories(${_tmp_source_dir}/components/libraries/low_power_pwm)
    include_directories(${_tmp_source_dir}/components/libraries/mem_manager)
    include_directories(${_tmp_source_dir}/components/libraries/memobj)
    include_directories(${_tmp_source_dir}/components/libraries/mpu)
    include_directories(${_tmp_source_dir}/components/libraries/mutex)
    include_directories(${_tmp_source_dir}/components/libraries/pwm)
    include_directories(${_tmp_source_dir}/components/libraries/pwr_mgmt)
    include_directories(${_tmp_source_dir}/components/libraries/queue)
    include_directories(${_tmp_source_dir}/components/libraries/ringbuf)
    include_directories(${_tmp_source_dir}/components/libraries/scheduler)
    include_directories(${_tmp_source_dir}/components/libraries/sensorsim)
    include_directories(${_tmp_source_dir}/components/libraries/sdcard)
    include_directories(${_tmp_source_dir}/components/libraries/slip)
    include_directories(${_tmp_source_dir}/components/libraries/sortlist)
    include_directories(${_tmp_source_dir}/components/libraries/spi_mngr)
    include_directories(${_tmp_source_dir}/components/libraries/stack_guard)
    include_directories(${_tmp_source_dir}/components/libraries/stack_info)
    include_directories(${_tmp_source_dir}/components/libraries/strerror)
    include_directories(${_tmp_source_dir}/components/libraries/svc)
    include_directories(${_tmp_source_dir}/components/libraries/timer)
    include_directories(${_tmp_source_dir}/components/libraries/twi_mngr)
    include_directories(${_tmp_source_dir}/components/libraries/twi_sensor)
    include_directories(${_tmp_source_dir}/components/libraries/uart)
    include_directories(${_tmp_source_dir}/components/libraries/usbd)
    include_directories(${_tmp_source_dir}/components/libraries/usbd/class/audio)
    include_directories(${_tmp_source_dir}/components/libraries/usbd/class/cdc)
    include_directories(${_tmp_source_dir}/components/libraries/usbd/class/cdc/acm)
    include_directories(${_tmp_source_dir}/components/libraries/usbd/class/hid)
    include_directories(${_tmp_source_dir}/components/libraries/usbd/class/hid/generic)
    include_directories(${_tmp_source_dir}/components/libraries/usbd/class/hid/kbd)
    include_directories(${_tmp_source_dir}/components/libraries/usbd/class/hid/mouse)
    include_directories(${_tmp_source_dir}/components/libraries/usbd/class/msc)
    include_directories(${_tmp_source_dir}/components/libraries/util)

    include_directories(${_tmp_source_dir}/components/toolchain/cmsis/include)

    include_directories(${_tmp_source_dir}/external/fnmatch)
    include_directories(${_tmp_source_dir}/external/fprintf)
    include_directories(${_tmp_source_dir}/external/segger_rtt)
    include_directories(${_tmp_source_dir}/external/utf_converter)

    include_directories(${_tmp_source_dir}/integration/nrfx)
    include_directories(${_tmp_source_dir}/integration/nrfx/legacy)

    include_directories(${_tmp_source_dir}/modules/nrfx)
    include_directories(${_tmp_source_dir}/modules/nrfx/drivers/include)
    include_directories(${_tmp_source_dir}/modules/nrfx/hal)
    include_directories(${_tmp_source_dir}/modules/nrfx/mdk)

    set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/boards/boards.c)

    set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/drivers_nrf/radio_config/radio_config.c)

    set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/libraries/atomic/nrf_atomic.c)
    set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/libraries/atomic_fifo/nrf_atfifo.c)
    set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/libraries/atomic_flags/nrf_atflags.c)

    set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/libraries/balloc/nrf_balloc.c)
    set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/libraries/button/app_button.c)

    set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/libraries/crc16/crc16.c)
    set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/libraries/crc32/crc32.c)

    set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/libraries/experimental_section_vars/nrf_section_iter.c)

    set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/libraries/fds/fds.c)

    set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/libraries/fifo/app_fifo.c)

    set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/libraries/fstorage/nrf_fstorage.c)
    set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/libraries/fstorage/nrf_fstorage_nvmc.c)

    set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/libraries/hardfault/hardfault_implementation.c)
    set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/libraries/hardfault/nrf52/handler/hardfault_handler_gcc.c)

    set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/libraries/mem_manager/mem_manager.c)

    set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/libraries/log/src/nrf_log_frontend.c)
    set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/libraries/log/src/nrf_log_str_formatter.c)
    set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/libraries/log/src/nrf_log_backend_serial.c)
    set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/libraries/log/src/nrf_log_backend_uart.c)
    set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/libraries/log/src/nrf_log_backend_rtt.c)
    set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/libraries/log/src/nrf_log_backend_flash.c)
    set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/libraries/log/src/nrf_log_backend_dtty.c)
    set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/libraries/log/src/nrf_log_default_backends.c)

    set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/libraries/memobj/nrf_memobj.c)

    set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/libraries/mpu/nrf_mpu_lib.c)

    set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/libraries/pwr_mgmt/nrf_pwr_mgmt.c)

    set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/libraries/queue/nrf_queue.c)

    set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/libraries/ringbuf/nrf_ringbuf.c)

    set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/libraries/scheduler/app_scheduler.c)

    set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/libraries/sensorsim/sensorsim.c)

    set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/libraries/sortlist/nrf_sortlist.c)

    set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/libraries/stack_guard/nrf_stack_guard.c)

    set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/libraries/strerror/nrf_strerror.c)

    set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/libraries/util/app_error.c)
    set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/libraries/util/app_error_handler_gcc.c)
    set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/libraries/util/app_error_weak.c)
    set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/libraries/util/app_util_platform.c)
    set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/libraries/util/nrf_assert.c)

    set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/external/fnmatch/fnmatch.c)
    set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/external/fprintf/nrf_fprintf.c)
    set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/external/fprintf/nrf_fprintf_format.c)
    set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/external/utf_converter/utf.c)

    set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/integration/nrfx/legacy/nrf_drv_power.c)
    set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/integration/nrfx/legacy/nrf_drv_rng.c)
    set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/integration/nrfx/legacy/nrf_drv_ppi.c)

    set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/modules/nrfx/drivers/src/nrfx_clock.c)
    set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/modules/nrfx/drivers/src/nrfx_ppi.c)
    set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/modules/nrfx/drivers/src/nrfx_gpiote.c)
    set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/modules/nrfx/drivers/src/nrfx_systick.c)
    set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/modules/nrfx/drivers/src/nrfx_power.c)
    set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/modules/nrfx/drivers/src/nrfx_rtc.c)
    set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/modules/nrfx/drivers/src/nrfx_timer.c)
    set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/modules/nrfx/drivers/src/nrfx_rng.c)
    set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/modules/nrfx/drivers/src/nrfx_saadc.c)
    set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/modules/nrfx/drivers/src/nrfx_nvmc.c)
    set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/modules/nrfx/drivers/src/prs/nrfx_prs.c)

    set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/modules/nrfx/hal/nrf_nvmc.c)

    set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/modules/nrfx/soc/nrfx_atomic.c)

    if(NRF5SDK__CLI_ENABLED)
        include_directories(${_tmp_source_dir}/components/libraries/cli)
        include_directories(${_tmp_source_dir}/components/libraries/cli/cdc_acm)
        include_directories(${_tmp_source_dir}/components/libraries/cli/rtt)
        include_directories(${_tmp_source_dir}/components/libraries/cli/uart)
        include_directories(${_tmp_source_dir}/components/libraries/cli/dtty)

        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/libraries/cli/nrf_cli.c)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/libraries/cli/cdc_acm/nrf_cli_cdc_acm.c)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/libraries/cli/rtt/nrf_cli_rtt.c)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/libraries/cli/uart/nrf_cli_uart.c)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/libraries/cli/dtty/nrf_cli_dtty.c)

        if(NRF5SDK__NRF_LIBUARTE_DRV_UARTE0_ENABLED OR NRF5SDK__NRF_LIBUARTE_DRV_UARTE1_ENABLED)
            include_directories(${_tmp_source_dir}/components/libraries/cli/libuarte)

            set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/libraries/cli/libuarte/nrf_cli_libuarte.c)
        endif()
    endif()

    if(NRF5SDK__NRF_LIBUARTE_DRV_UARTE0_ENABLED OR NRF5SDK__NRF_LIBUARTE_DRV_UARTE1_ENABLED)
        include_directories(${_tmp_source_dir}/components/libraries/libuarte)

        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/libraries/libuarte/nrf_libuarte_async.c)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/libraries/libuarte/nrf_libuarte_drv.c)
    endif()

    if(NRF5SDK__ENABLE_BOOTLOADER)

        include_directories(${_tmp_source_dir}/components/libraries/bootloader)
        include_directories(${_tmp_source_dir}/components/libraries/bootloader/dfu)
        include_directories(${_tmp_source_dir}/components/libraries/bootloader/serial_dfu)
        include_directories(${_tmp_source_dir}/external/nano-pb)

        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/libraries/bootloader/dfu/dfu-cc.pb.c)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/libraries/bootloader/dfu/nrf_dfu.c)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/libraries/bootloader/dfu/nrf_dfu_flash.c)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/libraries/bootloader/dfu/nrf_dfu_handling_error.c)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/libraries/bootloader/dfu/nrf_dfu_mbr.c)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/libraries/bootloader/dfu/nrf_dfu_req_handler.c)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/libraries/bootloader/dfu/nrf_dfu_settings.c)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/libraries/bootloader/dfu/nrf_dfu_transport.c)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/libraries/bootloader/dfu/nrf_dfu_utils.c)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/libraries/bootloader/dfu/nrf_dfu_validation.c)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/libraries/bootloader/dfu/nrf_dfu_ver_validation.c)

        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/libraries/bootloader/nrf_bootloader.c)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/libraries/bootloader/nrf_bootloader_app_start.c)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/libraries/bootloader/nrf_bootloader_app_start_final.c)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/libraries/bootloader/nrf_bootloader_dfu_timers.c)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/libraries/bootloader/nrf_bootloader_fw_activation.c)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/libraries/bootloader/nrf_bootloader_info.c)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/libraries/bootloader/nrf_bootloader_wdt.c)

        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/libraries/bootloader/serial_dfu/nrf_dfu_serial.c)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/libraries/bootloader/serial_dfu/nrf_dfu_serial_usb.c)

        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/libraries/led_softblink/led_softblink.c)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/libraries/low_power_pwm/low_power_pwm.c)

        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/libraries/crypto/backend/cc310_bl/cc310_bl_backend_ecc.c)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/libraries/crypto/backend/cc310_bl/cc310_bl_backend_ecdsa.c)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/libraries/crypto/backend/cc310_bl/cc310_bl_backend_hash.c)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/libraries/crypto/backend/cc310_bl/cc310_bl_backend_init.c)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/libraries/crypto/backend/cc310_bl/cc310_bl_backend_shared.c)

        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/libraries/slip/slip.c)

        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/external/nano-pb/pb_common.c)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/external/nano-pb/pb_decode.c)

        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/examples/dfu/dfu_public_key.c)

    endif(NRF5SDK__ENABLE_BOOTLOADER)

    if(NRF5SDK__USBD_ENABLED)

        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/libraries/usbd/app_usbd.c)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/libraries/usbd/app_usbd_core.c)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/libraries/usbd/app_usbd_serial_num.c)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/libraries/usbd/app_usbd_string_desc.c)

        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/libraries/usbd/class/audio/app_usbd_audio.c)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/libraries/usbd/class/cdc/acm/app_usbd_cdc_acm.c)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/libraries/usbd/class/dummy/app_usbd_dummy.c)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/libraries/usbd/class/hid/generic/app_usbd_hid_generic.c)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/libraries/usbd/class/hid/kbd/app_usbd_hid_kbd.c)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/libraries/usbd/class/hid/mouse/app_usbd_hid_mouse.c)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/libraries/usbd/class/hid/app_usbd_hid.c)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/libraries/usbd/class/msc/app_usbd_msc.c)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/modules/nrfx/drivers/src/nrfx_usbd.c)

    endif(NRF5SDK__USBD_ENABLED)

    if(NRF5SDK__NRFX_CLOCK_ENABLED OR NRF5SDK__NRFX_POWER_ENABLED)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/integration/nrfx/legacy/nrf_drv_clock.c)
    endif()

    if(NRF5SDK__UART_ENABLED)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/integration/nrfx/legacy/nrf_drv_uart.c)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/modules/nrfx/drivers/src/nrfx_uart.c)

        if(NRF5SDK__NRFX_UARTE0_ENABLED OR NRF5SDK__NRFX_UARTE1_ENABLED)
            set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/modules/nrfx/drivers/src/nrfx_uarte.c)
        endif(NRF5SDK__NRFX_UARTE0_ENABLED OR NRF5SDK__NRFX_UARTE1_ENABLED)

        if(NRF5SDK__APP_UART_ENABLED)
            if(NRF5SDK__APP_FIFO_ENABLED)
                set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/libraries/uart/app_uart_fifo.c)
            else()
                set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/libraries/uart/app_uart.c)
            endif(NRF5SDK__APP_FIFO_ENABLED)
        endif(NRF5SDK__APP_UART_ENABLED)
    endif(NRF5SDK__UART_ENABLED)

    if(NRF5SDK__NRF_LOG_BACKEND_UART_ENABLED OR NRF5SDK__NRF_LOG_BACKEND_RTT_ENABLED)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/libraries/uart/retarget.c)
    endif(NRF5SDK__NRF_LOG_BACKEND_UART_ENABLED OR NRF5SDK__NRF_LOG_BACKEND_RTT_ENABLED)

    if(NRF5SDK__FREERTOS)

        include_directories(${_tmp_source_dir}/external/freertos/portable/CMSIS/nrf52)
        include_directories(${_tmp_source_dir}/external/freertos/portable/GCC/nrf52)
        include_directories(${_tmp_source_dir}/external/freertos/source/include)

        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/libraries/timer/app_timer_freertos.c)

        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/external/freertos/portable/CMSIS/nrf52/port_cmsis.c)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/external/freertos/portable/CMSIS/nrf52/port_cmsis_systick.c)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/external/freertos/portable/GCC/nrf52/port.c)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/external/freertos/source/croutine.c)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/external/freertos/source/event_groups.c)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/external/freertos/source/list.c)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/external/freertos/source/portable/MemMang/heap_1.c)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/external/freertos/source/queue.c)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/external/freertos/source/stream_buffer.c)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/external/freertos/source/tasks.c)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/external/freertos/source/timers.c)

        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/libraries/timer/app_timer_freertos.c)

    else()

        if(NRF5SDK__APP_TIMER_V2)

            set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/libraries/timer/app_timer2.c)

            if(NRF5SDK__APP_TIMER_V2_RTC0_ENABLED OR NRF5SDK__APP_TIMER_V2_RTC1_ENABLED OR NRF5SDK__APP_TIMER_V2_RTC2_ENABLED)

                set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/libraries/timer/drv_rtc.c)

            endif(NRF5SDK__APP_TIMER_V2_RTC0_ENABLED OR NRF5SDK__APP_TIMER_V2_RTC1_ENABLED OR NRF5SDK__APP_TIMER_V2_RTC2_ENABLED)

        else()

            set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/libraries/timer/app_timer.c)

        endif(NRF5SDK__APP_TIMER_V2)

    endif(NRF5SDK__FREERTOS)

    if(NRF5SDK__CRYPTO_ENABLED)

        if(NRF5SDK__CRYPTO_MBEDTLS_ENABLED)

            include_directories(${_tmp_source_dir}/external/mbedtls/include)
            include_directories(${_tmp_source_dir}/external/nrf_tls)

            set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/external/mbedtls/library/aesni.c)
            set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/external/mbedtls/library/arc4.c)
            set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/external/mbedtls/library/asn1parse.c)
            set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/external/mbedtls/library/base64.c)
            set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/external/mbedtls/library/bignum.c)
            set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/external/mbedtls/library/blowfish.c)
            set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/external/mbedtls/library/camellia.c)
            set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/external/mbedtls/library/ccm.c)
            set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/external/mbedtls/library/certs.c)
            set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/external/mbedtls/library/cipher.c)
            set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/external/mbedtls/library/cipher_wrap.c)
            set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/external/mbedtls/library/cmac.c)
            set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/external/mbedtls/library/debug.c)
            set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/external/mbedtls/library/des.c)
            set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/external/mbedtls/library/dhm.c)
            set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/external/mbedtls/library/ecdh.c)
            set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/external/mbedtls/library/ecdsa.c)
            set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/external/mbedtls/library/ecp.c)
            set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/external/mbedtls/library/ecp_curves.c)
            set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/external/mbedtls/library/entropy.c)
            set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/external/mbedtls/library/entropy_poll.c)
            set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/external/mbedtls/library/error.c)
            set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/external/mbedtls/library/gcm.c)
            set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/external/mbedtls/library/havege.c)
            set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/external/mbedtls/library/hmac_drbg.c)
            set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/external/mbedtls/library/md.c)
            set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/external/mbedtls/library/md2.c)
            set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/external/mbedtls/library/md4.c)
            set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/external/mbedtls/library/md5.c)
            set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/external/mbedtls/library/md_wrap.c)
            set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/external/mbedtls/library/memory_buffer_alloc.c)
            set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/external/mbedtls/library/oid.c)
            set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/external/mbedtls/library/padlock.c)
            set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/external/mbedtls/library/pem.c)
            set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/external/mbedtls/library/pk.c)
            set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/external/mbedtls/library/pk_wrap.c)
            set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/external/mbedtls/library/pkcs11.c)
            set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/external/mbedtls/library/pkcs12.c)
            set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/external/mbedtls/library/pkcs5.c)
            set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/external/mbedtls/library/pkparse.c)
            set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/external/mbedtls/library/pkwrite.c)
            set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/external/mbedtls/library/platform.c)
            set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/external/mbedtls/library/ripemd160.c)
            set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/external/mbedtls/library/rsa.c)
            set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/external/mbedtls/library/sha1.c)
            set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/external/mbedtls/library/sha256.c)
            set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/external/mbedtls/library/sha512.c)
            set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/external/mbedtls/library/ssl_cache.c)
            set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/external/mbedtls/library/ssl_ciphersuites.c)
            set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/external/mbedtls/library/ssl_cli.c)
            set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/external/mbedtls/library/ssl_cookie.c)
            set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/external/mbedtls/library/ssl_ticket.c)
            set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/external/mbedtls/library/ssl_tls.c)
            set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/external/mbedtls/library/threading.c)
            set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/external/mbedtls/library/version.c)
            set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/external/mbedtls/library/version_features.c)
            set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/external/mbedtls/library/x509.c)
            set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/external/mbedtls/library/x509_create.c)
            set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/external/mbedtls/library/x509_crl.c)
            set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/external/mbedtls/library/x509_crt.c)
            set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/external/mbedtls/library/x509_csr.c)
            set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/external/mbedtls/library/xtea.c)

            set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/external/nrf_tls/mbedtls/replacements/asn1write.c)
            set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/external/nrf_tls/mbedtls/replacements/ssl_srv.c)
            set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/external/nrf_tls/mbedtls/tls_interface.c)

        else()

            include_directories(${_tmp_source_dir}/components/libraries/crypto/backend/cc310)
            include_directories(${_tmp_source_dir}/components/libraries/crypto/backend/cc310_bl)
            include_directories(${_tmp_source_dir}/components/libraries/crypto/backend/oberon)

            include_directories(${_tmp_source_dir}/external/nrf_cc310/include)
            include_directories(${_tmp_source_dir}/external/nrf_cc310_bl/include)
            include_directories(${_tmp_source_dir}/external/nrf_oberon)
            include_directories(${_tmp_source_dir}/external/nrf_oberon/include)

            set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/libraries/crypto/nrf_crypto_aead.c)
            set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/libraries/crypto/nrf_crypto_aes.c)
            set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/libraries/crypto/nrf_crypto_aes_shared.c)
            set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/libraries/crypto/nrf_crypto_ecc.c)
            set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/libraries/crypto/nrf_crypto_ecdh.c)
            set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/libraries/crypto/nrf_crypto_ecdsa.c)
            set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/libraries/crypto/nrf_crypto_eddsa.c)
            set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/libraries/crypto/nrf_crypto_error.c)
            set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/libraries/crypto/nrf_crypto_hash.c)
            set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/libraries/crypto/nrf_crypto_hkdf.c)
            set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/libraries/crypto/nrf_crypto_hmac.c)
            set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/libraries/crypto/nrf_crypto_init.c)
            set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/libraries/crypto/nrf_crypto_rng.c)
            set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/libraries/crypto/nrf_crypto_shared.c)

            set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/libraries/crypto/backend/oberon/oberon_backend_chacha_poly_aead.c)
            set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/libraries/crypto/backend/oberon/oberon_backend_ecc.c)
            set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/libraries/crypto/backend/oberon/oberon_backend_ecdh.c)
            set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/libraries/crypto/backend/oberon/oberon_backend_ecdsa.c)
            set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/libraries/crypto/backend/oberon/oberon_backend_eddsa.c)
            set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/libraries/crypto/backend/oberon/oberon_backend_hash.c)
            set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/libraries/crypto/backend/oberon/oberon_backend_hmac.c)

            if(UBINOS__BSP__CPU_MODEL STREQUAL "NRF52832XXAA")
            elseif(UBINOS__BSP__CPU_MODEL STREQUAL "NRF52840XXAA")
                set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/libraries/crypto/backend/cc310/cc310_backend_aes.c)
                set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/libraries/crypto/backend/cc310/cc310_backend_aes_aead.c)
                set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/libraries/crypto/backend/cc310/cc310_backend_chacha_poly_aead.c)
                set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/libraries/crypto/backend/cc310/cc310_backend_ecc.c)
                set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/libraries/crypto/backend/cc310/cc310_backend_ecdh.c)
                set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/libraries/crypto/backend/cc310/cc310_backend_ecdsa.c)
                set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/libraries/crypto/backend/cc310/cc310_backend_eddsa.c)
                set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/libraries/crypto/backend/cc310/cc310_backend_hash.c)
                set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/libraries/crypto/backend/cc310/cc310_backend_hmac.c)
                set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/libraries/crypto/backend/cc310/cc310_backend_init.c)
                set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/libraries/crypto/backend/cc310/cc310_backend_mutex.c)
                set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/libraries/crypto/backend/cc310/cc310_backend_rng.c)
                set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/libraries/crypto/backend/cc310/cc310_backend_shared.c)
            else()
                message(FATAL_ERROR "Unsupported UBINOS__BSP__CPU_MODEL")
            endif()

        endif(NRF5SDK__CRYPTO_MBEDTLS_ENABLED)

        include_directories(${_tmp_source_dir}/components/libraries/crypto/backend/cifra)
        include_directories(${_tmp_source_dir}/components/libraries/crypto/backend/micro_ecc)
        include_directories(${_tmp_source_dir}/components/libraries/crypto/backend/nrf_hw)
        include_directories(${_tmp_source_dir}/components/libraries/crypto/backend/nrf_sw)
        include_directories(${_tmp_source_dir}/components/libraries/crypto/backend/optiga)
        include_directories(${_tmp_source_dir}/components/libraries/crypto/backend/mbedtls)

        include_directories(${_tmp_source_dir}/external/mbedtls/include)
        include_directories(${NRF5SDK__MBEDTLS_CONFIG_DIR})

        include_directories(${NRF5SDK__LIB_INCLUDE_CC310})

        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/external/mbedtls/library/aes.c)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/external/mbedtls/library/ctr_drbg.c)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/external/mbedtls/library/platform_util.c)

        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/libraries/crypto/backend/nrf_hw/nrf_hw_backend_init.c)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/libraries/crypto/backend/nrf_hw/nrf_hw_backend_rng.c)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/libraries/crypto/backend/nrf_hw/nrf_hw_backend_rng_mbedtls.c)


    endif(NRF5SDK__CRYPTO_ENABLED)

    if(NRF5SDK__MQTT_ENABLED)

        include_directories(${_tmp_source_dir}/components/iot/mqtt)

        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/iot/mqtt/mqtt.c)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/iot/mqtt/mqtt_decoder.c)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/iot/mqtt/mqtt_encoder.c)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/iot/mqtt/mqtt_rx.c)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/iot/mqtt/mqtt_transport.c)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/iot/mqtt/mqtt_transport_lwip.c)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/iot/mqtt/mqtt_transport_tls.c)

    endif(NRF5SDK__MQTT_ENABLED)

    if(NOT NRF5SDK__BSP_DEFINES_ONLY)

        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/libraries/bsp/bsp.c)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/libraries/bsp/bsp_nfc.c)

    endif(NOT NRF5SDK__BSP_DEFINES_ONLY)

    if(NRF5SDK__RTT_ENABLED)

        include_directories(${_tmp_source_dir}/external/segger_rtt)

        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/external/segger_rtt/SEGGER_RTT.c)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/external/segger_rtt/SEGGER_RTT_printf.c)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/external/segger_rtt/SEGGER_RTT_Syscalls_GCC.c)

    endif(NRF5SDK__RTT_ENABLED)

    if(NRF5SDK__SPIM_ENABLED)

        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/integration/nrfx/legacy/nrf_drv_spi.c)

        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/modules/nrfx/drivers/src/nrfx_spi.c)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/modules/nrfx/drivers/src/nrfx_spim.c)

    endif(NRF5SDK__SPIM_ENABLED)

    if(NRF5SDK__SPIS_ENABLED)

        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/integration/nrfx/legacy/nrf_drv_spis.c)

        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/modules/nrfx/drivers/src/nrfx_spis.c)

    endif(NRF5SDK__SPIS_ENABLED)

    if(NRF5SDK__TWI_ENABLED)

        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/integration/nrfx/legacy/nrf_drv_twi.c)

        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/modules/nrfx/drivers/src/nrfx_twi.c)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/modules/nrfx/drivers/src/nrfx_twim.c)

    endif(NRF5SDK__TWI_ENABLED)

    if(UBINOS__BSP__NRF52_SOFTDEVICE_PRESENT)

        include_directories(${_tmp_source_dir}/components/ble/ble_advertising)
        include_directories(${_tmp_source_dir}/components/ble/ble_db_discovery)
        include_directories(${_tmp_source_dir}/components/ble/ble_dtm)
        include_directories(${_tmp_source_dir}/components/ble/ble_racp)
        include_directories(${_tmp_source_dir}/components/ble/ble_services/ble_ancs_c)
        include_directories(${_tmp_source_dir}/components/ble/ble_services/ble_ans_c)
        include_directories(${_tmp_source_dir}/components/ble/ble_services/ble_bas)
        include_directories(${_tmp_source_dir}/components/ble/ble_services/ble_bas_c)
        include_directories(${_tmp_source_dir}/components/ble/ble_services/ble_cscs)
        include_directories(${_tmp_source_dir}/components/ble/ble_services/ble_cts_c)
        include_directories(${_tmp_source_dir}/components/ble/ble_services/ble_dfu)
        include_directories(${_tmp_source_dir}/components/ble/ble_services/ble_dis)
        include_directories(${_tmp_source_dir}/components/ble/ble_services/ble_gls)
        include_directories(${_tmp_source_dir}/components/ble/ble_services/ble_hids)
        include_directories(${_tmp_source_dir}/components/ble/ble_services/ble_hrs)
        include_directories(${_tmp_source_dir}/components/ble/ble_services/ble_hrs_c)
        include_directories(${_tmp_source_dir}/components/ble/ble_services/ble_hts)
        include_directories(${_tmp_source_dir}/components/ble/ble_services/ble_ias)
        include_directories(${_tmp_source_dir}/components/ble/ble_services/ble_ias_c)
        include_directories(${_tmp_source_dir}/components/ble/ble_services/ble_lbs)
        include_directories(${_tmp_source_dir}/components/ble/ble_services/ble_lbs_c)
        include_directories(${_tmp_source_dir}/components/ble/ble_services/ble_lls)
        include_directories(${_tmp_source_dir}/components/ble/ble_services/ble_nus)
        include_directories(${_tmp_source_dir}/components/ble/ble_services/ble_nus_c)
        include_directories(${_tmp_source_dir}/components/ble/ble_services/ble_rscs)
        include_directories(${_tmp_source_dir}/components/ble/ble_services/ble_rscs_c)
        include_directories(${_tmp_source_dir}/components/ble/ble_services/ble_tps)
        include_directories(${_tmp_source_dir}/components/ble/common)
        include_directories(${_tmp_source_dir}/components/ble/nrf_ble_scan)
        include_directories(${_tmp_source_dir}/components/ble/nrf_ble_gatt)
        include_directories(${_tmp_source_dir}/components/ble/nrf_ble_gq)
        include_directories(${_tmp_source_dir}/components/ble/nrf_ble_qwr)
        include_directories(${_tmp_source_dir}/components/ble/peer_manager)

        include_directories(${_tmp_source_dir}/components/nfc/ndef/conn_hand_parser)
        include_directories(${_tmp_source_dir}/components/nfc/ndef/conn_hand_parser/ac_rec_parser)
        include_directories(${_tmp_source_dir}/components/nfc/ndef/conn_hand_parser/ble_oob_advdata_parser)
        include_directories(${_tmp_source_dir}/components/nfc/ndef/conn_hand_parser/le_oob_rec_parser)
        include_directories(${_tmp_source_dir}/components/nfc/ndef/connection_handover/ac_rec)
        include_directories(${_tmp_source_dir}/components/nfc/ndef/connection_handover/ble_oob_advdata)
        include_directories(${_tmp_source_dir}/components/nfc/ndef/connection_handover/ble_pair_lib)
        include_directories(${_tmp_source_dir}/components/nfc/ndef/connection_handover/ble_pair_msg)
        include_directories(${_tmp_source_dir}/components/nfc/ndef/connection_handover/common)
        include_directories(${_tmp_source_dir}/components/nfc/ndef/connection_handover/ep_oob_rec)
        include_directories(${_tmp_source_dir}/components/nfc/ndef/connection_handover/hs_rec)
        include_directories(${_tmp_source_dir}/components/nfc/ndef/connection_handover/le_oob_rec)
        include_directories(${_tmp_source_dir}/components/nfc/ndef/generic/message)
        include_directories(${_tmp_source_dir}/components/nfc/ndef/generic/record)
        include_directories(${_tmp_source_dir}/components/nfc/ndef/launchapp)
        include_directories(${_tmp_source_dir}/components/nfc/ndef/parser/message)
        include_directories(${_tmp_source_dir}/components/nfc/ndef/parser/record)
        include_directories(${_tmp_source_dir}/components/nfc/ndef/text)
        include_directories(${_tmp_source_dir}/components/nfc/ndef/uri)
        include_directories(${_tmp_source_dir}/components/nfc/t2t_lib)
        include_directories(${_tmp_source_dir}/components/nfc/t2t_parser)
        include_directories(${_tmp_source_dir}/components/nfc/t4t_lib)
        include_directories(${_tmp_source_dir}/components/nfc/t4t_parser/apdu)
        include_directories(${_tmp_source_dir}/components/nfc/t4t_parser/cc_file)
        include_directories(${_tmp_source_dir}/components/nfc/t4t_parser/hl_detection_procedure)
        include_directories(${_tmp_source_dir}/components/nfc/t4t_parser/tlv)

        include_directories(${_tmp_source_dir}/components/softdevice/common)

        if(NOT ${UBINOS__BSP__NRF52_SOFTDEVICE_INCLUDE_DIR} STREQUAL "")
            include_directories(${UBINOS__BSP__NRF52_SOFTDEVICE_INCLUDE_DIR})
            include_directories(${UBINOS__BSP__NRF52_SOFTDEVICE_INCLUDE_DIR}/nrf52)
        endif()

        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/libraries/bsp/bsp_btn_ble.c)

        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/libraries/fstorage/nrf_fstorage_sd.c)

        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/ble/ble_advertising/ble_advertising.c)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/ble/ble_db_discovery/ble_db_discovery.c)

        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/ble/ble_services/ble_lbs/ble_lbs.c)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/ble/ble_services/ble_lbs_c/ble_lbs_c.c)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/ble/ble_services/ble_bas/ble_bas.c)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/ble/ble_services/ble_hrs/ble_hrs.c)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/ble/ble_services/ble_dis/ble_dis.c)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/ble/ble_services/ble_bas_c/ble_bas_c.c)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/ble/ble_services/ble_hrs_c/ble_hrs_c.c)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/ble/ble_services/ble_nus/ble_nus.c)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/ble/ble_services/ble_nus_c/ble_nus_c.c)

        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/ble/common/ble_advdata.c)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/ble/common/ble_conn_params.c)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/ble/common/ble_conn_state.c)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/ble/common/ble_srv_common.c)

        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/ble/nrf_ble_gatt/nrf_ble_gatt.c)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/ble/nrf_ble_gq/nrf_ble_gq.c)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/ble/nrf_ble_qwr/nrf_ble_qwr.c)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/ble/nrf_ble_scan/nrf_ble_scan.c)

        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/softdevice/common/nrf_sdh_ble.c)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/softdevice/common/nrf_sdh_soc.c)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/softdevice/common/nrf_sdh.c)

        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/ble/peer_manager/auth_status_tracker.c)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/ble/peer_manager/gatt_cache_manager.c)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/ble/peer_manager/gatts_cache_manager.c)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/ble/peer_manager/id_manager.c)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/ble/peer_manager/nrf_ble_lesc.c)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/ble/peer_manager/peer_data_storage.c)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/ble/peer_manager/peer_database.c)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/ble/peer_manager/peer_id.c)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/ble/peer_manager/peer_manager.c)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/ble/peer_manager/peer_manager_handler.c)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/ble/peer_manager/pm_buffer.c)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/ble/peer_manager/security_dispatcher.c)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/ble/peer_manager/security_manager.c)

        if(NRF5SDK__IOT_ENABLED)

            include_directories(${_tmp_source_dir}/components/ble/ble_services/ble_ipsp)
            include_directories(${_tmp_source_dir}/components/iot/errno)
            include_directories(${_tmp_source_dir}/components/iot/ble_6lowpan)
            include_directories(${_tmp_source_dir}/components/iot/common)
            include_directories(${_tmp_source_dir}/components/iot/context_manager)
            include_directories(${_tmp_source_dir}/components/iot/ipv6_parse)
            include_directories(${_tmp_source_dir}/components/iot/medium)
            include_directories(${_tmp_source_dir}/components/iot/medium/ble_ncfgs)
            include_directories(${_tmp_source_dir}/components/iot/medium/commissioning)

            set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/ble/ble_services/ble_ipsp/ble_ipsp.c)
            set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/iot/errno/errno.c)
            set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/iot/ble_6lowpan/ble_6lowpan.c)
            set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/iot/context_manager/iot_context_manager.c)
            set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/iot/ipv6_parse/ipv6_parse.c)
            set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/iot/medium/ble_ncfgs/ble_ncfgs.c)
            set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/iot/medium/commissioning/commissioning.c)
            set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/iot/medium/ipv6_medium_ble.c)

            if(NRF5SDK__IOT_TIMER_ENABLED)

                include_directories(${_tmp_source_dir}/components/iot/iot_timer)

                set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/iot/iot_timer/iot_timer.c)

            endif()

            if(NRF5SDK__IOT_SOCKET_ENABLED)

                include_directories(${_tmp_source_dir}/components/iot/socket/common)
                include_directories(${_tmp_source_dir}/components/iot/socket/config/medium)
                include_directories(${_tmp_source_dir}/components/iot/socket/api)
                include_directories(${_tmp_source_dir}/components/iot/socket/libraries/fifo)
                include_directories(${_tmp_source_dir}/components/iot/socket/libraries/mbuf)
                include_directories(${_tmp_source_dir}/components/iot/socket/libraries/portdb)

                set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/iot/socket/common/sleep.c)
                set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/iot/socket/common/socket.c)
                set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/iot/socket/config/medium/config_medium.c)
                set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/iot/socket/libraries/addr_util/inet_pton.c)
                set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/iot/socket/libraries/fifo/nrf_fifo.c)
                set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/iot/socket/libraries/mbuf/mbuf.c)
                set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/iot/socket/libraries/portdb/portdb.c)
                set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/iot/socket/platform/ble/socket_ble.c)

            endif()

            if(NRF5SDK__LWIP_ENABLED)

                include_directories(${_tmp_source_dir}/external/lwip/src/port)
                include_directories(${_tmp_source_dir}/external/lwip/src/port/arch)
                include_directories(${_tmp_source_dir}/external/lwip/src/include)
                include_directories(${_tmp_source_dir}/external/lwip/src/include/netif)
                include_directories(${_tmp_source_dir}/external/lwip/src/include/lwip)


                set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/external/lwip/src/core/def.c)
                set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/external/lwip/src/core/dhcp.c)
                set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/external/lwip/src/core/ipv6/dhcp6.c)
                set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/external/lwip/src/core/dns.c)
                set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/external/lwip/src/core/ipv4/icmp.c)
                set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/external/lwip/src/core/ipv6/icmp6.c)
                set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/external/lwip/src/core/ipv6/inet6.c)
                set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/external/lwip/src/core/inet_chksum.c)
                set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/external/lwip/src/core/init.c)
                set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/external/lwip/src/core/ip.c)
                set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/external/lwip/src/core/ipv4/ip4.c)
                set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/external/lwip/src/core/ipv4/ip4_addr.c)
                set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/external/lwip/src/core/ipv6/ip6.c)
                set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/external/lwip/src/core/ipv6/ip6_addr.c)
                set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/external/lwip/src/core/memp.c)
                set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/external/lwip/src/core/ipv6/mld6.c)
                set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/external/lwip/src/core/ipv6/nd6.c)
                set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/external/lwip/src/core/netif.c)
                set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/external/lwip/src/port/nrf_platform_port.c)
                set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/external/lwip/src/core/pbuf.c)
                set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/external/lwip/src/core/raw.c)
                set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/external/lwip/src/core/sys.c)
                set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/external/lwip/src/core/tcp.c)
                set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/external/lwip/src/core/tcp_in.c)
                set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/external/lwip/src/core/tcp_out.c)
                set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/external/lwip/src/core/timeouts.c)
                set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/external/lwip/src/core/udp.c)

                if(NRF5SDK__IOT_SOCKET_ENABLED)
                    set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/iot/socket/transport/lwip/transport_handler.c)
                endif()

            else()

                include_directories(${_tmp_source_dir}/components/iot/ipv6_stack/pbuffer)
                include_directories(${_tmp_source_dir}/components/iot/ipv6_stack/udp)
                include_directories(${_tmp_source_dir}/components/iot/ipv6_stack/utils)
                include_directories(${_tmp_source_dir}/components/iot/ipv6_stack/icmp6)
                include_directories(${_tmp_source_dir}/components/iot/ipv6_stack/include)

                set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/iot/ipv6_stack/icmp6/icmp6.c)
                set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/iot/ipv6_stack/ipv6/ipv6.c)
                set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/iot/ipv6_stack/pbuffer/iot_pbuffer.c)
                set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/iot/ipv6_stack/udp/udp6.c)
                set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/iot/ipv6_stack/utils/ipv6_utils.c)

                if(NRF5SDK__IOT_SOCKET_ENABLED)
                    set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/iot/socket/transport/ipv6/transport_handler.c)
                endif()

            endif(NRF5SDK__LWIP_ENABLED)

        endif(NRF5SDK__IOT_ENABLED)

        if(NRF5SDK__FREERTOS)

            set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/softdevice/common/nrf_sdh_freertos.c)

        endif(NRF5SDK__FREERTOS)

        if(NRF5SDK__BLE_STACK_SUPPORT_REQD)

            include_directories(${_tmp_source_dir}/components/ble/ble_link_ctx_manager)
            include_directories(${_tmp_source_dir}/components/ble/ble_services/ble_hids)

            set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/ble/ble_link_ctx_manager/ble_link_ctx_manager.c)
            set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/ble/ble_services/ble_hids/ble_hids.c)

        endif(NRF5SDK__BLE_STACK_SUPPORT_REQD)

    else()
        if(UBINOS__BSP__NRF52_MBR_PRESENT AND (NOT ${UBINOS__BSP__NRF52_SOFTDEVICE_INCLUDE_DIR} STREQUAL ""))
            include_directories(${UBINOS__BSP__NRF52_SOFTDEVICE_INCLUDE_DIR})
        endif()

        include_directories(${_tmp_source_dir}/components/drivers_nrf/nrf_soc_nosd)

        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/drivers_nrf/nrf_soc_nosd/nrf_nvic.c)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/components/drivers_nrf/nrf_soc_nosd/nrf_soc.c)

    endif(UBINOS__BSP__NRF52_SOFTDEVICE_PRESENT)

endif(INCLUDE__NRF5SDK)


