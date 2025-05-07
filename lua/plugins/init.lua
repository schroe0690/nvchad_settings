return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- 透過用のプラグイン
  {
    "xiyaowong/transparent.nvim",
    lazy = false,
    config = function()
      require("transparent").setup({
        groups = {
          'Normal', 'NormalNC', 'Comment', 'Constant', 'Special', 'Identifier',
          'Statement', 'PreProc', 'Type', 'Underlined', 'Todo', 'String', 'Function',
          'Conditional', 'Repeat', 'Operator', 'Structure', 'LineNr', 'NonText',
          'SignColumn', 'CursorLine', 'CursorLineNr', 'StatusLine', 'StatusLineNC',
          'EndOfBuffer',
        },
        extra_groups = {
          "NormalFloat", "NvimTreeNormal", "NvimTreeEndOfBuffer", "TelescopeNormal",
          "TelescopeBorder", "WhichKeyFloat", "FloatBorder",
        },
        exclude_groups = {},
      })
      -- デフォルトで透過を有効化
      vim.cmd("TransparentEnable")
    end,
  },

  -- ファイルツリーの設定
  {
    "nvim-tree/nvim-tree.lua",
    lazy = false,
    config = function()
      require("nvim-tree").setup({
        view = {
          width = 25,
          side = "left",
        },
        git = {
          enable = true,
        },
        renderer = {
          highlight_git = true,
          icons = {
            show = {
              git = true,
            },
          },
        },
      })
      -- 起動時にNvimTreeを開く
      vim.api.nvim_create_autocmd({ "VimEnter" }, {
        callback = function()
          require("nvim-tree.api").tree.open()
        end,
      })
    end,
  },

  -- コメントアウト用のプラグイン
  {
    "numToStr/Comment.nvim",
    lazy = false,
    config = function()
      require("Comment").setup()
    end,
  },

  -- LSP設定
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "hrsh7th/nvim-cmp",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
    },
    config = function()
      local lspconfig = require("lspconfig")
      local cmp = require("cmp")
      local luasnip = require("luasnip")

      -- LSPの設定
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      
      -- Python LSP
      lspconfig.pyright.setup({
        capabilities = capabilities,
        settings = {
          python = {
            analysis = {
              typeCheckingMode = "basic",
              autoSearchPaths = true,
              useLibraryCodeForTypes = true,
            },
          },
        },
      })

      -- TypeScript/React LSP
      lspconfig.tsserver.setup({
        capabilities = capabilities,
        settings = {
          typescript = {
            inlayHints = {
              includeInlayParameterNameHints = "all",
              includeInlayParameterNameHintsWhenArgumentMatchesName = false,
              includeInlayFunctionParameterTypeHints = true,
              includeInlayVariableTypeHints = true,
              includeInlayPropertyDeclarationTypeHints = true,
              includeInlayFunctionLikeReturnTypeHints = true,
              includeInlayEnumMemberValueHints = true,
            },
          },
        },
      })

      -- 補完の設定
      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "buffer" },
          { name = "path" },
        }),
      })
    end,
  },

  -- Treesitter設定
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "python",
          "javascript",
          "typescript",
          "tsx",
          "html",
          "css",
          "json",
        },
        highlight = {
          enable = true,
        },
        indent = {
          enable = true,
        },
      })
    end,
  },

  -- Vlime for LISP
  {
    "vlime/vlime",
    lazy = false,
    config = function()
      vim.g.vlime_leader = "\\"
      vim.g.vlime_enable_autodoc = true
      vim.g.vlime_window_settings = {
        repl = {
          position = "right",
          size = 80,
        },
      }
      
      -- 補完設定
      vim.g.vlime_enable_autodoc = true
      vim.g.vlime_enable_autodoc_on_hover = true
      vim.g.vlime_enable_autodoc_on_completion = true
      vim.g.vlime_enable_autodoc_on_completion_delay = 0.5
      
      -- キーマッピング
      vim.api.nvim_set_keymap('i', '<C-Space>', '<Plug>VlimeComplete', {noremap = false})
      vim.api.nvim_set_keymap('n', '<C-Space>', '<Plug>VlimeComplete', {noremap = false})
      
      -- 補完メニューの設定
      vim.g.vlime_completion_menu = {
        enabled = true,
        max_items = 20,
        min_chars = 2,
      }
    end,
  },
}
