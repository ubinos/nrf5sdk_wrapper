#
# Copyright (c) 2019 Sung Ho Park and CSOS
#
# SPDX-License-Identifier: Apache-2.0
#

# ubinos_config_info {"name_base": "cli", "build_type": "cmake_ubinos", "app": true}

set(INCLUDE__APP TRUE)
set(APP__NAME "cli")

set_cache(NRF5SDK__CLI_ENABLED TRUE BOOL)
set_cache(NRF5SDK__APP_TIMER_V2 TRUE BOOL)
set_cache(NRF5SDK__APP_TIMER_V2_RTC1_ENABLED TRUE BOOL)
set_cache(NRF5SDK__DEBUG TRUE BOOL)
set_cache(NRF5SDK__DEBUG_NRF TRUE BOOL)

include(${PROJECT_UBINOS_DIR}/config/ubinos_nrf52dk.cmake)
include(${PROJECT_LIBRARY_DIR}/nrf5sdk_wrapper/config/nrf5sdk.cmake)
include(${PROJECT_LIBRARY_DIR}/nrf5sdk_extension/config/nrf5sdk_extension.cmake)

get_filename_component(_tmp_source_dir "${CMAKE_CURRENT_LIST_DIR}/${APP__NAME}" ABSOLUTE)
string(TOLOWER ${UBINOS__BSP__BOARD_MODEL} _temp_board_model)
set(_temp_softdevice_name "blank")

include_directories(${_tmp_source_dir}/arch/arm/cortexm/${_temp_board_model}/${_temp_softdevice_name}/config)
include_directories(${_tmp_source_dir}/arch/arm/cortexm/${_temp_board_model})
include_directories(${_tmp_source_dir})

file(GLOB_RECURSE _tmp_sources
    "${_tmp_source_dir}/*.c"
    "${_tmp_source_dir}/*.cpp"
    "${_tmp_source_dir}/*.cc"
    "${_tmp_source_dir}/*.S"
    "${_tmp_source_dir}/*.s")

set(PROJECT_APP_SOURCES ${PROJECT_APP_SOURCES} ${_tmp_sources})

