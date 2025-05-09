return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },
  
  -- nvim/init.luaでpluginsフォルダをまとめて読み込むため
  -- 以下はここでは呼び出さない

  -- require("plugins.transparent")
  -- require("plugins.file-tree")
  -- require("plugins.comment-out")
  -- require("plugins.nvlime")
  -- require("plugins.parsley")
  
}
