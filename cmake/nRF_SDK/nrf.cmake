set(C_CLANG_TIDY "")
set(CXX_CLANG_TIDY "")

add_library(CMSIS_Freestanding INTERFACE)
target_include_directories(CMSIS_Freestanding SYSTEM INTERFACE ${CMAKE_HOME_DIRECTORY}/lib/CMSIS_5/CMSIS/Core/Include)

set(nRF5_SDK_ROOT ${CMAKE_HOME_DIRECTORY}/lib/nRF5-SDK)
set(clLogDir ${nRF5_SDK_ROOT}/components/libraries/log)
set(cBoardsDir ${nRF5_SDK_ROOT}/components/boards)
set(eFreertosDir ${nRF5_SDK_ROOT}/external/freertos)
set(clButtonDir ${nRF5_SDK_ROOT}/components/libraries/button)
set(clUtilDir ${nRF5_SDK_ROOT}/components/libraries/util)
set(clTimerDir ${nRF5_SDK_ROOT}/components/libraries/timer)
set(clAtomicDir ${nRF5_SDK_ROOT}/components/libraries/atomic)
set(clBallocDir ${nRF5_SDK_ROOT}/components/libraries/balloc)
set(eFprintfDir ${nRF5_SDK_ROOT}/external/fprintf)
set(clMemobjDir ${nRF5_SDK_ROOT}/components/libraries/memobj)
set(clRingbufDir ${nRF5_SDK_ROOT}/components/libraries/ringbuf)
set(clStrerrorDir ${nRF5_SDK_ROOT}/components/libraries/strerror)
set(iNrfxDir ${nRF5_SDK_ROOT}/integration/nrfx)
set(cd_nNrfSocNosdDir ${nRF5_SDK_ROOT}/components/drivers_nrf/nrf_soc_nosd)
set(mNrfxDir ${nRF5_SDK_ROOT}/modules/nrfx)
set(clBspDir ${nRF5_SDK_ROOT}/components/libraries/bsp)

set(FreeRTOS_ROOT ${CMAKE_HOME_DIRECTORY}/lib/FreeRTOS-Kernel)

#add_library(nRF_SES_BLOB OBJECT) 
add_library(nRF_SES_BLOB STATIC)
target_sources(
  nRF_SES_BLOB
  PUBLIC ${clLogDir}/src/nrf_log_frontend.c
         ${clLogDir}/src/nrf_log_str_formatter.c
         ${cBoardsDir}/boards.c
         ${FreeRTOS_ROOT}/croutine.c
         ${FreeRTOS_ROOT}/event_groups.c
         ${FreeRTOS_ROOT}/list.c
         ${FreeRTOS_ROOT}/queue.c
         ${FreeRTOS_ROOT}/stream_buffer.c
         ${FreeRTOS_ROOT}/tasks.c
         ${FreeRTOS_ROOT}/timers.c
         ${FreeRTOS_ROOT}/portable/MemMang/heap_1.c
         ${eFreertosDir}/portable/CMSIS/nrf52/port_cmsis.c
         ${eFreertosDir}/portable/CMSIS/nrf52/port_cmsis_systick.c
         ${eFreertosDir}/portable/GCC/nrf52/port.c
         ${clButtonDir}/app_button.c
         ${clUtilDir}/app_error.c
         ${clUtilDir}/app_error_handler_gcc.c
         ${clUtilDir}/app_error_weak.c
         ${clTimerDir}/app_timer_freertos.c
         ${clUtilDir}/app_util_platform.c
         ${clUtilDir}/nrf_assert.c
         ${clAtomicDir}/nrf_atomic.c
         ${clBallocDir}/nrf_balloc.c
         ${eFprintfDir}/nrf_fprintf.c
         ${eFprintfDir}/nrf_fprintf_format.c
         ${clRingbufDir}/nrf_ringbuf.c
         ${clStrerrorDir}/nrf_strerror.c
         ${iNrfxDir}/legacy/nrf_drv_clock.c
         ${cd_nNrfSocNosdDir}/nrf_nvic.c
         ${cd_nNrfSocNosdDir}/nrf_soc.c
         ${mNrfxDir}/soc/nrfx_atomic.c
         ${mNrfxDir}/drivers/src/nrfx_clock.c
         ${mNrfxDir}/drivers/src/nrfx_gpiote.c
         ${clBspDir}/bsp.c
         ${mNrfxDir}/mdk/system_nrf52840.c)

target_include_directories(
  nRF_SES_BLOB
  SYSTEM
  PUBLIC ${clLogDir}
         ${clLogDir}/src
         ${cBoardsDir}
         ${FreeRTOS_ROOT}/include
         ${eFreertosDir}/portable/GCC/nrf52
         ${eFreertosDir}/portable/CMSIS/nrf52
         ${clButtonDir}
         ${clUtilDir}
         ${clTimerDir}
         ${clAtomicDir}
         ${clBallocDir}
         ${eFprintfDir}
         ${clMemobjDir}
         ${clRingbufDir}
         ${clStrerrorDir}
         ${iNrfxDir}
         ${iNrfxDir}/legacy
         ${cd_nNrfSocNosdDir}
         ${mNrfxDir}
         ${mNrfxDir}/drivers/include
         ${mNrfxDir}/hal
         ${mNrfxDir}/mdk
         ${clBspDir}
         ${nRF5_SDK_ROOT}/components/libraries/experimental_section_vars)

target_compile_definitions(
  nRF_SES_BLOB
  PUBLIC BOARD_PCA10056
         CONFIG_GPIO_AS_PINRESET
         FLOAT_ABI_HARD
         FREERTOS
         INITIALIZE_USER_SECTIONS
         NO_VTOR_CONFIG
         NRF52840_XXAA
         portDONT_DISCARD=__attribute__\(\(used\)\)
         $<$<CONFIG:Debug>:DEBUG
         DEBUG_NRF>)

target_link_options(
  nRF_SES_BLOB
  INTERFACE
  -D__STARTUP_CONFIG
  -I${CMAKE_HOME_DIRECTORY}/src/config
  ${mNrfxDir}/mdk/gcc_startup_nrf52840.S
  -L${mNrfxDir}/mdk
  -Tnrf52840_xxaa.ld
  -Wl,-eReset_Handler)

add_library(nRF_SDK_mods INTERFACE)
target_include_directories(nRF_SDK_mods INTERFACE ${CMAKE_HOME_DIRECTORY}/src/config)

target_link_libraries(nRF_SES_BLOB PUBLIC nRF_SDK_mods CMSIS_Freestanding)
