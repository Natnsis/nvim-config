local ls = require("luasnip")

local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node

ls.setup({
  history = true,
  update_events = "TextChanged,TextChangedI",
  enable_autosnippets = true,
})

-- Load friendly-snippets
require("luasnip.loaders.from_vscode").lazy_load()

-- HTML snippet: h1 -> <h1></h1> with cursor in center on Enter
ls.add_snippets("html", {
  s("h1", {
    t("<h1>"),
    i(1),
    t("</h1>"),
  }),
  s("h2", {
    t("<h2>"),
    i(1),
    t("</h2>"),
  }),
  s("h3", {
    t("<h3>"),
    i(1),
    t("</h3>"),
  }),
  s("h4", {
    t("<h4>"),
    i(1),
    t("</h4>"),
  }),
  s("h5", {
    t("<h5>"),
    i(1),
    t("</h5>"),
  }),
  s("h6", {
    t("<h6>"),
    i(1),
    t("</h6>"),
  }),
  s("p", {
    t("<p>"),
    i(1),
    t("</p>"),
  }),
  s("div", {
    t("<div>"),
    i(1),
    t("</div>"),
  }),
  s("span", {
    t("<span>"),
    i(1),
    t("</span>"),
  }),
  s("a", {
    t('<a href="'),
    i(1),
    t('">'),
    i(2),
    t("</a>"),
  }),
  s("img", {
    t('<img src="'),
    i(1),
    t('" alt="'),
    i(2),
    t('">'),
  }),
  s("ul", {
    t("<ul>\n  <li>"),
    i(1),
    t("</li>\n</ul>"),
  }),
  s("ol", {
    t("<ol>\n  <li>"),
    i(1),
    t("</li>\n</ol>"),
  }),
  s("li", {
    t("<li>"),
    i(1),
    t("</li>"),
  }),
  s("table", {
    t("<table>\n  <tr>\n    <td>"),
    i(1),
    t("</td>\n  </tr>\n</table>"),
  }),
  s("tr", {
    t("<tr>\n  <td>"),
    i(1),
    t("</td>\n</tr>"),
  }),
  s("td", {
    t("<td>"),
    i(1),
    t("</td>"),
  }),
  s("form", {
    t("<form action=\"\" method=\"\">\n  "),
    i(1),
    t("\n</form>"),
  }),
  s("input", {
    t('<input type="'),
    i(1, "text"),
    t('" name="" id="">'),
  }),
  s("button", {
    t("<button>"),
    i(1, "Click me"),
    t("</button>"),
  }),
  s("script", {
    t("<script>\n  "),
    i(1),
    t("\n</script>"),
  }),
  s("style", {
    t("<style>\n  "),
    i(1),
    t("\n</style>"),
  }),
  s("link", {
    t('<link rel="stylesheet" href="'),
    i(1),
    t('">'),
  }),
  s("meta", {
    t('<meta name="" content="">'),
  }),
  s("br", {
    t("<br>"),
  }),
  s("hr", {
    t("<hr>"),
  }),
})

-- React snippets
ls.add_snippets("javascriptreact", {
  s("rfc", {
    t("function "),
    i(1, "ComponentName"),
    t("() {\n  return (\n    <div>\n      "),
    i(2),
    t("\n    </div>\n  );\n}"),
  }),
  s("rcc", {
    t("class "),
    i(1, "ComponentName"),
    t(" extends React.Component {\n  render() {\n    return (\n      <div>\n        "),
    i(2),
    t("\n      </div>\n    );\n  }\n}"),
  }),
})

ls.add_snippets("typescriptreact", {
  s("rfc", {
    t("function "),
    i(1, "ComponentName"),
    t("() {\n  return (\n    <div>\n      "),
    i(2),
    t("\n    </div>\n  );\n}"),
  }),
  s("rcc", {
    t("class "),
    i(1, "ComponentName"),
    t(" extends React.Component {\n  render() {\n    return (\n      <div>\n        "),
    i(2),
    t("\n      </div>\n    );\n  }\n}"),
  }),
})

-- Expand on Enter for HTML/JSX
local function expand_or_jump()
  if ls.expand_or_jumpable() then
    return ls.expand_or_jump()
  end
  -- Return nil to let Enter behave normally when no snippet can expand
  return nil
end

-- Map <Enter> to expand snippets in insert mode
vim.keymap.set("i", "<CR>", function()
  if ls.expand_or_jumpable() then
    ls.expand_or_jump()
  else
    -- Normal Enter behavior
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<CR>", true, true, true), "n", false)
  end
end, { silent = true })