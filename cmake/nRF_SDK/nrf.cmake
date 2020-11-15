# add_library(ctCmsis INTERFACE)

# target_include_directories(ctCmsis SYSTEM INTERFACE
# ${CMAKE_HOME_DIRECTORY}/lib/nRF5-SDK/components/toolchain/cmsis/include)

# # ./external/freertos set(eFreertosDir ${CMAKE_HOME_DIRECTORY}/lib/nRF5-SDK/external/freertos)

# add_library( eFreertos STATIC ${eFreertosDir}/portable/CMSIS/nrf52/portmacro_cmsis.h
# ${eFreertosDir}/portable/CMSIS/nrf52/port_cmsis.c ${eFreertosDir}/portable/CMSIS/nrf52/port_cmsis_systick.c
# ${eFreertosDir}/portable/GCC/nrf52/port.c ${eFreertosDir}/portable/GCC/nrf52/portmacro.h
# ${eFreertosDir}/source/croutine.c ${eFreertosDir}/source/event_groups.c ${eFreertosDir}/source/list.c
# ${eFreertosDir}/source/queue.c ${eFreertosDir}/source/stream_buffer.c ${eFreertosDir}/source/tasks.c
# ${eFreertosDir}/source/timers.c ${eFreertosDir}/source/include/croutine.h
# ${eFreertosDir}/source/include/deprecated_definitions.h ${eFreertosDir}/source/include/event_groups.h
# ${eFreertosDir}/source/include/FreeRTOS.h ${eFreertosDir}/source/include/list.h
# ${eFreertosDir}/source/include/message_buffer.h ${eFreertosDir}/source/include/mpu_prototypes.h
# ${eFreertosDir}/source/include/mpu_wrappers.h ${eFreertosDir}/source/include/portable.h
# ${eFreertosDir}/source/include/projdefs.h ${eFreertosDir}/source/include/queue.h
# ${eFreertosDir}/source/include/semphr.h ${eFreertosDir}/source/include/StackMacros.h
# ${eFreertosDir}/source/include/stack_macros.h ${eFreertosDir}/source/include/stream_buffer.h
# ${eFreertosDir}/source/include/task.h ${eFreertosDir}/source/include/timers.h
# ${eFreertosDir}/source/portable/Common/mpu_wrappers.c ${eFreertosDir}/source/portable/MemMang/heap_1.c
# ${eFreertosDir}/source/portable/MemMang/heap_2.c ${eFreertosDir}/source/portable/MemMang/heap_3.c
# ${eFreertosDir}/source/portable/MemMang/heap_4.c ${eFreertosDir}/source/portable/MemMang/heap_5.c # config
# ${CMAKE_HOME_DIRECTORY}/src/config/FreeRTOSConfig.h)

# target_include_directories( eFreertos PUBLIC ${eFreertosDir}/portable/CMSIS/nrf52 ${eFreertosDir}/portable/GCC/nrf52
# ${eFreertosDir}/source/include PRIVATE ${CMAKE_HOME_DIRECTORY}/src/config)

# target_compile_definitions(eFreertos INTERFACE FREERTOS)

# # ./components/libraries/util/ set(clUtilDir ${CMAKE_HOME_DIRECTORY}/lib/nRF5-SDK/components/libraries/util)

# add_library( clUtil STATIC ${clUtilDir}/app_error.c ${clUtilDir}/app_error.h ${clUtilDir}/app_error_handler_gcc.c
# ${clUtilDir}/app_error_handler_iar.c ${clUtilDir}/app_error_handler_keil.c ${clUtilDir}/app_error_weak.c
# ${clUtilDir}/app_error_weak.h ${clUtilDir}/app_util.h ${clUtilDir}/app_util_bds.h ${clUtilDir}/app_util_platform.c
# ${clUtilDir}/app_util_platform.h ${clUtilDir}/nordic_common.h ${clUtilDir}/nrf_assert.c ${clUtilDir}/nrf_assert.h
# ${clUtilDir}/nrf_bitmask.h ${clUtilDir}/sdk_alloca.h ${clUtilDir}/sdk_common.h ${clUtilDir}/sdk_errors.h
# ${clUtilDir}/sdk_macros.h ${clUtilDir}/sdk_mapped_flags.c ${clUtilDir}/sdk_mapped_flags.h ${clUtilDir}/sdk_os.h
# ${clUtilDir}/sdk_resources.h)

# target_include_directories(clUtil PUBLIC ${clUtilDir})

# target_link_libraries(eFreertos PUBLIC ctCmsis clUtil)

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

add_library(nRF_SES_BLOB STATIC)
target_sources(
  nRF_SES_BLOB
  PUBLIC ${clLogDir}/src/nrf_log_frontend.c
         ${clLogDir}/src/nrf_log_str_formatter.c
         ${cBoardsDir}/boards.c
         ${eFreertosDir}/source/croutine.c
         ${eFreertosDir}/source/event_groups.c
         ${eFreertosDir}/source/list.c
         ${eFreertosDir}/source/queue.c
         ${eFreertosDir}/source/stream_buffer.c
         ${eFreertosDir}/source/tasks.c
         ${eFreertosDir}/source/timers.c
         ${eFreertosDir}/source/portable/MemMang/heap_1.c
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
  PUBLIC ${clLogDir}
         ${clLogDir}/src
         ${cBoardsDir}
         ${eFreertosDir}/source/include
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
         $<$<CONFIG:Debug>:DEBUG
         DEBUG_NRF>)

target_link_options(
  nRF_SES_BLOB
  INTERFACE
  -D__STARTUP_CONFIG
  -I${CMAKE_HOME_DIRECTORY}/src/config
  ${mNrfxDir}/mdk/gcc_startup_nrf52840.S
  -L${mNrfxDir}/mdk
  -Tnrf52840_xxaa.ld)

add_library(nRF_SDK_mods INTERFACE)
target_include_directories(nRF_SDK_mods INTERFACE ${CMAKE_HOME_DIRECTORY}/src/config)

target_link_libraries(nRF_SES_BLOB PUBLIC nRF_SDK_mods CMSIS_Freestanding)
