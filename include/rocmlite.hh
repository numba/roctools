/**
 * Copyright (c) 2016 , Continuum Analytics, Inc.
 * All rights reserved.
 */

#ifndef _HLC_HH
#define _HLC_HH

#include "llvm/IR/Module.h"
#include "llvm/Support/FormattedStream.h"

using namespace std;

namespace librocmlite
{

    class ModuleRef
    {
        public:
            ModuleRef(llvm::Module * module);
            operator bool () const;
            llvm::Module * getModule();
            void destroy();
            std::string to_string();
            static ModuleRef* parseAssembly(const char* Asm);
            static ModuleRef* parseBitcode(const char *Bitcode, size_t Len);
        private:
            llvm::Module * M;
    };

    // Initializes the llvm libary tooling.
    void Initialize();

    // Finalizes the llvm library tooling.
    void Finalize();

    // Optimize a module in place
    void Optimize(llvm::Module * M, int OptLevel, int SizeLevel, int Verify);

    // Compile a module
    int CompileModule(std::unique_ptr<llvm::Module> mod, llvm::raw_string_ostream &os, bool emitBRIG,
                      int OptLevel);

}

#ifdef __cplusplus
extern "C"
{
#endif // __cplusplus

using namespace librocmlite;

// HLC_ C/CFFI entry points

void HLC_Initialize();

void HLC_Finalize();

char* HLC_CreateString(const char *str);

void HLC_DisposeString(char *str);

// rename this to ParseIR2Module ?
ModuleRef* HLC_ParseModule(const char *Asm);

ModuleRef* HLC_ParseBitcode(const char *Asm, size_t Len);

void HLC_ModulePrint(ModuleRef *M, char **output);

void HLC_ModuleDestroy(ModuleRef *M);

int HLC_ModuleOptimize(ModuleRef *M, int OptLevel, int SizeLevel, int Verify);

int HLC_ModuleLinkIn(ModuleRef * Dst, ModuleRef * Src);

int HLC_ModuleEmitHSAIL(ModuleRef *M, int OptLevel, char **output);

size_t HLC_ModuleEmitBRIG(ModuleRef *M, int OptLevel, char **output);

void HLC_SetCommandLineOption(int argc, const char * const * argv);



#ifdef __cplusplus
}
#endif // __cplusplus

#endif //ifdef _HLC_HH
