set(INCLUDE__APP TRUE)
set(APP__NAME "ble_app_hids_mouse")

get_filename_component(_tmp_source_dir "${NRF5SDK__BASE_DIR}/examples/ble_peripheral/ble_app_hids_mouse" ABSOLUTE)

set(PROJECT_APP_SOURCES ${PROJECT_APP_SOURCES} ${_tmp_source_dir}/main.c)


