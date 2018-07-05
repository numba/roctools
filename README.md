# roctools

This repository acts as a collection point for the resources needed to produce 
a conda package containing all the components necessary to use Numba with AMD 
GCN discrete GPUs. Included are:

 * Source code and build tooling for a library, `librocmlite`, which performs 
the same function for AMD GPUs as 
[`llvmlite`](https://github.com/numba/llvmlite) does for CPUs. It essentially 
acts as shim between Python and LLVM. For convenience, `librocmlite` is 
statically linked against releases from AMDs [LLVM 
fork](https://github.com/RadeonOpenCompute/llvm), therefore there is no LLVM 
dependency.

 * A conda recipe (`llvmdev_amdgcn`) for building the aforementioned fork of 
LLVM to bootstrap the `roctools` package.
 * A conda recipe (`roctools`) that:

    * Builds and tests `librocmlite`
    * Extracts necessary math (and other) library bitcodes from AMDs `rpm` 
based releases.
    * Extracts necessary binaries from a build of AMDs LLVM fork (as a conda 
package).

    It is this package upon which Numba depends.

------------------------

## Conda build instructions

1. Build the AMD LLVM fork package (this will take a while):

    ```
    $ conda build conda-recipes/llvmdev_amdgcn
    ```

    Upon successful completion a package called `llvmdev_amdgcn-{version}` will 
be produced. This package is needed to bootstrap the build of `librocmlite` and 
also to provide some binary tools used in the AMD GCN tool chain.

2. Build the roctools package:

    ```
    $ conda build conda-recipes/roctools
    ```

    Upon successful completion a package called `roctools-{version}` will 
be produced. This package is self contained and holds all the necessary 
components for using AMD GCN GPUs.

------------------------
## License
See [LICENSE](https://github.com/numba/roctools/blob/master/LICENSE).
