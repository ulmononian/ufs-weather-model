help([[
loads UFS Model prerequisites for Orion/Intel
]])

load("contrib")
load("noaatools")

prepend_path("MODULEPATH", "/work2/noaa/da/role-da/spack-stack-feature-r2d2-mysql/envs/unified-4.0.0-rc1/install/modulefiles/Core")

spack_intel_ver=os.getenv("spack_intel_ver") or "2022.0.2"
load(pathJoin("stack-intel", spack_intel_ver))

spack_impi_ver=os.getenv("spack_impi_ver") or "2021.5.1"
load(pathJoin("stack-intel-oneapi-mpi", spack_impi_ver))

prepend_path("MODULEPATH", "/work/noaa/da/role-da/spack-stack/modulefiles")
miniconda3_ver=os.getenv("miniconda3_ver") or "3.9.7"
load(pathJoin("stack-python", miniconda3_ver))

load("ufs_common_spack")

setenv("CC", "mpiicc")
setenv("CXX", "mpiicpc")
setenv("FC", "mpiifort")
setenv("CMAKE_Platform", "orion.intel")

whatis("Description: UFS build environment")
