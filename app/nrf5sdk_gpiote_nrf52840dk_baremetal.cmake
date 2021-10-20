#
# Copyright (c) 2019 Sung Ho Park and CSOS
#
# SPDX-License-Identifier: Apache-2.0
#

# ubinos_config_info {"name_base": "nrf5sdk_gpiote", "build_type": "cmake_ubinos", "app": true}

set(INCLUDE__APP TRUE)
set(APP__NAME "nrf5sdk_gpiote")

set_cache(NRF5SDK__BSP_DEFINES_ONLY TRUE BOOL)
set_cache(NRF5SDK__NRFX_POWER_ENABLED FALSE BOOL)
set_cache(NRF5SDK__NRFX_CLOCK_ENABLED FALSE BOOL)

include(${PROJECT_UBINOS_DIR}/config/ubinos_nrf52840dk_baremetal.cmake)
include(${PROJECT_LIBRARY_DIR}/nrf5sdk_wrapper/config/nrf5sdk.cmake)
include(${PROJECT_LIBRARY_DIR}/nrf5sdk_extension/config/nrf5sdk_extension.cmake)

get_filename_component(_tmp_source_dir "${NRF5SDK__BASE_DIR}/examples/peripheral/gpiote/" ABSOLUTE)
string(TOLOWER ${NRF5SDK__BOARD_NAME} _temp_board_name)
set(_temp_softdevice_name "blank")

include_directories(${_tmp_source_dir}/${_temp_board_name}/${_temp_softdevice_name}/config)
include_directories(${_tmp_source_dir}/${_temp_board_name})
include_directories(${_tmp_source_dir})

file(GLOB_RECURSE _tmp_sources
    "${_tmp_source_dir}/*.c"
    "${_tmp_source_dir}/*.cpp"
    "${_tmp_source_dir}/*.cc"
    "${_tmp_source_dir}/*.S"
    "${_tmp_source_dir}/*.s")

set(PROJECT_APP_SOURCES ${PROJECT_APP_SOURCES} ${_tmp_sources})

