-- ~/.config/nvim/lua/custom/plugins/lspconfig.lua

-- NvChadのデフォルトLSP設定を適用
local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities
local lspconfig = require "lspconfig"

-- 使用するLSPサーバー一覧
local servers = { "html", "cssls", "pyright", "lua_ls" }

-- mason-lspconfigでLSPの自動インストール
require("mason-lspconfig").setup {
  ensure_installed = vim.list_extend(servers),
}

-- 各LSPサーバーの設定を適用
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
  }
end

-- alive-lsp の設定を追加
lspconfig.alive_lsp = {
  default_config = {
    cmd = {
      "ros", "run",
      "--eval", "(require :asdf)",
      "--eval", "(asdf:load-system :alive-lsp)",
      "--eval", "(alive/server:start)"
    },
    filetypes = { "lisp" },
    -- root_dir = lspconfig.util.root_pattern(".git", "."),
    root_dir = lspconfig.util.path.dirname,
    settings = {},
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
  },
}

lspconfig.alive_lsp.setup(lspconfig.alive_lsp.default_config)

return lspconfig
