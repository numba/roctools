#
# Copyright (c) 2016 , Continuum Analytics, Inc.
# All rights reserved.
#

# Require cmake 2.8.12+
cmake_minimum_required (VERSION 2.8.12)

# Refuse to build on anything but linux
if(APPLE OR WIN32)
    message(FATAL_ERROR "rocmlite can only be built on linux.")
endif(APPLE OR WIN32)

option(CMAKE_CONDA_ROOT "CMAKE_CONDA_ROOT" "")
set(CONDA_ROOT ${CMAKE_CONDA_ROOT})
message(STATUS "CONDA_ROOT = ${CONDA_ROOT}")

option(CMAKE_BITCODE_ROOT "CMAKE_BITCODE_ROOT" "")
set(BITCODE_ROOT ${CMAKE_BITCODE_ROOT})
message(STATUS "BITCODE_ROOT = ${BITCODE_ROOT}")


# project name
project (rocmlite)


# The version number
set (librocmlite_VERSION_MAJOR 0)
set (librocmlite_VERSION_MINOR 1)
set (librocmlite_VERSION ${librocmlite_VERSION_MAJOR}.${librocmlite_VERSION_MINOR})
set (librocmlite_SOVERSION 0.1.0) # the .soversion of the shared lib.

enable_language(CXX)


# CMAKE 3.1.0+ has CXX_STANDARD etc, not present by default on older linux
# just check the flag is supported (most likely gcc).
include(CheckCXXCompilerFlag)
CHECK_CXX_COMPILER_FLAG(-std=c++11 CXX_HAS_CXX11)
if(CXX_HAS_CXX11)
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -g -fno-rtti -Wall -std=c++11")
else()
    message(FATAL_ERROR "Compiler must support C++11")
endif()

find_package(LLVM REQUIRED CONFIG)

if(LLVM_PACKAGE_VERSION VERSION_LESS 6.0)
    message(FATAL_ERROR "llvm version must be 6.0+")
endif()

message(STATUS "Found LLVM version: ${LLVM_PACKAGE_VERSION}")
message(STATUS "Using LLVMConfig.cmake found in: ${LLVM_DIR}")

include_directories(${LLVM_INCLUDE_DIRS})
add_definitions(${LLVM_DEFINITIONS})

# conda root
link_directories( "${CONDA_ROOT}/lib" )

# turn on testing
enable_testing()

# rocmlite code
add_subdirectory(rocmlite)

message(
"
------------------------------------
|           Build Summary          |
------------------------------------
Building...........: ${CMAKE_PROJECT_NAME} version ${libHLC_VERSION}
LLVM version.......: ${LLVM_PACKAGE_VERSION}
LLVM location......: ${LLVM_DIR}
C++ Compiler.......: ${CMAKE_CXX_COMPILER}
C++ Flags..........: ${CMAKE_CXX_FLAGS}
")
