cmake_minimum_required(VERSION 3.16)
project(qml-colorpicker)

#
# Set CMake Options
# 
OPTION(BUILD_WITH_CPP_TEST "Build with C++ test" ON)

if(WIN32 OR APPLE)
  set(CMAKE_CONFIGURATION_TYPES "Debug;Release;RelWithDebInfo")
endif(WIN32 OR APPLE)

#
# Definitions
#

#
# Sub Directories
#
if(${BUILD_WITH_CPP_TEST})
  add_subdirectory(test)
endif(${BUILD_WITH_CPP_TEST})
