-- ~/.config/nvim/lua/custom/plugins/lspconfig.lua

-- NvChadのデフォルトLSP設定を適用
local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities
local lspconfig = require "lspconfig"

-- mason-lspconfigでLSPの自動インストール
require("mason-lspconfig").setup {
  ensure_installed = { "html", "cssls", "pyright", "lua-language-server" },
}

-- LSPサーバー一覧
local servers = { "html", "cssls", "pyright", "lua-language-server" }

-- 各LSPサーバーの設定を適用
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
  }
end

return lspconfig
