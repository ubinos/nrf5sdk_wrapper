#
# Copyright (c) 2019 Sung Ho Park and CSOS
#
# SPDX-License-Identifier: Apache-2.0
#

# {ubinos_config_type: [buildable, cmake, app]}

set_cache(UBINOS__UBICLIB__USE_STDIO_RETARGETING FALSE BOOL)
set_cache(UBINOS__BSP__USE_DTTY FALSE BOOL)

set_cache(NRF5SDK__UART_ENABLED TRUE BOOL)
set_cache(NRF5SDK__NRFX_UARTE0_ENABLED TRUE BOOL)
set_cache(NRF5SDK__APP_UART_ENABLED TRUE BOOL)
set_cache(NRF5SDK__APP_FIFO_ENABLED TRUE BOOL)
set_cache(NRF5SDK__NRF_LOG_BACKEND_UART_ENABLED TRUE BOOL)
set_cache(NRF5SDK__SWI_DISABLE0 TRUE BOOL)
set_cache(NRF5SDK__BLE_STACK_SUPPORT_REQD TRUE BOOL)

include(${PROJECT_UBINOS_DIR}/config/ubinos_nrf52840dk_softdevice_baremetal.cmake)

include(${PROJECT_LIBRARY_DIR}/nrf5sdk_wrapper/config/nrf5sdk.cmake)

include(${CMAKE_CURRENT_LIST_DIR}/ble_app_hids_mouse.cmake)

####

string(TOLOWER ${UBINOS__BSP__NRF52_SOFTDEVICE_NAME} _temp_softdevice_name)
string(TOLOWER ${NRF5SDK__BOARD_NAME} _temp_board_name)

get_filename_component(_tmp_source_dir "${NRF5SDK__BASE_DIR}/examples/ble_peripheral/ble_app_hids_mouse/" ABSOLUTE)

include_directories(${_tmp_source_dir}/${_temp_board_name}/${_temp_softdevice_name}/config)
include_directories(${_tmp_source_dir})


