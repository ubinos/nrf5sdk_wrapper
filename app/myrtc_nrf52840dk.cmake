set_cache(NRF5SDK__BSP_DEFINES_ONLY TRUE BOOL)
set_cache(NRF5SDK__NRFX_POWER_ENABLED FALSE BOOL)

include(${PROJECT_UBINOS_DIR}/config/ubinos_nrf52840dk.cmake)

include(${PROJECT_LIBRARY_DIR}/nrf5sdk_wrapper/config/nrf5sdk.cmake)

####

set(INCLUDE__APP TRUE)
set(APP__NAME "myrtc")

get_filename_component(_tmp_source_dir "${CMAKE_CURRENT_LIST_DIR}/myrtc" ABSOLUTE)

file(GLOB_RECURSE _tmp_sources
    "${_tmp_source_dir}/*.c"
    "${_tmp_source_dir}/*.cpp"
    "${_tmp_source_dir}/*.S"
    "${_tmp_source_dir}/*.s")

set(PROJECT_APP_SOURCES ${PROJECT_APP_SOURCES} ${_tmp_sources})

string(TOLOWER ${NRF5SDK__BOARD_NAME} _temp_board_name)

get_filename_component(_tmp_source_dir "${NRF5SDK__BASE_DIR}/examples/peripheral/rtc/" ABSOLUTE)

include_directories(${_tmp_source_dir}/${_temp_board_name}/blank/config)
include_directories(${_tmp_source_dir})
