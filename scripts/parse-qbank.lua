#!/usr/bin/env lua

-- large description and howto 
-- MIT license, like lua?
-- GPL3 like rest of code??

local lpeg = require "lpeg"
local argparse = require "argparse"
local string = require "string"
local re = require "re"
local io = require "io"
local os = require "os"

local locale = lpeg.locale()
local P, R, S, V, Ct, C, Cs, Cc, Cp, Cmt = lpeg.P, lpeg.R, lpeg.S, lpeg.V, lpeg.Ct, lpeg.C, lpeg.Cs, lpeg.Cc, lpeg.Cp, lpeg.Cmt
local lpegtype, lpegmatch, lpegprint = lpeg.type, lpeg.match, lpeg.print


-- Define lpeg helper functions
----------------------------------------
local function balancer(left,right,center)
  left, right = P(left), P(right)
  return P ( left * ((1 - left - right) + center)^0 * right )
end

local function anywhere(patt)
  return P { P(patt) + 1 * V(1) }
end

local function instringchecker(patt)
  p = anywhere(patt)
  return function(str)
    return lpegmatch(patt,str) and true or false
  end
end

-- Define AMC specific functions
----------------------------------------

local function AMCbegin(patt1,patt2)
  return P ( "\\begin{" * patt1 * "}{" * patt2 * "}" )
end

local function AMCend(patt)
  return P ( "\\end{" * patt * "}" )
end


-- Define grammars
----------------------------------------

-- NOTE: Ordered choice matters!!
local AMCenvironment = P( P("questionmultx") + P("questionmult") + P("question") )

local newcommands = P {
  "expr",
  expr = C( V("command") * V("num")^-1 * V("definition") ) + 1 * V("expr"),
  command = P("\\newcommand{") * V("name") * P("}"),
  name = P("\\") * locale.alpha^1,
  num = P("[") * locale.digit^1 * P("]"),
  definition = balancer("{","}",V("definition")),
}^0

local newcommand_name = P {
  "expr",
  expr = V("command") * V("num")^-1 * V("definition"),
  command = P("\\newcommand{") * V("name") * P("}"),
  name = C( P("\\") * locale.alnum^1 ),
  num = P("[") * P(locale.digit^1) * P("]"),
  definition = balancer("{","}",V("definition")),
}

local AMCelement = P {
  "expr",
  expr = C( V("command") * V("group") ) + 1 * V("expr"),
  group = balancer("{","}",V("group")),
  command = P("\\element{") * V("name") * P("}"),
  name = locale.alnum^1,
}^0

local AMCelement_name = P {
  "expr",
  expr = V("command") * V("group") + 1,
  group = balancer("{","}",V("group")),
  command = P("\\element{") * V("name") * P("}"),
  name = C(locale.alnum^1),
}

-- NOTE: can there be more than one??
local AMCquestion = P {
  "expr",
  expr = C( V("environment") ) + 1 * V("expr"),
  environment = balancer(V("left"),V("right"),V("environment")),
  left  = AMCbegin(AMCenvironment,V("name")),
  right = AMCend(AMCenvironment),
  name = (locale.alnum + S("-"))^1,
}

local AMCquestion_name = P {
  "expr",
  expr = V("environment") + 1 * V("expr"),
  environment = balancer(V("left"),V("right"),V("environment")),
  left  = AMCbegin(AMCenvironment,V("name")),
  right = AMCend(AMCenvironment),
  name = C( (locale.alnum + S("-"))^1 ),
}

-- NOTE: element_tag
local tag_name = P {
  "expr",
  expr  = V("label") * V("list"),
  label = P("TAGS:") * locale.space^0,
  list  = V("tags")^1,
  tags  = C(locale.alnum^1) * P(locale.punct),
}

local split_comma = P {
  "expr",
  expr = Ct( V("elem") * ( V("sep") * V("elem"))^0),
  sep  = S(","),
  elem = C( (1 - V("sep"))^0 ),
}


