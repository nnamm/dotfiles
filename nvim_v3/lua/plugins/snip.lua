local ls = require("luasnip")

local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node

ls.add_snippets("go", {
  s("fnc", {
    t({ "func " }),
    i(1),
    t({ "(" }),
    i(2),
    t({ ") " }),
    i(3),
    t({ " {", "" }),
    t({ "    " }),
    i(0),
    t({ "", "}" }),
  }),
  s("ifnl", { t({ "if err != nil {", "" }), t({ "    " }), i(0), t({ "", "}" }) }),
  s("ifnll", {
    t({ "if err := " }),
    i(1),
    t({ "; err != nil {", "" }),
    t({ "    " }),
    i(0),
    t({ "", "}" }),
  }),
})

return {
  {
    "L3MON4D3/LuaSnip",
    opts = {
      history = true,
      delete_check_events = "TextChanged",
    },
  },
}
