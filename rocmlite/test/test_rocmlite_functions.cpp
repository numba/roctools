#include "rocmlite.hh"
#include "gtest/gtest.h"

#include <string>
#include <fstream>
#include <streambuf>
#include <exception>
#include <regex>

#define TEST_BASE C_Linkage_Functions

using namespace std;

// Helper functions
std::string read_ir_from_file(const char * filename)
{

    std::stringstream buf;
    std::ifstream f(filename, std::ios::out);
    if(f.is_open())
    {
        buf << f.rdbuf();
        f.close();
    }
    else
    {
        throw std::runtime_error("Could not open file.");
    }


    return buf.str();
}

std::string read_bc_from_file(const char * filename)
{

    std::stringstream buf;
    std::ifstream f(filename, std::ios::out | std::ios::binary);
    if(f.is_open())
    {
        buf << f.rdbuf();
        f.close();
    }
    else
    {
        throw std::runtime_error("Could not open file.");
    }

    return buf.str();
}

// the names of the bitcode files that need linking in
std::vector<std::string> _bitcodes = {       \
                                             "opencl.amdgcn.bc",                          \
                                             "ocml.amdgcn.bc",                            \
                                             "ockl.amdgcn.bc",                            \
                                             "oclc_correctly_rounded_sqrt_off.amdgcn.bc", \
                                             "oclc_daz_opt_off.amdgcn.bc",                \
                                             "oclc_finite_only_off.amdgcn.bc",            \
                                             "oclc_isa_version_803.amdgcn.bc",            \
                                             "oclc_unsafe_math_off.amdgcn.bc",            \
                                             "irif.amdgcn.bc"
                                     };


// Environment class to setup and teardown the LLVMContext.
// This is indicative of the use from python (calls to init to ensure the
// library is initialised and a single call to finalize when gc takes place).
class globalDSOLoadEnv: public ::testing::Environment
{
    public:
        virtual void SetUp()
        {
            HLC_Initialize();
        }
        virtual void TearDown()
        {
            HLC_Finalize();
        }
};

::testing::Environment* const global_env =
    ::testing::AddGlobalTestEnvironment(new globalDSOLoadEnv);

// Check string copy/destroy works
TEST(TEST_BASE, String_Manipulation)
{
    const char string_orig[] = "Use numba for AMD GPUs!";
    char * string_copy =  HLC_CreateString(string_orig);
    ASSERT_TRUE(string_copy != nullptr);
    ASSERT_STREQ(string_orig, string_copy);
    HLC_DisposeString(string_copy);
}

// Check the module IR parse works cleanly and can then be destroyed.
TEST(TEST_BASE, test_parse_ir_module)
{
    std::string ir = read_ir_from_file("demo_ir.ll");
    ModuleRef* theRef = HLC_ParseModule(ir.c_str());
    HLC_ModuleDestroy(theRef);
}

// Check the module BC parse works cleanly and can then be destroyed.
TEST(TEST_BASE, test_parse_bc_module)
{
    std::string bc = read_bc_from_file("opencl.amdgcn.bc");
    ModuleRef* theRef = HLC_ParseBitcode(bc.c_str(), bc.size());
    HLC_ModuleDestroy(theRef);
}

// Check link-in works
TEST(TEST_BASE, test_linkin_modules)
{
    std::string ir = read_ir_from_file("demo_ir.ll");
    ModuleRef* dst = HLC_ParseModule(ir.c_str());

    int ret;

    for (auto& bitcode : _bitcodes)
    {

        std::string builtins_bc = read_bc_from_file(bitcode.c_str());
        ModuleRef* bc_src = HLC_ParseBitcode(builtins_bc.c_str(),
                                             builtins_bc.size());

        // link the builtins into the module
        ret = HLC_ModuleLinkIn(dst, bc_src);
        EXPECT_TRUE(ret != 0);

        // pointlessly link in the same a few times, there was an subtle corruption
        // present in previous versions of the linkin function.
        for(int i = 0; i < 3; i++)
        {
            int ret = HLC_ModuleLinkIn(dst, bc_src);
            EXPECT_TRUE(ret!=0);
        }
        HLC_ModuleDestroy(bc_src);
    }

    HLC_ModuleDestroy(dst);
}

// Test optimization call works
TEST(TEST_BASE, test_optimize_module)
{
    std::string ir = read_ir_from_file("demo_ir.ll");
    ModuleRef* dst = HLC_ParseModule(ir.c_str());

    int ret;

    for (auto& bitcode : _bitcodes)
    {

        std::string builtins_bc = read_bc_from_file(bitcode.c_str());
        ModuleRef* bc_src = HLC_ParseBitcode(builtins_bc.c_str(),
                                             builtins_bc.size());

        // link the builtins into the module
        ret = HLC_ModuleLinkIn(dst, bc_src);
        EXPECT_TRUE(ret != 0);

        HLC_ModuleDestroy(bc_src);
    }

    // run an optimisation pass over the module
    ret = HLC_ModuleOptimize(dst, 3, 0, 1);
    EXPECT_TRUE(ret == 1);

    HLC_ModuleDestroy(dst);
}

