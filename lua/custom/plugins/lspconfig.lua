local lspconfig = require("lspconfig")
local mason_lspconfig = require("mason-lspconfig")

-- 自動インストールするLSPサーバーのリスト
mason_lspconfig.setup({
  automatic_installation = true,
  ensure_installed = {
    "lua_ls",           -- Lua
  },
})

-- LSPの共通設定
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- 各言語のLSP設定
mason_lspconfig.setup_handlers({
  function(server_name)
    lspconfig[server_name].setup({
      capabilities = capabilities,
    })
  end,
}) 