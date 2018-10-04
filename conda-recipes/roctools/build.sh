#!/bin/bash

set -x

###############################################################################
# Extract bitcodes from ROCM rpm source
###############################################################################

RPM_PATH=`readlink -f opencl_tmp/*.rpm`
ROCM_PATH="opt/rocm/opencl/lib/x86_64/bitcode"

declare -a bitcodes=(                       \
"opencl.amdgcn.bc"                          \
"ocml.amdgcn.bc"                            \
"ockl.amdgcn.bc"                            \
"oclc_correctly_rounded_sqrt_off.amdgcn.bc" \
"oclc_daz_opt_off.amdgcn.bc"                \
"oclc_finite_only_off.amdgcn.bc"            \
"oclc_isa_version_803.amdgcn.bc"            \
"oclc_unsafe_math_off.amdgcn.bc"            \
"irif.amdgcn.bc"                            \
)

for bitcode in "${bitcodes[@]}"; do
    bsdtar -x -f "$RPM_PATH" --strip-components 6 "$ROCM_PATH/$bitcode"
done

# move the bitcode to the pkg dir
RESOURCE_PATH="$PREFIX/share/rocmtools"
mv bitcode $RESOURCE_PATH

###############################################################################
# Now do C++ library build
###############################################################################
CMAKE_BUILD_DIR="cmake_build" # this needs to match meta.yaml test::source_files
mkdir ${CMAKE_BUILD_DIR}
pushd ${CMAKE_BUILD_DIR}

printenv

# Force CMake to look in the conda env "CMAKE_CONDA_ROOT" `/lib` etc 
# for libraries via `-L`
cmake .. -DCMAKE_BUILD_TYPE=RELEASE \
         -DCMAKE_CONDA_ROOT:PATH="$BUILD_PREFIX" \
         -DCMAKE_BITCODE_ROOT:PATH="$RESOURCE_PATH"

# build
make VERBOSE=1

# move DSO to lib
cp "rocmlite/librocmlite.so" "$PREFIX/lib"

# test now, splitting this out to work at test time is hard to do
# the test_XXX binaries are dynamically linked to librocmlite but no rpath
# fix is made unless the binaries are also shipped (undesirable).

# For ROCm 1.9.x the initialize/finalize call pair leaks the signal handlers
# from inside LLVM. The valgrind tests fail as a 3.14+ valgrind is needed to
# process glibc6+ symbols and this version is not common in the wild yet. As a
# result no suppressions file could usefully be applied, hence mask off valgrind
# based testing.
ctest -V -E valgrind

popd

###############################################################################
# Copy llvmdev binary tools to /bin
# NOTE: should these names start to cause collision issues with llvm installs
# they can be prefixed e.g. amd_opt. However `ld.lld` will need to have a 
# `-flavour gnu` permanently supplied so it knows that it is emulating the GNU
# linker variant.
###############################################################################
declare -a tools=( \
"opt"              \
"llc"              \
"llvm-link"        \
"ld.lld"           \
)

for tool in "${tools[@]}"; do
    cp "$BUILD_PREFIX/bin/$tool" "$PREFIX/bin/$tool"
done
