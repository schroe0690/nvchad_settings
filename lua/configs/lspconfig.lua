-- 読み込むlspの設定ファイル

-- デフォルト設定を適用
require("nvchad.configs.lspconfig").defaults()

-- 読み込むlspの一覧
local servers = { "html", "cssls", "pyright"}
vim.lsp.enable(servers)

