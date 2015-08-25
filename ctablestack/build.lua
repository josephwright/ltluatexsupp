#!/usr/bin/env texlua

-- Build script for "ctablestack" files

-- Identify the bundle and module
bundle = "ltluatexsupp"
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

-- Find and run the build system
kpse.set_program_name ("kpsewhich")
dofile (kpse.lookup ("l3build.lua"))

