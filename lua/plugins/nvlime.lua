return {
  "fukamachi/vlime",
  -- lazy = false, -- 必要に応じてコメントを外して遅延読み込みを無効化
  ft = { "lisp" }, -- Common Lispファイルを開いたときに読み込む
  dependencies = { "neovim/nvim-lspconfig" }, -- lspconfigに依存
  config = function()
    -- Vlimeサーバーへの接続設定
    -- Roswellでインストールしたvlime-loaderのパスを指定します
    vim.g.vlime_loader_path = vim.fn.expand("~/.roswell/impls/iolint/ccl-bin/vlime-loader.lisp")

    -- Lisp実装（SBCL）へのパスを設定
    -- 多くの場合はこれで動作しますが、環境に合わせて変更してください
    vim.g.vlime_lisp_implementations = {
      sbcl = {
        command = { "ros", "run", "--" },
      },
    }

    print("Vlime plugin configured!")
  end,
}

-- メモ

-- vlime(nvlime) + treesitter + nvim-cmp での補完
-- ただし完璧ではない、あくまでもREPLベースの対話環境

-- alive-lsp, cl-lspを使う
-- alive-lspは試したが動作しなかった -> 恐らくmasonとの相性が悪い