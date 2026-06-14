return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        gopls = {
          settings = {
            gopls = {
              staticcheck = true,
              analyses = {
                unusedparams = true,
              },
              gofumpt = true,
              memoryMode = "DegradeClosed",
              -- expandWorkspaceToModule = true,
            },
          },
        },
      },
    },

    -- nvim-cmp
    -- Use the Tab-key to confirm a candidate
    -- {
    --   "hrsh7th/nvim-cmp",
    --   opts = function(_, opts)
    --     local cmp = require("cmp")
    --     opts.mapping = vim.tbl_extend("force", opts.mapping, {
    --       ["<Tab>"] = cmp.mapping.confirm({ select = true }),
    --     })
    --     return opts
    --   end,
    -- },

    -- snippets
    -- {
    --   "garymjr/nvim-snippets",
    --   opts = {
    --     friendly_snippets = true,
    --     search_paths = { vim.fn.stdpath("config") .. "/snippets" },
    --   },
    --   dependencies = {
    --     "rafamadriz/friendly-snippets",
    --   },
    -- },
  },

  -- conform.nvim: formatters
  -- Format GLSL with clang-format (same as C/C++)
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        glsl = { "clang_format" },
      },
    },
  },
}
