set(CMAKE_SYSTEM_NAME Generic)
set(CMAKE_SYSTEM_PROCESSOR ARM)

find_program(CMAKE_C_COMPILER arm-none-eabi-gcc
            PATHS $ENV{PROGRAMFILES\(x86\)}/GNU\ Arm\ Embedded\ Toolchain/9\ 2020-q2-update/bin ~/gcc-arm-none-eabi-9-2020-q2-update/bin
            REQUIRED)
find_program(CMAKE_CXX_COMPILER arm-none-eabi-g++
            PATHS $ENV{PROGRAMFILES\(x86\)}/GNU\ Arm\ Embedded\ Toolchain/9\ 2020-q2-update/bin ~/gcc-arm-none-eabi-9-2020-q2-update/bin
            REQUIRED)

set(CMAKE_C_FLAGS_INIT
    "--specs=nosys.specs -mcpu=cortex-m4 -mlittle-endian -mfloat-abi=hard -mfpu=fpv4-sp-d16 -mthumb -mtp=soft -munaligned-access -gpubnames -fomit-frame-pointer -fno-dwarf2-cfi-asm -fno-builtin -ffunction-sections -fdata-sections -fshort-enums -fno-common"
)
set(CMAKE_CXX_FLAGS_INIT
    "--specs=nosys.specs -mcpu=cortex-m4 -mlittle-endian -mfloat-abi=hard -mfpu=fpv4-sp-d16 -mthumb -mtp=soft -munaligned-access -gpubnames -fomit-frame-pointer -fno-dwarf2-cfi-asm -fno-builtin -ffunction-sections -fdata-sections -fshort-enums -fno-common"
)
