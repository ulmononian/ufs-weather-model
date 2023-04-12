help([[
loads UFS Model prerequisites for Cheyenne/GNU
]])

stack_gnu_ver=os.getenv("stack_gnu_ver") or "10.1.0"
load(pathJoin("stack-gcc", stack_gnu_ver))

stack_openmpi_ver=os.getenv("stack_openmpi_ver") or "4.1.1"
load(pathJoin("stack-openmpi", stack_openmpi_ver))

prepend_path("MODULEPATH", "/glade/work/jedipara/cheyenne/spack-stack/modulefiles/misc")
miniconda3_ver=os.getenv("miniconda3_ver") or "3.9.12"
load(pathJoin("stack-python", miniconda3_ver))

load("ufs_common")

setenv("CC", "mpicc")
setenv("CXX", "mpicxx")
setenv("FC", "mpif90")
setenv("CMAKE_Platform", "cheyenne.gnu")

whatis("Description: UFS build environment")
