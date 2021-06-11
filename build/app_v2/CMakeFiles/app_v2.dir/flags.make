# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.16

# compile ASM with /usr/bin/arm-none-eabi-gcc
# compile C with /usr/bin/arm-none-eabi-gcc
# compile CXX with /usr/bin/arm-none-eabi-g++
ASM_FLAGS = -mcpu=cortex-m0plus -mthumb -O3 -DNDEBUG   -ffunction-sections -fdata-sections

ASM_DEFINES = -DCFG_TUSB_DEBUG=0 -DCFG_TUSB_MCU=OPT_MCU_RP2040 -DCFG_TUSB_OS=OPT_OS_PICO -DPICO_BIT_OPS_PICO=1 -DPICO_BOARD=\"pico\" -DPICO_BUILD=1 -DPICO_CMAKE_BUILD_TYPE=\"Release\" -DPICO_COPY_TO_RAM=0 -DPICO_CXX_ENABLE_EXCEPTIONS=0 -DPICO_DIVIDER_HARDWARE=1 -DPICO_DOUBLE_PICO=1 -DPICO_FLOAT_PICO=1 -DPICO_INT64_OPS_PICO=1 -DPICO_MEM_OPS_PICO=1 -DPICO_NO_FLASH=0 -DPICO_NO_HARDWARE=0 -DPICO_ON_DEVICE=1 -DPICO_PRINTF_PICO=1 -DPICO_STDIO_UART=1 -DPICO_STDIO_USB=1 -DPICO_TARGET_NAME=\"app_v2\" -DPICO_USE_BLOCKED_RAM=0

ASM_INCLUDES = -I/mnt/i/pico/rtc_psk_win2/src_v2/app_v2 -I/mnt/i/pico/rtc_psk_win2/src_v2/pico_explorer -I/mnt/i/pico/pico-sdk/src/common/pico_stdlib/include -I/mnt/i/pico/pico-sdk/src/rp2_common/hardware_gpio/include -I/mnt/i/pico/pico-sdk/src/common/pico_base/include -I/mnt/i/pico/rtc_psk_win2/build/generated/pico_base -I/mnt/i/pico/pico-sdk/src/boards/include -I/mnt/i/pico/pico-sdk/src/rp2_common/pico_platform/include -I/mnt/i/pico/pico-sdk/src/rp2040/hardware_regs/include -I/mnt/i/pico/pico-sdk/src/rp2_common/hardware_base/include -I/mnt/i/pico/pico-sdk/src/rp2040/hardware_structs/include -I/mnt/i/pico/pico-sdk/src/rp2_common/hardware_claim/include -I/mnt/i/pico/pico-sdk/src/rp2_common/hardware_sync/include -I/mnt/i/pico/pico-sdk/src/rp2_common/hardware_uart/include -I/mnt/i/pico/pico-sdk/src/rp2_common/hardware_divider/include -I/mnt/i/pico/pico-sdk/src/common/pico_time/include -I/mnt/i/pico/pico-sdk/src/rp2_common/hardware_timer/include -I/mnt/i/pico/pico-sdk/src/common/pico_sync/include -I/mnt/i/pico/pico-sdk/src/common/pico_util/include -I/mnt/i/pico/pico-sdk/src/rp2_common/pico_runtime/include -I/mnt/i/pico/pico-sdk/src/rp2_common/hardware_clocks/include -I/mnt/i/pico/pico-sdk/src/rp2_common/hardware_resets/include -I/mnt/i/pico/pico-sdk/src/rp2_common/hardware_watchdog/include -I/mnt/i/pico/pico-sdk/src/rp2_common/hardware_xosc/include -I/mnt/i/pico/pico-sdk/src/rp2_common/hardware_pll/include -I/mnt/i/pico/pico-sdk/src/rp2_common/hardware_vreg/include -I/mnt/i/pico/pico-sdk/src/rp2_common/hardware_irq/include -I/mnt/i/pico/pico-sdk/src/rp2_common/pico_printf/include -I/mnt/i/pico/pico-sdk/src/rp2_common/pico_bootrom/include -I/mnt/i/pico/pico-sdk/src/common/pico_bit_ops/include -I/mnt/i/pico/pico-sdk/src/common/pico_divider/include -I/mnt/i/pico/pico-sdk/src/rp2_common/pico_double/include -I/mnt/i/pico/pico-sdk/src/rp2_common/pico_int64_ops/include -I/mnt/i/pico/pico-sdk/src/rp2_common/pico_float/include -I/mnt/i/pico/pico-sdk/src/rp2_common/pico_malloc/include -I/mnt/i/pico/pico-sdk/src/rp2_common/boot_stage2/include -I/mnt/i/pico/pico-sdk/src/common/pico_binary_info/include -I/mnt/i/pico/pico-sdk/src/rp2_common/pico_stdio/include -I/mnt/i/pico/pico-sdk/src/rp2_common/pico_stdio_uart/include -I/mnt/i/pico/pico-sdk/src/rp2_common/pico_stdio_usb/include -I/mnt/i/pico/pico-sdk/lib/tinyusb/src -I/mnt/i/pico/pico-sdk/lib/tinyusb/src/common -I/mnt/i/pico/pico-sdk/lib/tinyusb/hw -I/mnt/i/pico/pico-sdk/src/rp2_common/pico_fix/rp2040_usb_device_enumeration/include -I/mnt/i/pico/pico-sdk/src/rp2_common/hardware_pwm/include -I/mnt/i/pico/pico-sdk/src/rp2_common/hardware_adc/include -I/mnt/i/pico/rtc_psk_win2/src_v2/st7789 -I/mnt/i/pico/pico-sdk/src/rp2_common/hardware_spi/include -I/mnt/i/pico/pico-sdk/src/rp2_common/hardware_dma/include -I/mnt/i/pico/rtc_psk_win2/src_v2/pico_graphics -I/mnt/i/pico/rtc_psk_win2/src_v2/rv3028 -I/mnt/i/pico/pico-sdk/src/rp2_common/hardware_i2c/include 

