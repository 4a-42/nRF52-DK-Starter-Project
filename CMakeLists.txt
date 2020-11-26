cmake_minimum_required(VERSION 3.17)

project(
  nRF52_Starter_Project
  VERSION 0
  LANGUAGES C CXX)
include(cmake/StandardProjectSettings.cmake)

include(CMakePrintHelpers)

# enable doxygen
include(cmake/Doxygen.cmake)
enable_doxygen()

# allow for static analysis options
include(cmake/StaticAnalyzers.cmake)

# sdk stuff
include(cmake/nRF_SDK/nrf.cmake)

include(src/CMakeLists.txt)
