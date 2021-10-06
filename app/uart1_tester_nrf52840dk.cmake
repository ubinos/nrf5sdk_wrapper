#
# Copyright (c) 2020 Sung Ho Park and CSOS
#
# SPDX-License-Identifier: Apache-2.0
#

# {ubinos_config_type: [buildable, cmake, app]}

set(INCLUDE__APP TRUE)
set(APP__NAME "uart1_tester")

set_cache(UBINOS__UBIK__TICK_TYPE "RTC" STRING)
set_cache(UBINOS__UBIK__TICK_PER_SEC 1024 STRING)

set_cache(UBINOS__UBICLIB__EXCLUDE_CLI FALSE BOOL)

set_cache(NRF5SDK__BSP_DEFINES_ONLY TRUE BOOL)
set_cache(NRF5SDK__NRFX_POWER_ENABLED FALSE BOOL)

set_cache(UBINOS__BSP__DTTY_TYPE "EXTERNAL" STRING)
set_cache(NRF5SDK__DTTY_NRF_UART_ENABLE TRUE BOOL)
set_cache(NRF5SDK__UART_ENABLED TRUE BOOL)
set_cache(NRF5SDK__NRFX_UARTE0_ENABLED TRUE BOOL)
set_cache(NRF5SDK__NRFX_UARTE1_ENABLED TRUE BOOL)

# set_cache(UBINOS__BSP__DEBUG_SERVER_SERIAL "683755679" STRING) # 0200
# set_cache(UBINOS__BSP__DEBUG_SERVER_SERIAL "683542035" STRING) # 0203
# set_cache(UBINOS__BSP__DEBUG_SERVER_PORT "2341" STRING)

include(${PROJECT_UBINOS_DIR}/config/ubinos_nrf52840dk.cmake)
include(${PROJECT_LIBRARY_DIR}/nrf5sdk_wrapper/config/nrf5sdk.cmake)
include(${PROJECT_LIBRARY_DIR}/nrf5sdk_extension/config/nrf5sdk_extension.cmake)

get_filename_component(_tmp_source_dir "${CMAKE_CURRENT_LIST_DIR}/${APP__NAME}" ABSOLUTE)

include_directories(${_tmp_source_dir}/arch/arm/cortexm/nrf52840dk/blank/config)
include_directories(${_tmp_source_dir}/arch/arm/cortexm/nrf52840dk)
include_directories(${_tmp_source_dir})

file(GLOB_RECURSE _tmp_sources
    "${_tmp_source_dir}/*.c"
    "${_tmp_source_dir}/*.cpp"
    "${_tmp_source_dir}/*.cc"
    "${_tmp_source_dir}/*.S"
    "${_tmp_source_dir}/*.s")

set(PROJECT_APP_SOURCES ${PROJECT_APP_SOURCES} ${_tmp_sources})

