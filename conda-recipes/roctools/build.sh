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
mv bitcode $PREFIX

# ###############################################################################
# # Now do C++ library build
# ###############################################################################
CMAKE_BUILD_DIR="cmake_build" # this needs to match meta.yaml test::source_files
mkdir ${CMAKE_BUILD_DIR}
pushd ${CMAKE_BUILD_DIR}

printenv

# Force CMake to look in the conda env "CMAKE_CONDA_ROOT" `/lib` etc for libraries via `-L`
cmake .. -DCMAKE_BUILD_TYPE=RELEASE \
         -DCMAKE_CONDA_ROOT:PATH="$BUILD_PREFIX" \
         -DCMAKE_BITCODE_ROOT:PATH="$PREFIX/bitcode"

# build
make VERBOSE=1

# move DSO to lib
cp "rocmlite/librocmlite.so" "$PREFIX/lib"

# test now, splitting this out to work at test time is hard to do
# the test_XXX binaries are dynamically linked to libHLC but no rpath
# fix is made unless the binaries are also shipped (undesirable).
ctest -V

popd

###############################################################################
# Copy llvmdev binary tools to /bin
###############################################################################
declare -a tools=( \
"opt"              \
"llc"              \
"llvm-link"        \
"ld.lld"           \
)

for tool in "${tools[@]}"; do
    cp "$BUILD_PREFIX/bin/$tool" "$PREFIX/bin"
done
