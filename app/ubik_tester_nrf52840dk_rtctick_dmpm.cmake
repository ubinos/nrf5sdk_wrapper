set_cache(UBINOS__BSP__LINKSCRIPT_FILE "${PROJECT_UBINOS_DIR}/source/ubinos/bsp/arch/arm/cortexm/nrf52/xxaa/flash_bdh.ld" PATH)

set_cache(UBINOS__UBICLIB__EXCLUDE_HEAP_DMPM FALSE BOOL)
set_cache(UBINOS__UBICLIB__EXCLUDE_HEAP_DMPM_MEMORY_READY_CHECK FALSE BOOL)

include(${CMAKE_CURRENT_LIST_DIR}/ubik_tester_nrf52840dk_rtctick.cmake)


