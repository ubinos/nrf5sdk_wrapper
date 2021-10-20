#
# Copyright (c) 2019 Sung Ho Park and CSOS
#
# SPDX-License-Identifier: Apache-2.0
#

# ubinos_config_info {"name_base": "ble_app_att_mtu_throughput", "build_type": "cmake_ubinos", "app": true}

set_cache(UBINOS__UBIK__TICK_TYPE "RTC" STRING)
set_cache(UBINOS__UBIK__TICK_PER_SEC 1024 STRING)

include(${CMAKE_CURRENT_LIST_DIR}/ble_app_att_mtu_throughput_nrf52840dk.cmake)

