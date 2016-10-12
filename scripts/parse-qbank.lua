
local lpeg = require "lpeg"

local alt_getopt = require "alt_getopt"

local long_opts = {
   version = 0,
   verbose = "v",
   help    = "h",
   fake    = 0,
   len     = 1,
   output  = "o",
   set_value = "S",
   ["set-output"] = "o"
}

local ret
local optarg
local optind
opts,optind,optarg = alt_getopt.get_ordered_opts (arg, "hVvo:n:S:", long_opts)


-- Options
--   -h --help      print help menu
--   -t --tregex    match tags with regex
--   -q --qregex    match question names with regex
--   -e --eregex    match elment names with regex
--   -i --input     input tex file
--   -o --output    output tex file

-- Functions
-- getElement
-- getTags

-- lpeg
-- P,S,R,C,Ct
--
-- getOpts
-- i for input
-- o for output
--
-- use stdout and stdin if i,o are null
--
-- order problems chronologically   
-- separate for exam creation using tags
-- this allows the same question to be used for multiple exams
--      for example, waves, light and sound overlap drastically
--      also, kinematics and mechanics can overlap a lot
--
--
-- get-elements 
-- get-tag
-- add-tag
-- del-tag
--
-- for k,v in pairs(Ct)
-- do
--     if tag then print
-- end
--



