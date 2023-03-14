help([[
loads UFS Model prerequisites for Cheyenne/Intel
]])


prepend_path("MODULEPATH", "/glade/work/epicufsrt/contrib/spack-stack/spack-stack-1.2.0/envs/unified-env/install/modulefiles/Core")

stack_intel_ver=os.getenv("stack_intel_ver") or "19.1.1.217"
load(pathJoin("stack-intel", stack_intel_ver))

stack_mpi_ver=os.getenv("stack_mpi_ver") or "2019.7.217"
load(pathJoin("stack-intel-mpi", stack_mpi_ver))

load("ufs_common_spack_debug")

setenv("CC", "mpicc")
setenv("CXX", "mpicxx")
setenv("FC", "mpif90")
setenv("CMAKE_Platform", "cheyenne.intel")

whatis("Description: UFS build environment")
