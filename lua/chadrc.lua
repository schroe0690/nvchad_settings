-- This file needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :( 

---@type ChadrcConfig
local M = {}

-- テーマの設定
M.base46 = {
	theme = "scaryforest",
}

M.configs = {
  lspconfig = {
    servers = {
      cl_lsp = {
        cmd = {"cl-lsp" },
        -- filetypes = { "lisp" }, -- 最低限、:set ft? で確認したもの一つだけにする
      },
    },
  },
}


return M
