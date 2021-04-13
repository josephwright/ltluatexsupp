
-- l3uild script for "luatexbase" files

-- Identify the bundle and module
bundle = ""
module = "luatexbase"

maindir = ".."

checkengines   = {"luatex"} -- no l3build tests yet..
checkformat    = "lualatex"
stdengine      = "luatex"
typesetexe     = "lualatex"

installfiles =  {"*.lua", "*.sty"}

typesetfiles = {"luatexbase.dtx"}

-- Release a TDS-style zip
packtdszip  = true

tdsroot = "luatex"

-- tests for this bundle
-- testfiledir = "testfiles"

function ltluatexdoc ()
doc()
modules={"tests-latex","tests-plain"}
allmodules ("doc")
end

function main (target,...)
if target == "doc" then
ltluatexdoc()
else
stdmain(target,...)
end
end


