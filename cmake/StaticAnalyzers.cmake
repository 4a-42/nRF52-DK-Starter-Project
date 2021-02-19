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
  find_program(CLANGTIDY clang-tidy DOC "Path to clang-tidy executable")
  if(CLANGTIDY)
    get_filename_component(C_COMPILER_DIR ${CMAKE_C_COMPILER} DIRECTORY)
    set(C_STD_LIB_INCLUDE_PATH ${C_COMPILER_DIR}/../arm-none-eabi/include)
    set(CMAKE_C_CLANG_TIDY
        ${CLANGTIDY} -extra-arg=-Wno-unknown-warning-option --extra-arg=--target=armv7em-none-eabi
        --extra-arg=-fgnuc-version=9
        --extra-arg=-isystem${C_STD_LIB_INCLUDE_PATH} 
        --extra-arg=-U_MSC_VER
        --extra-arg=-U_MSC_FULL_VER)
    set(CMAKE_CXX_CLANG_TIDY
        ${CLANGTIDY} -extra-arg=-Wno-unknown-warning-option --extra-arg=--target=armv7em-none-eabi
        --extra-arg=-fgnuc-version=9
        --extra-arg=-isystem${C_STD_LIB_INCLUDE_PATH} 
        --extra-arg=-U_MSC_VER
        --extra-arg=-U_MSC_FULL_VER)
  else()
    message(SEND_ERROR "clang-tidy requested but executable not found")
  endif()
endif()

if(ENABLE_INCLUDE_WHAT_YOU_USE)
  find_program(INCLUDE_WHAT_YOU_USE include-what-you-use HINTS "$ENV{ProgramFiles\(x86\)}/include-what-you-use/bin")
  if(INCLUDE_WHAT_YOU_USE)
    set(CMAKE_C_INCLUDE_WHAT_YOU_USE ${INCLUDE_WHAT_YOU_USE})
    set(CMAKE_CXX_INCLUDE_WHAT_YOU_USE ${INCLUDE_WHAT_YOU_USE})
  else()
    message(SEND_ERROR "include-what-you-use requested but executable not found")
  endif()
endif()
