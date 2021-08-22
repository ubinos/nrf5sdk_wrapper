#
# Copyright (c) 2021 Sung Ho Park and CSOS
#
# SPDX-License-Identifier: Apache-2.0
#

# {ubinos_config_type: [buildable, cmake, app]}

set_cache(UBINOS__UBIK__TICK_TYPE "RTC" STRING)
set_cache(UBINOS__UBIK__TICK_PER_SEC 1024 STRING)

set_cache(NRF5SDK__BSP_DEFINES_ONLY TRUE BOOL)
set_cache(NRF5SDK__NRFX_POWER_ENABLED FALSE BOOL)

set_cache(UBINOS__BSP__USE_DTTY TRUE BOOL)
set_cache(UBINOS__BSP__DTTY_TYPE "EXTERNAL" STRING)
set_cache(SEGGERRTT__DTTY_ENABLE TRUE BOOL)

# set_cache(UBINOS__BSP__DEBUG_SERVER_SERIAL "59300655" STRING) # arduino nano
# set_cache(UBINOS__BSP__DEBUG_SERVER_PORT "2351" STRING)

include(${PROJECT_UBINOS_DIR}/config/ubinos_nrf52840dongle.cmake)
include(${PROJECT_UBINOS_DIR}/config/ubinos/ubik_test.cmake)
include(${PROJECT_LIBRARY_DIR}/seggerrtt_wrapper/config/seggerrtt.cmake)
include(${PROJECT_LIBRARY_DIR}/nrf5sdk_wrapper/config/nrf5sdk.cmake)
include(${PROJECT_UBINOS_DIR}/app/ubik_tester.cmake)

####

string(TOLOWER "PCA10056" _temp_board_name)

get_filename_component(_tmp_source_dir "${NRF5SDK__BASE_DIR}/examples/peripheral/rtc/" ABSOLUTE)

include_directories(${_tmp_source_dir}/${_temp_board_name}/blank/config)
include_directories(${_tmp_source_dir})

