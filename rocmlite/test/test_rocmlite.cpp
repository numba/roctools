#include "rocmlite.hh"
#include "gtest/gtest.h"

#define TEST_BASE C_Linkage

// Check initializer and finalizer work as expected.
// (essentially a leak check)
TEST(TEST_BASE, Initialization)
{
    for (int i = 0 ; i < 4; i++)
    {
        HLC_Initialize();
        HLC_Finalize();
    }
}

