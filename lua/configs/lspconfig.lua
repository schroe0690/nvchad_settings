-- ~/.config/nvim/lua/custom/plugins/lspconfig.lua

-- NvChadのデフォルトLSP設定を適用
local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities
local lspconfig = require "lspconfig"

-- LSPサーバー一覧
local servers = { "html", "cssls", "pyright" } -- alive_lspは個別に設定するため、ここからは削除

-- alive-lsp（Common Lisp用LSP）の個別セットアップ
lspconfig.alive_lsp.setup {
  cmd = {
    "sbcl",
    "--load", "~/quicklisp/setup.lisp",
    "--eval", "(ql:quickload :alive-lsp)",
    "--eval", "(alive/server:start)"
  },
  filetypes = { "lisp", "lsp", "commonlisp" },
  root_dir = lspconfig.util.root_pattern(".git", "."),
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
}