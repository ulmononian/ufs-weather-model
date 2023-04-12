help([[
loads UFS Model prerequisites for noaacloud/gnu
]])


prepend_path("MODULEPATH", "/contrib/EPIC/spack-stack/spack-stack-1.3.0/envs/unified-dev/install/modulefiles/Core")

load("stack-gcc/9.2.0")
load("stack-openmpi/3.1.4")
load("stack-python/3.9.12")

load("ufs_common")

setenv("CC", "mpiicc")
setenv("CXX", "mpiicpc")
setenv("FC", "mpiifort")
setenv("CMAKE_Platform", "noaacloud.intel")

whatis("Description: UFS build environment")
