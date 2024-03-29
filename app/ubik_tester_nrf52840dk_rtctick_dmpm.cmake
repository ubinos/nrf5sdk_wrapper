#
# Copyright (c) 2019 Sung Ho Park and CSOS
#
# SPDX-License-Identifier: Apache-2.0
#

# ubinos_config_info {"name_base": "ubik_tester", "build_type": "cmake_ubinos", "app": true}

set_cache(UBINOS__BSP__LINKSCRIPT_FILE "${PROJECT_UBINOS_DIR}/source/ubinos/bsp/arch/arm/cortexm/nrf52/xxaa/flash_bdh.ld" PATH)

set_cache(UBINOS__UBICLIB__EXCLUDE_HEAP_DMPM FALSE BOOL)
set_cache(UBINOS__UBICLIB__EXCLUDE_HEAP_DMPM_MEMORY_READY_CHECK FALSE BOOL)

# set_cache(UBINOS__UBICLIB__HEAP_DEFAULT_DIR 1 STRING)

# set_cache(UBINOS__BSP__STACK_SIZE 0x8000 STRING)

include(${CMAKE_CURRENT_LIST_DIR}/ubik_tester_nrf52840dk_rtctick.cmake)

