#
# Copyright (c) 2020 Sung Ho Park and CSOS
# 
# SPDX-License-Identifier: Apache-2.0
#

set_cache(UBINOS__UBIK__TICK_TYPE "RTC" STRING)
set_cache(UBINOS__UBIK__TICK_PER_SEC 1024 STRING)

set_cache(UBINOS__UBICLIB__EXCLUDE_CLI FALSE BOOL)

set_cache(NRF5SDK__BSP_DEFINES_ONLY TRUE BOOL)
set_cache(NRF5SDK__NRFX_POWER_ENABLED FALSE BOOL)

set_cache(UBINOS__BSP__DTTY_TYPE "EXTERNAL" STRING)
####
#set_cache(NRF5SDK__DTTY_NRF_LIBUARTE_ENABLE TRUE BOOL)
#set_cache(NRF5SDK__APP_TIMER_V2 TRUE BOOL)
#set_cache(NRF5SDK__APP_TIMER_V2_RTC1_ENABLED TRUE BOOL)
#set_cache(NRF5SDK__NRF_LIBUARTE_DRV_UARTE0_ENABLED TRUE BOOL)
##
set_cache(NRF5SDK__DTTY_NRF_UART_ENABLE TRUE BOOL)
set_cache(NRF5SDK__UART_ENABLED TRUE BOOL)
set_cache(NRF5SDK__NRFX_UARTE0_ENABLED TRUE BOOL)
####

include(${PROJECT_UBINOS_DIR}/config/ubinos_nrf52dk.cmake)

include(${PROJECT_LIBRARY_DIR}/nrf5sdk_wrapper/config/nrf5sdk.cmake)

include(${PROJECT_UBINOS_DIR}/app/cli_tester.cmake)

####

string(TOLOWER ${NRF5SDK__BOARD_NAME} _temp_board_name)

get_filename_component(_tmp_source_dir "${CMAKE_CURRENT_LIST_DIR}/cli_tester" ABSOLUTE)

include_directories(${_tmp_source_dir}/arch/arm/cortexm/${_temp_board_name}/blank/config)
include_directories(${_tmp_source_dir})


