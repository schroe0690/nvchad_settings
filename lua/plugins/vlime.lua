return {
  "vlime/vlime",
  rtp = "vim/",
  lazy = false,
  -- config = function()
  --   -- ★ ここでVlimeの自動ウィンドウ生成を抑制
  --   vim.g.vlime_window_auto_layout = 0

  --   vim.api.nvim_create_autocmd("FileType", {
  --     pattern = "lisp",
  --     callback = function()
  --       -- 既にVlimeサーバーが起動していなければ起動
  --       -- NeovimのターミナルでVlimeサーバーを起動
  --       vim.cmd('botright split | terminal sbcl --load ~/.local/share/nvim/lazy/vlime/vim/lisp/start-vlime.lisp')
  --     end,
  --   })
  -- end,
}
