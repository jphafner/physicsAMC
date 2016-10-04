
local lpeg = require("lpeg")

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
