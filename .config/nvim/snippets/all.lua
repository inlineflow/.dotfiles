local ls = require "luasnip"
local s = ls.snippet
local i = ls.insert_node
local t = ls.text_node

ls.add_snippets("all",
  s("iee", {
    i(1), t "text", i(2), t "text again", i(3)
  }))
