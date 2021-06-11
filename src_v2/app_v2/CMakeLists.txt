cmake_minimum_required(VERSION 3.10...3.17 FATAL_ERROR)
project(app_v2)
add_executable(app_v2 ${CMAKE_CURRENT_LIST_DIR}/app_v2.cpp)
#add_executable(app_v2 ${CMAKE_CURRENT_LIST_DIR} main.cpp)
#target_compile_definitions(app_v2 PRIVATE
#        #PICO_ENTER_USB_BOOT_ON_EXIT=1
#)
target_include_directories(app_v2 PUBLIC ${CMAKE_CURRENT_LIST_DIR})
set_target_properties(app_v2 PROPERTIES CXX_STANDARD 17 CXX_STANDARD_REQUIRED YES CXX_EXTENSIONS NO)
target_link_libraries(app_v2 pico_explorer pico_graphics rv3028 st7789 pico_stdlib hardware_i2c hardware_spi)

# enable usb output, enable uart output
pico_enable_stdio_usb(app_v2 1)
pico_enable_stdio_uart(app_v2 1)

# create map/bin/hex file etc.
pico_add_extra_outputs(app_v2)
