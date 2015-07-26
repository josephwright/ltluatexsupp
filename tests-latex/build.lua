#!/usr/bin/env texlua

-- Build script for "ltluatex" files

-- Identify the bundle and module
bundle = ""
module = "ltluatex"



checkengines   = {"luatex"} -- no l3build tests yet..
checkformat    = "lualatex"
stdengine      = "luatex"
typesetexe     = "lualatex"

installfiles =  {}


typesetfiles = {"*.tex"}

-- Release a TDS-style zip
packtdszip  = true

-- tests for this bundle
-- testfiledir = "testfiles"


-- Find and run the build system
kpse.set_program_name ("kpsewhich")
dofile (kpse.lookup ("l3build.lua"))
