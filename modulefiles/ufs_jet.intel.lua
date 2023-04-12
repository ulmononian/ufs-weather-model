help([[
loads UFS Model prerequisites for Jet/Intel
]])

prepend_path("MODULEPATH", "/mnt/lfs4/HFIP/hfv3gfs/role.epic/spack-stack/spack-stack-1.3.0/envs/unified-env/install/modulefiles/Core")

stack_intel_ver=os.getenv("stack_intel_ver") or "2021.5.0"
load(pathJoin("stack-intel", stack_intel_ver))

stack_impi_ver=os.getenv("stack_impi_ver") or "2021.5.1"
load(pathJoin("stack-intel-oneapi-mpi", stack_impi_ver))

prepend_path("MODULEPATH", "/lfs4/HFIP/hfv3gfs/spack-stack/modulefiles")
miniconda3_ver=os.getenv("miniconda3_ver") or "3.9.12"
load(pathJoin("stack-python", miniconda3_ver))

load("ufs_common")

setenv("CC", "mpiicc")
setenv("CXX", "mpiicpc")
setenv("FC", "mpiifort")
setenv("CMAKE_Platform", "jet.intel")

prepend_path("MODULEPATH", "/lfs4/BMC/ifi/modulefiles")
try_load("ifi/20230118-intel-2022.1.2")

whatis("Description: UFS build environment")
