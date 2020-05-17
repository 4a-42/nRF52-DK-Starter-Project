add_executable(blinky.elf ${CMAKE_HOME_DIRECTORY}/src/main.c)
target_link_libraries(blinky.elf PRIVATE nRF_SES_BLOB)

add_custom_command(
  TARGET blinky.elf
  POST_BUILD
  COMMAND ${CMAKE_OBJCOPY} ARGS ${CMAKE_BINARY_DIR}/blinky.elf ${CMAKE_BINARY_DIR}/blinky.hex -Oihex)