C_FLAGS = -mcpu=cortex-m0plus -mthumb -O3 -DNDEBUG   -ffunction-sections -fdata-sections -std=gnu11

C_DEFINES = -DCFG_TUSB_DEBUG=0 -DCFG_TUSB_MCU=OPT_MCU_RP2040 -DCFG_TUSB_OS=OPT_OS_PICO -DPICO_BIT_OPS_PICO=1 -DPICO_BOARD=\"pico\" -DPICO_BUILD=1 -DPICO_CMAKE_BUILD_TYPE=\"Release\" -DPICO_COPY_TO_RAM=0 -DPICO_CXX_ENABLE_EXCEPTIONS=0 -DPICO_DIVIDER_HARDWARE=1 -DPICO_DOUBLE_PICO=1 -DPICO_FLOAT_PICO=1 -DPICO_INT64_OPS_PICO=1 -DPICO_MEM_OPS_PICO=1 -DPICO_NO_FLASH=0 -DPICO_NO_HARDWARE=0 -DPICO_ON_DEVICE=1 -DPICO_PRINTF_PICO=1 -DPICO_STDIO_UART=1 -DPICO_STDIO_USB=1 -DPICO_TARGET_NAME=\"app_v2\" -DPICO_USE_BLOCKED_RAM=0

