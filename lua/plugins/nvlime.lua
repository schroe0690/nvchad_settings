return {
  "monkoose/nvlime",
  -- ft = "lisp", -- lispファイルを開いた際に有効化
  ft = { "lisp", "lsp", "cl", "lispworks" },
  lazy = false,
  dependencies = {
    "monkoose/parsley"
  },
  config = function()
    -- Swankサーバーへの自動接続設定（任意）
    vim.g.nvlime_auto_connect = {
      host = "127.0.0.1",
      port = 4005,
    }
  end,
}
  