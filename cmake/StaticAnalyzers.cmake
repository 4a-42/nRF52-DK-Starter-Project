option(ENABLE_CPPCHECK "Enable static analysis with cppcheck" OFF)
option(ENABLE_CLANG_TIDY "Enable static analysis with clang-tidy" OFF)
option(ENABLE_INCLUDE_WHAT_YOU_USE "Enable static analysis with include-what-you-use" OFF)

if(ENABLE_CPPCHECK)
  find_program(CPPCHECK cppcheck)
  if(CPPCHECK)
    set(CMAKE_CXX_CPPCHECK ${CPPCHECK} --suppress=missingInclude --enable=all --inconclusive -i
                           ${CMAKE_SOURCE_DIR}/imgui/lib)
  else()
    message(SEND_ERROR "cppcheck requested but executable not found")
  endif()
endif()

if(ENABLE_CLANG_TIDY)
  find_program(CLANGTIDY clang-tidy)
  if(CLANGTIDY)
    set(CMAKE_C_CLANG_TIDY
        ${CLANGTIDY} -extra-arg=-Wno-unknown-warning-option --extra-arg=--target=armv7m-none-eabi
        --extra-arg=-isystemC:/PROGRA~2/GNUTOO~1/92019-~1/arm-none-eabi/include --extra-arg=-U_WIN32
        --extra-arg=-D__GNUC__)
    set(CMAKE_CXX_CLANG_TIDY
        ${CLANGTIDY} -extra-arg=-Wno-unknown-warning-option --extra-arg=--target=armv7m-none-eabi
        --extra-arg=-isystemC:/PROGRA~2/GNUTOO~1/92019-~1/arm-none-eabi/include --extra-arg=-U_WIN32
        --extra-arg=-D__GNUC__)
  else()
    message(SEND_ERROR "clang-tidy requested but executable not found")
  endif()
endif()

if(ENABLE_INCLUDE_WHAT_YOU_USE)
  find_program(INCLUDE_WHAT_YOU_USE include-what-you-use)
  if(INCLUDE_WHAT_YOU_USE)
    set(CMAKE_CXX_INCLUDE_WHAT_YOU_USE ${INCLUDE_WHAT_YOU_USE})
  else()
    message(SEND_ERROR "include-what-you-use requested but executable not found")
  endif()
endif()
