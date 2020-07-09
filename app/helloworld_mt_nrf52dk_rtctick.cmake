set_cache(UBINOS__UBIK__TICK_TYPE "RTC" STRING)
set_cache(UBINOS__UBIK__TICK_PER_SEC 1024 STRING)

set_cache(NRF5SDK__BSP_DEFINES_ONLY TRUE BOOL)
set_cache(NRF5SDK__NRFX_POWER_ENABLED FALSE BOOL)

include(${PROJECT_UBINOS_DIR}/config/ubinos_nrf52dk.cmake)

include(${PROJECT_LIBRARY_DIR}/nrf5sdk_wrapper/config/nrf5sdk.cmake)

include(${PROJECT_UBINOS_DIR}/app/helloworld_mt.cmake)

####

string(TOLOWER ${NRF5SDK__BOARD_NAME} _temp_board_name)

get_filename_component(_tmp_source_dir "${NRF5SDK__BASE_DIR}/examples/peripheral/rtc/" ABSOLUTE)

include_directories(${_tmp_source_dir}/${_temp_board_name}/blank/config)
include_directories(${_tmp_source_dir})