-- Define argparse function
----------------------------------------
function parseargs()
  -- Properties
  local parser = argparse() {
    name = "parse-qbank",
    description = [=[An LPEG parser for physicsAMC]=],
    epilog = "For more information, see http://github.com/jphafner/physicsAMC",
  }
  -- Arguments
  parser:argument() {
    name = "input",
    description = "List of input file names",
    args = "+", -- this returns a table
  }
  -- Options
  parser:option() {
    name = "-o --output",
    description = "Output file name [default: io.stdout]",
    convert = function(s)
        return io.open(s,"w")
    end,
    default = io.stdout,
    args = "1",
    count = "?",
  }
  -- NOTE: Patterns at lua.org/pil/20.2.html
  parser:option() {
    name = "-t --tags",
    description = "Lua pattern for matching the project subject tags",
    convert = function(s)
        return lpeg.match(split_comma,s)
    end,
    args = "1",
    count = "?",
  }
  -- TODO: epatt, qpatt, tpatt ?
  parser:option() {
    name = "-e --element",
    description = "Lua pattern for matching the AMC element name",
    convert = function(s)
        return lpeg.match(split_comma,s)
    end,
    args = "1",
    count = "?",
  }
  parser:option() {
    name = "-q --question",
    description = "Lua pattern for matching the AMC question name",
    convert = function(s)
        return lpeg.match(split_comma,s)
    end,
    args = "1",
    count = "?",
  }
  --[[
  -- TODO: Flags
  parser:flag() {
    name = "-l --list",
    description = "List all used tags from input and then exit.",
  }
  -- TODO: do by default
  parser:flag() {
    name = "-s --sort",
    description = "Sort output matching elements",
  }
  -- TODO: implement, after csv parser for multiple tags
  --]]
  parser:flag() {
    name = "-a --and",
    description = "Switch filtering logic from logical or (default) to logical and",
  }
  parser:flag() {
    name = "-v --version",
    description = "Show version info and exit.",
    action = function()
      print("parse-qbank v0.0.1")
      os.exit(0)
    end
  }
  return parser:parse()
end

function list_tags(args)
    -- TODO: print sorted and uniq list
end

function compare(a,b)
    return a < b
end

function sortAMC(a,b)
    return lpegmatch(AMCquestion_name,a) < lpegmatch(AMCquestion_name,b)
end

function findOR(str, tbl)
  for _,v in pairs(tbl) do
    if string.find(str,v) then
        return true
    end
  end
  return false
end

function findAND(str, tbl)
  for _,v in pairs(tbl) do
    if not string.find(str,v) then
        return false
    end
  end
  return true
end

-- Define main function
----------------------------------------
function main()
  local args = parseargs()

  -- TODO
  -- NOTE: use _ to ignore value
  if args.list then
    list_tags(args)
  end
    
  T = {}
  C = {}

  -- loop through all input files
  for k1,file in pairs(args.input) do
    local text = io.open(file):read("*all")

    -- find all newcommands
    for _,comm in pairs(Ct(newcommands):match(text)) do
        table.insert(C,comm)
    end

    -- loop through all elements
    for k2,elem in pairs(Ct(AMCelement):match(text)) do

      -- check for matching element name
      if not args.element or findOR(lpegmatch(AMCelement_name,elem),args.element) then

        -- check for matching question name
        if not args.question or findOR(lpegmatch(AMCquestion_name,elem),args.question) then

          -- check for matching tag name
          if not args.tags or findOR(lpegmatch(tag_name,elem),args.tags) then
            table.insert(T,elem)
          end
        end
      end
    end
  end

  -- sort filtered elements
  table.sort(T, sortAMC)

  -- print sorted elements
  for _,elem in pairs(T) do
    
    -- check for matching newcommands
    for k,comm in pairs(C) do
      if string.find(elem,lpegmatch(newcommand_name,comm)) then

        -- print newcommand and prevent duplicates
        args.output:write(table.remove(C,k),"\n\n")
      end
    end

    -- print element
    args.output:write(elem,"\n\n") 
  end
end

main()
os.exit(0)

