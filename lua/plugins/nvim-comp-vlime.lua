return {
    "HiPhish/nvim-cmp-vlime",
    dependencies = { "vlime/vlime" },
    config = function()
      local cmp = require("cmp")
      cmp.setup.filetype("lisp", {
        sources = cmp.config.sources({
          { name = "vlime" },
        }, {
          { name = "buffer" },
        }),
      })
    end,
}
  