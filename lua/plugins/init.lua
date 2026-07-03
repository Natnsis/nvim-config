return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    event = "BufReadPost",
    config = function()
      require "configs.blankline"
    end,
  },

  -- Snippets
  {
    "L3MON4D3/LuaSnip",
    version = "v2.*",
    build = "make install_jsregexp",
    config = function()
      require "configs.luasnip"
    end,
  },
  {
    "rafamadriz/friendly-snippets",
  },

  -- Emmet for HTML expansion (type h1 + Tab -> <h1></h1>)
  {
    "mattn/emmet-vim",
    ft = { "html", "css", "javascript", "typescript", "javascriptreact", "typescriptreact", "vue", "svelte" },
    config = function()
      vim.g.user_emmet_leader_key = "<C-y>"
      vim.g.user_emmet_settings = {
        html = {
          attributes = {
            input = "class form-control",
            button = "btn btn-primary",
          },
        },
      }
    end,
  },

  -- Mason: ensure LSP servers are installed
  {
    "williamboman/mason.nvim",
    event = "VeryLazy",
    opts = {
      ensure_installed = {
        "emmet-language-server",
        "html-lsp",
        "css-lsp",
        "svelte-language-server",
        "prettier",
      },
    },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = function()
      local default_opts = require "nvchad.configs.treesitter"
      return vim.tbl_deep_extend("force", default_opts, {
        ensure_installed = vim.list_extend(default_opts.ensure_installed, { "html", "css", "go", "svelte" }),
      })
    end,
  },

  -- Auto close and rename HTML/JSX tags (VS Code-like behavior)
  {
    "windwp/nvim-ts-autotag",
    event = "InsertEnter",
    opts = {
      opts = {
        enable_close = true,
        enable_rename = true,
        enable_close_on_slash = false,
      },
      filetypes = { "html", "htm", "xml", "jsx", "tsx", "svelte" },
    },
  },
}
