#!/usr/bin/env texlua

-- Build script for "ltluatexsupp" files

-- Identify the bundle and module: the module may be empty in the case where
-- there is no subdivision
bundle = "ltluatexsupp"
module = ""

-- List the modules
modules = {"ctablestack", "luatexbase"}

-- We want a full release
packtdszip = true

-- Put the code in the right place
tdsroot = "luatex"

-- Find and run the build system
kpse.set_program_name("kpsewhich")
dofile(kpse.lookup ("l3build.lua"))
