-- nvim/lua/custom/plugins/init.lua

-- このファイルは、lua/custom/plugins/ ディレクトリ内の
-- 他のプラグイン設定ファイルをまとめて lazy.nvim に渡すためのものです。

-- cmp_lisp_sources.lua で定義された設定を読み込む
local cmp_lisp_settings = require("custom.plugins.cmp_lisp_sources")

-- 他にもこのディレクトリにプラグイン設定ファイルを追加した場合、
-- 同様に require し、以下のテーブルに結合していきます。
return {
  -- cmp_lisp_sources は "hrsh7th/nvim-cmp" の設定なので、
  -- cmp_lisp_sources が返すテーブルの各要素を展開してここに入れる
  unpack(cmp_lisp_settings),

  -- 例: 他のカスタムプラグイン設定があれば、ここに追加
  -- { "some_other_plugin/name", opts = {} },
  -- require("custom.plugins.another_plugin_config"),
} 