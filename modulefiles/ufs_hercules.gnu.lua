help([[
loads UFS Model prerequisites for Hercules/GNU
]])

prepend_path("MODULEPATH", "/work/noaa/epic/role-epic/spack-stack/hercules/spack-stack-dev-20230825/envs/ufs-pio-2.5.10/install/modulefiles/Core")

stack_gnu_ver=os.getenv("stack_gnu_ver") or "11.3.1"
load(pathJoin("stack-gcc", stack_gnu_ver))

stack_openmpi_ver=os.getenv("stack_openmpi_ver") or "4.1.5"
load(pathJoin("stack-openmpi", stack_openmpi_ver))

stack_python_ver=os.getenv("stack_python_ver") or "3.9.14"
load(pathJoin("stack-python", stack_python_ver))

cmake_ver=os.getenv("cmake_ver") or "3.23.1"
load(pathJoin("cmake", cmake_ver))

local ufs_modules = {
  {["jasper"]          = "2.0.32"},
  {["zlib"]            = "1.2.13"},
  {["libpng"]          = "1.6.37"},
  {["hdf5"]            = "1.14.0"},
  {["netcdf-c"]        = "4.9.2"},
  {["netcdf-fortran"]  = "4.6.0"},
  {["parallelio"]      = "2.5.10"},
  {["esmf"]            = "8.4.2"},
  {["fms"]             = "2023.01"},
  {["bacio"]           = "2.4.1"},
  {["crtm"]            = "2.4.0"},
  {["g2"]              = "3.4.5"},
  {["g2tmpl"]          = "1.10.2"},
  {["ip"]              = "3.3.3"},
  {["sp"]              = "2.3.3"},
  {["w3emc"]           = "2.9.2"},
  {["gftl-shared"]     = "1.5.0"},
  {["mapl"]            = "2.35.2-esmf-8.4.2"},
  {["scotch"]          = "7.0.4"},
}

for i = 1, #ufs_modules do
  for name, default_version in pairs(ufs_modules[i]) do
    local env_version_name = string.gsub(name, "-", "_") .. "_ver"
    load(pathJoin(name, os.getenv(env_version_name) or default_version))
  end
end

setenv("CC", "mpicc")
setenv("CXX", "mpic++")
setenv("FC", "mpif90")
setenv("CMAKE_Platform", "hercules.gnu")

whatis("Description: UFS build environment")
