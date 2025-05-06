require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- コメントアウトのキーマッピング
-- NormalモードでSpace + / にコメントトグルを割り当て
map("n", "<leader>/", function()
    require("Comment.api").toggle.linewise.current()
  end, { noremap = true, silent = true, desc = "Toggle comment line" })
  
  -- VisualモードでSpace + / にコメントトグルを割り当て
  map("v", "<leader>/", function()
    require("Comment.api").toggle.linewise(vim.fn.visualmode())
  end, { noremap = true, silent = true, desc = "Toggle comment visual" })


