return {
    "monkoose/nvlime",
    ft = "lisp",
    config = function()
      -- Swankサーバーへの自動接続設定（任意）
      vim.g.nvlime_auto_connect = {
        host = "127.0.0.1",
        port = 4005,
      }
      -- 必要に応じて追加設定
    end,
  }
  