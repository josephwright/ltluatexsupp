-- 
-- This is essentially a copy of file `test-mcb-latex.tex',
-- Copyright 2009, 2010 by Élie Roux 
-- Copyright 2010, 2011 by Manuel Pégourié-Gonnard 
-- Copyright 2013 by Philipp Gesang

-- modified 2015 by David Carlisle where marked
-- to empty a callback list before resetting the callback
-- and to only allow one callback in a first/exclusive list
-- to work with ltluatex
--  
local msg = texio.write_nl
local function sample(head,...)
    return head, true
end
local prio = luatexbase.priority_in_callback
msg("\n*********\n* Testing management functions\n*********")
luatexbase.add_to_callback("hpack_filter", sample, "sample one", 1)
luatexbase.add_to_callback("hpack_filter", sample, "sample two", 2)
luatexbase.add_to_callback("hpack_filter", sample, "sample three", 1)
assert(prio("hpack_filter", "sample three"))
luatexbase.remove_from_callback("hpack_filter", "sample three")
assert(not prio("hpack_filter", "sample three"))
luatexbase.remove_from_callback("hpack_filter", "sample two")
luatexbase.remove_from_callback("hpack_filter", "sample one")
luatexbase.reset_callback("hpack_filter")
--assert(not prio("hpack_filter", "sample one"))--dpc (check this)
local function data_one(s)
  texio.write_nl("I'm data 1 whith argument: "..s)
  return s
end
local function data_two(s)
  texio.write_nl("I'm data 2 whith argument: "..s)
  return s
end
local function data_three(s)
  texio.write_nl("I'm data 3 whith argument: "..s)
  return s
end
msg("\n*********\n* Testing user-defined callbacks\n*********")
msg("* create one")
luatexbase.create_callback("fooback", "data", data_one)
msg("* call it")
luatexbase.call_callback("fooback", "default")
msg("* add two functions")
luatexbase.add_to_callback("fooback", data_two, "function two", 2)
luatexbase.add_to_callback("fooback", data_three, "function three", 1)
msg("* call")
luatexbase.call_callback("fooback", "all")
msg("* rm one function")
luatexbase.remove_from_callback("fooback", "function three")
msg("* call")
luatexbase.call_callback("fooback", "all but three")
msg("* reset")
luatexbase.remove_from_callback("fooback", "function two")
luatexbase.reset_callback("fooback")
msg("* call")
luatexbase.call_callback("fooback", "default")
function add_hpack_filter()
    luatexbase.add_to_callback('hpack_filter', function(head, ...)
            texio.write_nl("I'm a dummy hpack_filter")
            return head
        end,
        'dummy hpack filter')
    luatexbase.add_to_callback('hpack_filter', function(head, ...)
            texio.write_nl("I'm an optimized dummy hpack_filter")
            return true
        end,
        'optimized dummy hpack filter')
end
function rm_one_hpack_filter()
    luatexbase.remove_from_callback('hpack_filter', 'dummy hpack filter')
end
function rm_two_hpack_filter()
    luatexbase.remove_from_callback('hpack_filter',
        'optimized dummy hpack filter')
end
function add_hyphenate()
    luatexbase.add_to_callback('hyphenate', function(head, tail)
            texio.write_nl("I'm a dummy hyphenate")
        end,
        'dummy hyphenate')
    luatexbase.add_to_callback('hyphenate', function(head, tail)
            texio.write_nl("I'm an other dummy hyphenate")
        end,
        'other dummy hyphenate')
end
function rm_one_hyphenate()
    luatexbase.remove_from_callback('hyphenate', 'dummy hyphenate')
end
function rm_two_hyphenate()
    luatexbase.remove_from_callback('hyphenate', 'other dummy hyphenate')
end
function add_find_write_file()
    luatexbase.add_to_callback('find_write_file', function(id, name)
            texio.write_nl("I'm a dummy find_write_file")
            return "dummy-"..name
        end,
        'dummy find_write_file')
	rm_one_find_write_file() --dpc
    luatexbase.add_to_callback('find_write_file', function(id, name)
            texio.write_nl("I'm an other dummy find_write_file")
            return "dummy-other-"..name
        end,
        'other dummy find_write_file')
end
function rm_one_find_write_file()
-- dpc
    if luatexbase.priority_in_callback('find_write_file',
        'dummy find_write_file') then
    luatexbase.remove_from_callback('find_write_file',
        'dummy find_write_file')
end
end
function rm_two_find_write_file()
-- dpc
    if luatexbase.priority_in_callback('find_write_file',
    'other dummy find_write_file') then
    luatexbase.remove_from_callback('find_write_file',
        'other dummy find_write_file')
end
end
function add_process_input_buffer()
    luatexbase.add_to_callback('process_input_buffer', function(buffer)
            return buffer.."\\msg{dummy}"
        end,
        'dummy process_input_buffer')
    luatexbase.add_to_callback('process_input_buffer', function(buffer)
            return buffer.."\\msg{otherdummy}"
        end,
        'other dummy process_input_buffer')
end
function rm_one_process_input_buffer()
    luatexbase.remove_from_callback('process_input_buffer',
        'dummy process_input_buffer')
end
function rm_two_process_input_buffer()
    luatexbase.remove_from_callback('process_input_buffer',
        'other dummy process_input_buffer')
end
-- 
--  End of File `test-mcb.lua'.
