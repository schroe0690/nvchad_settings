return {
  "vlime/vlime",
  rtp = "vim/",
  lazy = false,
  config = function()
    -- Vlimeの自動ウィンドウ生成を抑制
    vim.g.vlime_window_settings = {
      sldb = { pos = "belowright", size = 20 },
      repl = { pos = "belowright", size = 10 },
      inspector = { pos = "belowright", size = 10 },
      preview = { pos = "belowright", size = 10 },
      arglist = { pos = "belowright", size = 10 },
      notes = { pos = "belowright", size = 10 },
      threads = { pos = "belowright", size = 10 },
      server = { pos = "belowright", size = 10 },
    }
    -- 自動レイアウトを無効化
    vim.g.vlime_window_auto_layout = 0
    
    -- 補完設定
    vim.g.vlime_enable_autodoc = 1  -- 自動ドキュメント表示を有効化
    vim.g.vlime_compiler_policy = {
      DEBUG = 3,
      SAFETY = 3,
      SPEED = 0,
    }

    -- vlimeサーバーの自動起動
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "lisp",
      callback = function()
        -- 既にVlimeサーバーが起動していなければ起動
        -- NeovimのターミナルでVlimeサーバーを起動
        vim.cmd('botright split | terminal sbcl --load ~/.local/share/nvim/lazy/vlime/vim/lisp/start-vlime.lisp')
      end,
    })
  end,
  dependencies = {
    "hrsh7th/nvim-cmp",
  },
}