
-- l3build script for "ctablestack" files

-- Identify the bundle and module
bundle = ""
module = "ctablestack"

maindir = ".."

checkengines   = {"luatex"} -- no l3build tests yet..
checkformat    = "lualatex"
stdengine      = "luatex"
typesetexe     = "lualatex"

-- Release a TDS-style zip
packtdszip  = true

-- tests for this bundle
-- testfiledir = "testfiles"

tdsroot = "luatex"



