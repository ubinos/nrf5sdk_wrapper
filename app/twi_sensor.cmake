set(INCLUDE__APP TRUE)
set(APP__NAME "twi_sensor")

get_filename_component(_tmp_source_dir "${NRF5SDK__BASE_DIR}/examples/peripheral/twi_sensor/" ABSOLUTE)

set(PROJECT_APP_SOURCES ${PROJECT_APP_SOURCES} ${_tmp_source_dir}/main.c)


