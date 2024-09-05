return {
  -- nvim-vmp
  -- Use the Tab-key to confirm a candidate
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      local cmp = require("cmp")
      opts.mapping = vim.tbl_extend("force", opts.mapping, {
        ["<Tab>"] = cmp.mapping.confirm({ select = true }),
      })
      return opts
    end,
  },

  -- snippets
  {
    "garymjr/nvim-snippets",
    opts = {
      friendly_snippets = true,
      search_paths = { vim.fn.stdpath("config") .. "/lua/snippets" },
    },
    dependencies = { "rafamadriz/friendly-snippets" },
  },
}