// Test compilation call to HSAIL works
TEST(TEST_BASE, test_compile_module_to_HSAIL)
{
    HLC_Initialize();
    std::string ir = read_ir_from_file("demo_ir.ll");
    ModuleRef* dst = HLC_ParseModule(ir.c_str());

    int ret;

    for (auto& bitcode : _bitcodes)
    {

        std::string builtins_bc = read_bc_from_file(bitcode.c_str());
        ModuleRef* bc_src = HLC_ParseBitcode(builtins_bc.c_str(),
                                             builtins_bc.size());

        // link the builtins into the module
        ret = HLC_ModuleLinkIn(dst, bc_src);
        EXPECT_TRUE(ret != 0);

        HLC_ModuleDestroy(bc_src);
    }

    // run an optimisation pass over the module
    ret = HLC_ModuleOptimize(dst, 3, 0, 1);
    ASSERT_TRUE(ret == 1);

    char * output;
    ret = HLC_ModuleEmitHSAIL(dst, 2, &output);
    EXPECT_TRUE(ret > 0);
    std::string hsail(output);

    // check this is an HSA code object, search the dump for an HSA ISA string
    // like '.hsa_code_object_isa 8,0,3,"AMD","AMDGPU"'
    std::regex regex(".*\\.hsa_code_object_isa.*\"AMD\",\"AMDGPU\".*");
    EXPECT_TRUE(std::regex_search(hsail, regex));
    free(output);

    HLC_ModuleDestroy(dst);
}

// Test compilation call to BRIG works
TEST(TEST_BASE, test_compile_module_to_BRIG)
{
    HLC_Initialize();
    std::string ir = read_ir_from_file("demo_ir.ll");
    ModuleRef* dst = HLC_ParseModule(ir.c_str());

    int ret;

    for (auto& bitcode : _bitcodes)
    {

        std::string builtins_bc = read_bc_from_file(bitcode.c_str());
        ModuleRef* bc_src = HLC_ParseBitcode(builtins_bc.c_str(),
                                             builtins_bc.size());

        // link the builtins into the module
        ret = HLC_ModuleLinkIn(dst, bc_src);
        EXPECT_TRUE(ret != 0);

        HLC_ModuleDestroy(bc_src);
    }

    // run an optimisation pass over the module
    ret = HLC_ModuleOptimize(dst, 3, 0, 1);
    ASSERT_TRUE(ret == 1);

    char * output;
    ret = HLC_ModuleEmitBRIG(dst, 2, &output);
    EXPECT_TRUE(ret > 0);

    char elf_string[] = "\x7f\x45\x4c\x46";

    // check this is an ELF object
    for (size_t i = 0; i < 4; i++)
    {
        EXPECT_TRUE(output[i]==elf_string[i]);
    }

    free(output);

    HLC_ModuleDestroy(dst);
}

// Test many compilation calls to BRIG works
TEST(TEST_BASE, test_many_compile_module_to_BRIG)
{
    int trials = 5;
    for(int k = 0; k < trials; k++)
    {
        HLC_Initialize();
        std::string ir = read_ir_from_file("demo_ir.ll");
        ModuleRef* dst = HLC_ParseModule(ir.c_str());

        int ret;

        for (auto& bitcode : _bitcodes)
        {

            std::string builtins_bc = read_bc_from_file(bitcode.c_str());
            ModuleRef* bc_src = HLC_ParseBitcode(builtins_bc.c_str(),
                                                 builtins_bc.size());

            // link the builtins into the module
            ret = HLC_ModuleLinkIn(dst, bc_src);
            EXPECT_TRUE(ret != 0);

            HLC_ModuleDestroy(bc_src);
        }

        // run an optimisation pass over the module
        ret = HLC_ModuleOptimize(dst, 3, 0, 1);
        ASSERT_TRUE(ret == 1);

        char * output;
        ret = HLC_ModuleEmitBRIG(dst, 2, &output);
        EXPECT_TRUE(ret > 0);

        char elf_string[] = "\x7f\x45\x4c\x46";

        // check this is an ELF object
        for (size_t i = 0; i < 4; i++)
        {
            EXPECT_TRUE(output[i]==elf_string[i]);
        }

        free(output);

        HLC_ModuleDestroy(dst);
    }
}
