#
# Copyright (c) 2016 , Continuum Analytics, Inc.
# All rights reserved.
#

set(LIBROCMLITE_SOURCES rocmlite.cpp)

add_library(
            rocmlite
            SHARED
            ${LIBROCMLITE_SOURCES}
            )

# llvm components needed (will get mapped to libs for linking)
# See `llvm-config --components` for a list of available components.
llvm_map_components_to_libnames(
llvm_libs # this name is magic, it is the variable in which the
          # component linker info is stored.
#all
amdgpuasmparser
amdgpuasmprinter
amdgpucodegen
amdgpudesc
amdgpudisassembler
amdgpuinfo
amdgpuutils
coroutines
objcarcopts
native
core
)


#Link against LLVM libraries
target_link_libraries(rocmlite ${llvm_libs})

# include include/
target_include_directories(rocmlite PUBLIC ${CMAKE_SOURCE_DIR}/include)


# set library properties
set_target_properties(rocmlite PROPERTIES
                     VERSION   ${librocmlite_VERSION}
                     SOVERSION ${librocmlite_SOVERSION})


# Add in test dir
add_subdirectory(test)

