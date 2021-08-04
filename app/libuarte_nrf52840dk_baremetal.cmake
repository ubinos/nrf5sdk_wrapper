#
# Copyright (c) 2019 Sung Ho Park and CSOS
#
# SPDX-License-Identifier: Apache-2.0
#

# {ubinos_config_type: [buildable, cmake, app]}

set_cache(UBINOS__UBICLIB__USE_STDIO_RETARGETING FALSE BOOL)
set_cache(UBINOS__BSP__USE_DTTY FALSE BOOL)

set_cache(NRF5SDK__BSP_DEFINES_ONLY TRUE BOOL)
set_cache(NRF5SDK__APP_TIMER_V2 TRUE BOOL)
set_cache(NRF5SDK__APP_TIMER_V2_RTC1_ENABLED TRUE BOOL)
set_cache(NRF5SDK__NRF_LIBUARTE_DRV_UARTE0_ENABLED TRUE BOOL)

set_cache(NRF5SDK__NRFX_POWER_ENABLED FALSE BOOL)

include(${PROJECT_UBINOS_DIR}/config/ubinos_nrf52840dk_baremetal.cmake)

include(${PROJECT_LIBRARY_DIR}/nrf5sdk_wrapper/config/nrf5sdk.cmake)

include(${CMAKE_CURRENT_LIST_DIR}/libuarte.cmake)

####

string(TOLOWER ${NRF5SDK__BOARD_NAME} _temp_board_name)

get_filename_component(_tmp_source_dir "${NRF5SDK__BASE_DIR}/examples/peripheral/libuarte/" ABSOLUTE)

include_directories(${_tmp_source_dir}/${_temp_board_name}/blank/config)
include_directories(${_tmp_source_dir})


