dofile(vim.g.base46_cache .. "cmp")

local cmp = require "cmp"
local luasnip = require "luasnip"

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col > 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match "%s" == nil
end

cmp.setup {
  completion = {
    completeopt = "menu,menuone,noinsert",
  },

  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },

  mapping = cmp.mapping.preset.insert {
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif has_words_before() then
        cmp.complete()
      else
        fallback()
      end
    end, { "i", "s" }),

    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),

    ["<CR>"] = cmp.mapping(function(fallback)
      if cmp.visible() and cmp.get_selected_entry() then
        cmp.confirm { select = true }
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { "i", "s" }),
  },

  sources = {
    { name = "nvim_lsp" },
    { name = "luasnip" },
    { name = "path" },
  },

  sorting = {
    priority_weight = 2,
    comparators = {
      cmp.config.compare.offset,
      cmp.config.compare.exact,
      cmp.config.compare.score,
      cmp.config.compare.recently_used,
      cmp.config.compare.locality,
      cmp.config.compare.kind,
      cmp.config.compare.sort_text,
      cmp.config.compare.length,
      cmp.config.compare.order,
    },
  },
}

-- Disable buffer source for HTML-like files to prevent buffer words
-- from competing with LSP-provided HTML tag completions
local html_fts = { "html", "htm", "jsx", "tsx", "xml" }

vim.api.nvim_create_autocmd("FileType", {
  pattern = html_fts,
  callback = function()
    cmp.setup.buffer {
      sources = {
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "path" },
      },
    }
  end,
})
