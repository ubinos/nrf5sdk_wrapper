set_cache(NRF5SDK__BSP_DEFINES_ONLY TRUE BOOL)
set_cache(NRF5SDK__NRFX_POWER_ENABLED FALSE BOOL)

set_cache(NRF5SDK__APP_TIMER_V2 TRUE BOOL)
set_cache(NRF5SDK__APP_TIMER_V2_RTC1_ENABLED TRUE BOOL)
set_cache(NRF5SDK__NRF_LIBUARTE_DRV_UARTE1_ENABLED TRUE BOOL)

include(${PROJECT_UBINOS_DIR}/config/ubinos_nrf52840dk_trace.cmake)

include(${PROJECT_LIBRARY_DIR}/nrf5sdk_wrapper/config/nrf5sdk.cmake)

####

set(INCLUDE__APP TRUE)
set(APP__NAME "mylibuarte")

get_filename_component(_tmp_source_dir "${CMAKE_CURRENT_LIST_DIR}/mylibuarte" ABSOLUTE)

file(GLOB_RECURSE _tmp_sources
    "${_tmp_source_dir}/*.c"
    "${_tmp_source_dir}/*.cpp"
    "${_tmp_source_dir}/*.S"
    "${_tmp_source_dir}/*.s")

set(PROJECT_APP_SOURCES ${PROJECT_APP_SOURCES} ${_tmp_sources})

include_directories(${_tmp_source_dir}/arch/arm/cortexm/nrf52840dk/blank/config)
include_directories(${_tmp_source_dir})
