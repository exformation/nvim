-- these are provided but I want linting
local ls = require 'luasnip'
local fmta = require('luasnip.extras.fmt').fmta
local rep = require('luasnip.extras').rep
local s = ls.snippet
local c = ls.choice_node
local d = ls.dynamic_node
local i = ls.insert_node
local t = ls.text_node
local sn = ls.snippet_node

return {
  s(
    'myif',
    fmta(
      [[
if <cond>:
  <stmt>
]],
      {
        cond = i(1),
        stmt = i(0),
      }
    )
  ),
}
