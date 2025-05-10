-- ~/.config/nvim/lua/custom/plugins/init.lua

return {
    -- parsley (nvlimeの依存)
    {
      "monkoose/parsley",
      lazy = false,
    },
    -- nvlime本体
    {
      "monkoose/nvlime",
      dependencies = { "monkoose/parsley" },
      ft = { "lisp", "commonlisp" }, -- Lispファイルで自動起動
      config = function()
        -- 必要に応じてnvlimeの設定をここに書く
        vim.g.nvlime_config = {
          implementation = "sbcl",  -- SBCLを使用
          implementation_cmd = {
            "sbcl", "--load", "~/.local/share/nvim/lazy/nvlime/lisp/start-nvlime.lisp" }
        }
        
        -- lispファイルを開いた時にnvlimeを自動的に起動
        vim.api.nvim_create_autocmd("FileType", {
          pattern = { "lisp", "commonlisp" },
          callback = function()
            vim.cmd("NvlimeStart")
          end
        })
      end,
    },
}
  