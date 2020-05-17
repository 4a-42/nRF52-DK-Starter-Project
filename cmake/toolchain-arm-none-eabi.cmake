set(CMAKE_SYSTEM_NAME Generic)
set(CMAKE_SYSTEM_PROCESSOR ARM)

find_program(CMAKE_C_COMPILER arm-none-eabi-gcc
             HINTS $ENV{PROGRAMFILES\(x86\)}/GNU\ Tools\ Arm\ Embedded/8\ 2019-q3-update/bin)
find_program(CMAKE_CXX_COMPILER arm-none-eabi-g++
             HINTS $ENV{PROGRAMFILES\(x86\)}/GNU\ Tools\ Arm\ Embedded/8\ 2019-q3-update/bin)

set(CMAKE_C_FLAGS_INIT
    "--specs=nosys.specs -mcpu=cortex-m4 -mlittle-endian -mfloat-abi=hard -mfpu=fpv4-sp-d16 -mthumb -mtp=soft -munaligned-access -fms-extensions"
)
set(CMAKE_CXX_FLAGS_INIT
    "--specs=nosys.specs -mcpu=cortex-m4 -mlittle-endian -mfloat-abi=hard -mfpu=fpv4-sp-d16 -mthumb -mtp=soft -munaligned-access -fms-extensions"
)
