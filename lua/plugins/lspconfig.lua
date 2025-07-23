-- ~/.config/nvim/lua/plugins/lspconfig.lua
-- (masonで管理するLSPサーバー専用)

return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    require "nvchad.configs.lspconfig"

    local lspconfig = require "lspconfig"
    local on_attach = require("nvchad.configs.lspconfig").on_attach
    local capabilities = require("nvchad.configs.lspconfig").capabilities
    local on_init = require("nvchad.configs.lspconfig").on_init

    -- masonで管理するLSPサーバーのリスト
    local servers = {
      "html",
      "cssls",
      "pyright",
      "lua_ls",
    }

    require("mason-lspconfig").setup {
      ensure_installed = servers,
    }

    for _, server_name in ipairs(servers) do
      lspconfig[server_name].setup {
        on_attach = on_attach,
        capabilities = capabilities,
        on_init = on_init,
      }
    end
  end,
}