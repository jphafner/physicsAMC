#!/usr/bin/env lua

-- large description and howto 
-- MIT license, like lua?
-- GPL3 like rest of code??

local lpeg = require "lpeg"
local argparse = require "argparse"
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


-- Define grammars
----------------------------------------
local newcommands = P {
  "expr",
  expr = C( V("command") * V("num")^-1 * V("definition") ) + 1 * V("expr"),
  command = P("\\newcommand{") * V("name") * P("}"),
  name = P("\\") * locale.alpha^1,
  num = P("[") * locale.digit^1 * P("]"),
  definition = balancer("{","}",V("definition")),
}^0

-- NOTE: place all in one, then remove on each match
local newcommand_name = P {
  "expr",
  expr = V("command") * V("num")^-1 * V("definition"),
  command = P("\\newcommand{") * V("name") * P("}"),
  name = C(locale.alnum^1),
  num = P("[") * P(locale.digit^1) * P("]"),
  definition = balancer("{","}",V("definition")),
}

local elements = P {
  "expr",
  expr = C( V("command") * V("group") ) + 1 * V("expr"),
  group = balancer("{","}",V("group")),
  command = P("\\element{") * V("name") * P("}"),
  name = locale.alnum^1,
}^0

local element_name = P {
  "expr",
  expr = V("command") * V("group") + 1 * V("expr"),
  group = balancer("{","}",V("group")),
  command = P("\\element{") * V("name") * P("}"),
  name = C(locale.alnum^1),
}

local question_name = P {
  "expr",
  expr = C( V("command") ) + 1,
  command = P("\\begin{question}{") * V("name") * P("}"),
  name = C( P(locale.alnum + locale.punct)^1 ),
  --[[
  expr = V("environment") + 1,
  environment = balancer(V("left"),V("right"),V("environment")),
  left  = P("\\begin{question}{") * V("name") * P("}"),
  right = P("\\end{question}"),
  name = C( P(locale.alnum + locale.punct)^1 ),
  --]]
}

local tag_name = P {
  "expr",
  expr  = V("label") * V("list"),
  label = P("TAGS:") * locale.space^0,
  list  = V("tags")^1,
  tags  = C(locale.alnum^1) * P(locale.punct),
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
    description = "List of input file name",
    args = "+",
  }
  -- Options
  parser:option() {
    name = "-o --output",
    description = "Output file name [default: stdout]",
    convert = function(s)
        return io.open(s,"w")
    end,
    default = io.stdout,
    args = "1",
    count = "?",
  }
  -- NOTE: Patterns @ lua.org/pil/20.2.html
  parser:option() {
    name = "-t --tags",
    description = "Lua pattern for matching the project subject tags",
    args = "1",
    count = "?",
  }
  parser:option() {
    name = "-e --element",
    description = "Lua pattern for matching the AMC element name",
    args = "1",
    count = "?",
  }
  parser:option() {
    name = "-q --question",
    description = "Lua pattern for matching the AMC question name",
    args = "1",
    count = "?",
  }
  -- Flags
  parser:flag() {
    name = "-l --list",
    description = "Sort output matching elements",
  }
  parser:flag() {
    name = "-s --sort",
    description = "List all used tags from input and then exit.",
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
end


-- Define main function
----------------------------------------
function main()
  local args = parseargs()

  if args.list then
    list_tags(args)
  end

  for k,file in pairs(args.input) do
    local t = io.open(file):read("*all")
    local c = Ct(newcommands):match(t)
    --for a,b in pairs(c) do
    --  args.output:write(b,"\n\n")
    --end
    -- only print command if matches matched element

    -- string.find(s, pattern)
    for k,v in pairs(Ct(elements):match(t)) do
      if not args.element or string.find(lpegmatch(element_name,v),args.element) then
        print(v)
        print(question_name:match(v))
        --print(string.find(lpegmatch(question_name,v),args.question))
        --print(lpegmatch(Ct(question_name),v))
        if not args.question or string.find(lpegmatch(question_name,v),args.question) then
          if not args.tags or string.find(lpegmatch(tag_name,v),args.tags) then
            args.output:write(v,"\n\n") 
          end
        end
      end
    end
  end
end

main()
os.exit(0)

