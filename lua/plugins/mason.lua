local M = {
  {
    "williamboman/mason.nvim",
    cmd = { "Mason", "MasonInstall", "MasonUninstall", "MasonUninstallAll", "MasonLog" },
    opts = {
      ensure_installed = {
        -- LSP
        "lua-language-server",
        "pyright",
        "typescript-language-server",
        "css-lsp",
        "html-lsp",
        "json-lsp",
        
        -- Linter
        "eslint_d",
        "flake8",
        
        -- Formatter
        "prettier",
        "stylua",
        "black",
      },
      PATH = "skip",
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    },
    config = function(_, opts)
      require("mason").setup(opts)
      
      -- After setting up mason, install the servers
      local mr = require("mason-registry")
      for _, tool in ipairs(opts.ensure_installed) do
        local p = mr.get_package(tool)
        if not p:is_installed() then
          p:install()
        end
      end
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        "lua_ls",
        "pyright",
        "tsserver",
        "cssls",
        "html",
        "jsonls",
      },
      automatic_installation = true,
    },
  },
}

return M 