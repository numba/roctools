#
# Copyright (c) 2016 , Continuum Analytics, Inc.
# All rights reserved.
#

# Add a gtest with and the same running with valgrind
macro(add_gtest TESTNAME)
    add_executable(${TESTNAME} ${TESTNAME}.cpp)
    # set link dir
    link_directories(${librocmlite_BINARY_DIR})
    # include include/
    target_include_directories(${TESTNAME} PUBLIC ${CMAKE_SOURCE_DIR}/include ${BIN_INCLUDE_DIR})

    # set linkage
    target_link_libraries(${TESTNAME}
                         rocmlite
                         gtest
                         gtest_main
                         pthread
                         )

    get_target_property(TEST_LOCATION ${TESTNAME} LOCATION)
    add_test(${TESTNAME} ${TEST_LOCATION})
    add_test(${TESTNAME}_with_valgrind
         valgrind --error-exitcode=1 --leak-check=full --show-leak-kinds=all
         --suppressions=test_suppressions.supp
         ${TEST_LOCATION})
endmacro()

set(TESTS
    test_rocmlite
    test_rocmlite_functions
    )

foreach(TEST ${TESTS})
    add_gtest(${TEST})
endforeach()

add_custom_target(COPY_IN_COMPILATION_RESOURCES ALL
                 COMMAND cmake -E copy_directory
                 ${BITCODE_ROOT}
                 ${CMAKE_BINARY_DIR}/rocmlite/test/
                 DEPENDS ${gtest})

add_custom_target(COPY_IN_TEST_RESOURCES ALL
                 COMMAND cmake -E copy_directory
                 ${CMAKE_SOURCE_DIR}/rocmlite/test/resources
                 ${CMAKE_BINARY_DIR}/rocmlite/test/
                 DEPENDS ${gtest})

