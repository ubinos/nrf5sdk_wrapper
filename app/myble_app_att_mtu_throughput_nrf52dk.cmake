#
# Copyright (c) 2019 Sung Ho Park and CSOS
#
# SPDX-License-Identifier: Apache-2.0
#

# {ubinos_config_type: [buildable, cmake, app]}

set_cache(UBINOS__BSP__LINK_MEMMAP_RAM_ORIGIN 0x20003400 STRING)
set_cache(UBINOS__BSP__LINK_MEMMAP_RAM_LENGTH 0x0000CC00 STRING)

set_cache(NRF5SDK__CLI_ENABLED TRUE BOOL)

include(${PROJECT_UBINOS_DIR}/config/ubinos_nrf52dk_softdevice.cmake)

include(${PROJECT_LIBRARY_DIR}/nrf5sdk_wrapper/config/nrf5sdk.cmake)

####

set(INCLUDE__APP TRUE)
set(APP__NAME "myble_app_att_mtu_throughput")

get_filename_component(_tmp_source_dir "${CMAKE_CURRENT_LIST_DIR}/myble_app_att_mtu_throughput" ABSOLUTE)

file(GLOB_RECURSE _tmp_sources
    "${_tmp_source_dir}/*.c"
    "${_tmp_source_dir}/*.cpp"
    "${_tmp_source_dir}/*.S"
    "${_tmp_source_dir}/*.s")

set(PROJECT_APP_SOURCES ${PROJECT_APP_SOURCES} ${_tmp_sources})

string(TOLOWER ${UBINOS__BSP__NRF52_SOFTDEVICE_NAME} _temp_softdevice_name)
string(TOLOWER ${NRF5SDK__BOARD_NAME} _temp_board_name)

get_filename_component(_tmp_source_dir "${NRF5SDK__BASE_DIR}/examples/ble_central_and_peripheral/experimental/ble_app_att_mtu_throughput/" ABSOLUTE)

include_directories(${_tmp_source_dir}/${_temp_board_name}/${_temp_softdevice_name}/config)
include_directories(${_tmp_source_dir})

set(PROJECT_APP_SOURCES ${PROJECT_APP_SOURCES} "${_tmp_source_dir}/amtc.c")
set(PROJECT_APP_SOURCES ${PROJECT_APP_SOURCES} "${_tmp_source_dir}/amts.c")
set(PROJECT_APP_SOURCES ${PROJECT_APP_SOURCES} "${_tmp_source_dir}/example_cmds.c")