C_INCLUDES = -I/mnt/i/pico/rtc_psk_win2/src_v2/app_v2 -I/mnt/i/pico/rtc_psk_win2/src_v2/pico_explorer -I/mnt/i/pico/pico-sdk/src/common/pico_stdlib/include -I/mnt/i/pico/pico-sdk/src/rp2_common/hardware_gpio/include -I/mnt/i/pico/pico-sdk/src/common/pico_base/include -I/mnt/i/pico/rtc_psk_win2/build/generated/pico_base -I/mnt/i/pico/pico-sdk/src/boards/include -I/mnt/i/pico/pico-sdk/src/rp2_common/pico_platform/include -I/mnt/i/pico/pico-sdk/src/rp2040/hardware_regs/include -I/mnt/i/pico/pico-sdk/src/rp2_common/hardware_base/include -I/mnt/i/pico/pico-sdk/src/rp2040/hardware_structs/include -I/mnt/i/pico/pico-sdk/src/rp2_common/hardware_claim/include -I/mnt/i/pico/pico-sdk/src/rp2_common/hardware_sync/include -I/mnt/i/pico/pico-sdk/src/rp2_common/hardware_uart/include -I/mnt/i/pico/pico-sdk/src/rp2_common/hardware_divider/include -I/mnt/i/pico/pico-sdk/src/common/pico_time/include -I/mnt/i/pico/pico-sdk/src/rp2_common/hardware_timer/include -I/mnt/i/pico/pico-sdk/src/common/pico_sync/include -I/mnt/i/pico/pico-sdk/src/common/pico_util/include -I/mnt/i/pico/pico-sdk/src/rp2_common/pico_runtime/include -I/mnt/i/pico/pico-sdk/src/rp2_common/hardware_clocks/include -I/mnt/i/pico/pico-sdk/src/rp2_common/hardware_resets/include -I/mnt/i/pico/pico-sdk/src/rp2_common/hardware_watchdog/include -I/mnt/i/pico/pico-sdk/src/rp2_common/hardware_xosc/include -I/mnt/i/pico/pico-sdk/src/rp2_common/hardware_pll/include -I/mnt/i/pico/pico-sdk/src/rp2_common/hardware_vreg/include -I/mnt/i/pico/pico-sdk/src/rp2_common/hardware_irq/include -I/mnt/i/pico/pico-sdk/src/rp2_common/pico_printf/include -I/mnt/i/pico/pico-sdk/src/rp2_common/pico_bootrom/include -I/mnt/i/pico/pico-sdk/src/common/pico_bit_ops/include -I/mnt/i/pico/pico-sdk/src/common/pico_divider/include -I/mnt/i/pico/pico-sdk/src/rp2_common/pico_double/include -I/mnt/i/pico/pico-sdk/src/rp2_common/pico_int64_ops/include -I/mnt/i/pico/pico-sdk/src/rp2_common/pico_float/include -I/mnt/i/pico/pico-sdk/src/rp2_common/pico_malloc/include -I/mnt/i/pico/pico-sdk/src/rp2_common/boot_stage2/include -I/mnt/i/pico/pico-sdk/src/common/pico_binary_info/include -I/mnt/i/pico/pico-sdk/src/rp2_common/pico_stdio/include -I/mnt/i/pico/pico-sdk/src/rp2_common/pico_stdio_uart/include -I/mnt/i/pico/pico-sdk/src/rp2_common/pico_stdio_usb/include -I/mnt/i/pico/pico-sdk/lib/tinyusb/src -I/mnt/i/pico/pico-sdk/lib/tinyusb/src/common -I/mnt/i/pico/pico-sdk/lib/tinyusb/hw -I/mnt/i/pico/pico-sdk/src/rp2_common/pico_fix/rp2040_usb_device_enumeration/include -I/mnt/i/pico/pico-sdk/src/rp2_common/hardware_pwm/include -I/mnt/i/pico/pico-sdk/src/rp2_common/hardware_adc/include -I/mnt/i/pico/rtc_psk_win2/src_v2/st7789 -I/mnt/i/pico/pico-sdk/src/rp2_common/hardware_spi/include -I/mnt/i/pico/pico-sdk/src/rp2_common/hardware_dma/include -I/mnt/i/pico/rtc_psk_win2/src_v2/pico_graphics -I/mnt/i/pico/rtc_psk_win2/src_v2/rv3028 -I/mnt/i/pico/pico-sdk/src/rp2_common/hardware_i2c/include 

CXX_FLAGS = -mcpu=cortex-m0plus -mthumb -O3 -DNDEBUG   -ffunction-sections -fdata-sections -fno-exceptions -fno-unwind-tables -fno-rtti -fno-use-cxa-atexit -std=c++17

CXX_DEFINES = -DCFG_TUSB_DEBUG=0 -DCFG_TUSB_MCU=OPT_MCU_RP2040 -DCFG_TUSB_OS=OPT_OS_PICO -DPICO_BIT_OPS_PICO=1 -DPICO_BOARD=\"pico\" -DPICO_BUILD=1 -DPICO_CMAKE_BUILD_TYPE=\"Release\" -DPICO_COPY_TO_RAM=0 -DPICO_CXX_ENABLE_EXCEPTIONS=0 -DPICO_DIVIDER_HARDWARE=1 -DPICO_DOUBLE_PICO=1 -DPICO_FLOAT_PICO=1 -DPICO_INT64_OPS_PICO=1 -DPICO_MEM_OPS_PICO=1 -DPICO_NO_FLASH=0 -DPICO_NO_HARDWARE=0 -DPICO_ON_DEVICE=1 -DPICO_PRINTF_PICO=1 -DPICO_STDIO_UART=1 -DPICO_STDIO_USB=1 -DPICO_TARGET_NAME=\"app_v2\" -DPICO_USE_BLOCKED_RAM=0

