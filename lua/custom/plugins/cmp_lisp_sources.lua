print("Attempting to load cmp_lisp_sources.lua ...")

return {
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      print("Executing opts function in cmp_lisp_sources.lua")
      local new_vlime_source = {
        name = "vlime",
        group_index = 1, -- 他のソースより優先度を高くする（必要に応じて調整）
        cond = function() -- lisp または commonlisp ファイルタイプのときのみ有効
          local buftype = vim.bo.filetype
          return buftype == "lisp" or buftype == "commonlisp"
        end,
      }

      -- opts.sources がテーブルであることを確認
      if type(opts.sources) ~= "table" then
        opts.sources = {}
      end

      -- vlime ソースが既に存在するかチェック
      local vlime_source_exists = false
      for _, existing_source in ipairs(opts.sources) do
        if existing_source.name == "vlime" then
          vlime_source_exists = true
          break
        end
      end

      if not vlime_source_exists then
        table.insert(opts.sources, 1, new_vlime_source)
        print("nvim-cmp: Added vlime source.") -- 確認用
      else
        print("nvim-cmp: vlime source already exists.") -- 確認用
      end

      -- Ensure snippets are configured if not already by NvChad's defaults
      -- This is a common setup for nvim-cmp
      if not opts.snippet then
        opts.snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        }
      end
      
      -- Ensure common mappings are present if you are overriding or NvChad doesn't set them globally
      -- This is just an example, NvChad likely has its own preferred way or pre-configured mappings
      if not opts.mapping or vim.tbl_isempty(opts.mapping) then -- マッピングが空の場合のみ設定
        local cmp = require("cmp")
        opts.mapping = cmp.mapping.preset.insert({
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item.
        })
      end

      return opts
    end,
  },
} 