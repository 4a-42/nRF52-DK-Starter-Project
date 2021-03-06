# Set a default build type if none was specified
if(NOT CMAKE_BUILD_TYPE AND NOT CMAKE_CONFIGURATION_TYPES)
  message(STATUS "Setting build type to 'Debug' as none was specified.")
  set(CMAKE_BUILD_TYPE
      Debug
      CACHE STRING "Choose the type of build." FORCE)
  # Set the possible values of build type for cmake-gui, ccmake
  set_property(CACHE CMAKE_BUILD_TYPE PROPERTY STRINGS "Debug" "Release" "RelWithDebInfo")
endif()

set(CMAKE_C_FLAGS_DEBUG
    "-g3"
    CACHE STRING "Flags used by the C compiler during DEBUG builds." FORCE)

set(CMAKE_CXX_FLAGS_DEBUG
    "-g3"
    CACHE STRING "Flags used by the CXX compiler during DEBUG builds." FORCE)

set(CMAKE_C_FLAGS_RELEASE
    "-Os -DNDEBUG"
    CACHE STRING "Flags used by the C compiler during RELEASE builds." FORCE)

set(CMAKE_CXX_FLAGS_RELEASE
    "-Os -DNDEBUG"
    CACHE STRING "Flags used by the CXX compiler during RELEASE builds." FORCE)


find_program(CCACHE ccache)
if(CCACHE)
  message("using ccache")
  set(CMAKE_C_COMPILER_LAUNCHER ${CCACHE})
  set(CMAKE_CXX_COMPILER_LAUNCHER ${CCACHE})
else()
  message("ccache not found cannot use")
endif()

option(ENABLE_IPO "Enable Interprocedural Optimization, aka Link Time Optimization (LTO)" OFF)

if(ENABLE_IPO)
  include(CheckIPOSupported)
  check_ipo_supported(
    RESULT
    result
    OUTPUT
    output
    LANGUAGES C CXX)
  if(result)
    set(CMAKE_INTERPROCEDURAL_OPTIMIZATION TRUE)
  else()
    message(SEND_ERROR "IPO is not supported: ${output}")
  endif()
endif()

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

set(C_VISIBILITY_PRESET hidden)
set(CXX_VISIBILITY_PRESET hidden)
set(CMAKE_VISIBILITY_INLINES_HIDDEN YES)