CXX_INCLUDES = -I/mnt/i/pico/rtc_psk_win2/src_v2/app_v2 -I/mnt/i/pico/rtc_psk_win2/src_v2/pico_explorer -I/mnt/i/pico/pico-sdk/src/common/pico_stdlib/include -I/mnt/i/pico/pico-sdk/src/rp2_common/hardware_gpio/include -I/mnt/i/pico/pico-sdk/src/common/pico_base/include -I/mnt/i/pico/rtc_psk_win2/build/generated/pico_base -I/mnt/i/pico/pico-sdk/src/boards/include -I/mnt/i/pico/pico-sdk/src/rp2_common/pico_platform/include -I/mnt/i/pico/pico-sdk/src/rp2040/hardware_regs/include -I/mnt/i/pico/pico-sdk/src/rp2_common/hardware_base/include -I/mnt/i/pico/pico-sdk/src/rp2040/hardware_structs/include -I/mnt/i/pico/pico-sdk/src/rp2_common/hardware_claim/include -I/mnt/i/pico/pico-sdk/src/rp2_common/hardware_sync/include -I/mnt/i/pico/pico-sdk/src/rp2_common/hardware_uart/include -I/mnt/i/pico/pico-sdk/src/rp2_common/hardware_divider/include -I/mnt/i/pico/pico-sdk/src/common/pico_time/include -I/mnt/i/pico/pico-sdk/src/rp2_common/hardware_timer/include -I/mnt/i/pico/pico-sdk/src/common/pico_sync/include -I/mnt/i/pico/pico-sdk/src/common/pico_util/include -I/mnt/i/pico/pico-sdk/src/rp2_common/pico_runtime/include -I/mnt/i/pico/pico-sdk/src/rp2_common/hardware_clocks/include -I/mnt/i/pico/pico-sdk/src/rp2_common/hardware_resets/include -I/mnt/i/pico/pico-sdk/src/rp2_common/hardware_watchdog/include -I/mnt/i/pico/pico-sdk/src/rp2_common/hardware_xosc/include -I/mnt/i/pico/pico-sdk/src/rp2_common/hardware_pll/include -I/mnt/i/pico/pico-sdk/src/rp2_common/hardware_vreg/include -I/mnt/i/pico/pico-sdk/src/rp2_common/hardware_irq/include -I/mnt/i/pico/pico-sdk/src/rp2_common/pico_printf/include -I/mnt/i/pico/pico-sdk/src/rp2_common/pico_bootrom/include -I/mnt/i/pico/pico-sdk/src/common/pico_bit_ops/include -I/mnt/i/pico/pico-sdk/src/common/pico_divider/include -I/mnt/i/pico/pico-sdk/src/rp2_common/pico_double/include -I/mnt/i/pico/pico-sdk/src/rp2_common/pico_int64_ops/include -I/mnt/i/pico/pico-sdk/src/rp2_common/pico_float/include -I/mnt/i/pico/pico-sdk/src/rp2_common/pico_malloc/include -I/mnt/i/pico/pico-sdk/src/rp2_common/boot_stage2/include -I/mnt/i/pico/pico-sdk/src/common/pico_binary_info/include -I/mnt/i/pico/pico-sdk/src/rp2_common/pico_stdio/include -I/mnt/i/pico/pico-sdk/src/rp2_common/pico_stdio_uart/include -I/mnt/i/pico/pico-sdk/src/rp2_common/pico_stdio_usb/include -I/mnt/i/pico/pico-sdk/lib/tinyusb/src -I/mnt/i/pico/pico-sdk/lib/tinyusb/src/common -I/mnt/i/pico/pico-sdk/lib/tinyusb/hw -I/mnt/i/pico/pico-sdk/src/rp2_common/pico_fix/rp2040_usb_device_enumeration/include -I/mnt/i/pico/pico-sdk/src/rp2_common/hardware_pwm/include -I/mnt/i/pico/pico-sdk/src/rp2_common/hardware_adc/include -I/mnt/i/pico/rtc_psk_win2/src_v2/st7789 -I/mnt/i/pico/pico-sdk/src/rp2_common/hardware_spi/include -I/mnt/i/pico/pico-sdk/src/rp2_common/hardware_dma/include -I/mnt/i/pico/rtc_psk_win2/src_v2/pico_graphics -I/mnt/i/pico/rtc_psk_win2/src_v2/rv3028 -I/mnt/i/pico/pico-sdk/src/rp2_common/hardware_i2c/include 

