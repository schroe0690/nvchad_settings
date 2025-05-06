-- This file needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :( 

---@type ChadrcConfig
local M = {}

-- テーマの設定
M.base46 = {
	theme = "scaryforest",
}

-- ファイルツリーの設定
M.nvimtree = {
  view = {
    width = 15,  -- ファイルツリーの幅を30に設定
    side = "left",  -- 左側に表示
  },
  git = {
    enable = true,  -- Gitの状態を表示
  },
  renderer = {
    highlight_git = true,  -- Gitの状態をハイライト
    icons = {
      show = {
        git = true,  -- Gitアイコンを表示
      },
    },
  },
}

return M
