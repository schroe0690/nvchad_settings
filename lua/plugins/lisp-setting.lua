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
      lazy = false, -- nvlime自体は早めにロードしてみる
    },
    -- nvlime の補完を nvim-cmp で使うためのソース
    {
      "HiPhish/nvim-cmp-vlime",
      dependencies = { "monkoose/nvlime", "hrsh7th/nvim-cmp" }, -- nvlime と nvim-cmp に依存
      -- ft = { "lisp", "commonlisp" }, -- cmp_lisp_sources.lua の cond で制御するのでここでは不要かも
    }
}
  