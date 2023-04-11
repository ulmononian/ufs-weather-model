help([[
loads UFS Model common libraries
]])

load(pathJoin("ufs-weather-model-env", "unified-dev"))

w3emc_ver=os.getenv("w3emc_ver") or "2.9.2"
load(pathJoin("w3emc", w3emc_ver))

whatis("Description: UFS build environment common libraries")

