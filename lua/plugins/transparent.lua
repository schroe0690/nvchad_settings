-- 透過用のプラグイン
return {
    "xiyaowong/transparent.nvim",
    lazy = false,
    config = function()
      require("transparent").setup({
        groups = {
          'Normal', 'NormalNC', 'Comment', 'Constant', 'Special', 'Identifier',
          'Statement', 'PreProc', 'Type', 'Underlined', 'Todo', 'String', 'Function',
          'Conditional', 'Repeat', 'Operator', 'Structure', 'LineNr', 'NonText',
          'SignColumn', 'CursorLine', 'CursorLineNr', 'StatusLine', 'StatusLineNC',
          'EndOfBuffer',
        },
        extra_groups = {
          "NormalFloat", "NvimTreeNormal", "NvimTreeEndOfBuffer", "TelescopeNormal",
          "TelescopeBorder", "WhichKeyFloat", "FloatBorder",
        },
        exclude_groups = {},
      })
      -- デフォルトで透過を有効化
      vim.cmd("TransparentEnable")
    end,
}