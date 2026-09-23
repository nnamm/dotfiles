return {
  -----------------------------------
  --  active theme                 --
  -----------------------------------
  {
    "fenetikm/falcon",
    lazy = false,
    priority = 1000,
    config = function()
      vim.g.falcon_background = 0
      vim.g.falcon_inactive = 1
      vim.api.nvim_create_autocmd("ColorScheme", {
        pattern = "falcon",
        callback = function()
          vim.api.nvim_set_hl(0, "LspInlayHint", { link = "Comment" })
        end,
      })
      vim.cmd.colorscheme("falcon")
    end,
  },

  -----------------------------------
  --  suggestions for dark themes  --
  -----------------------------------
  -- {
  --   "54L1M/Oshen.nvim",
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     require("oshen").setup({
  --       transparent = false, -- set false for opaque background
  --     })
  --     vim.cmd.colorscheme("oshen-night") -- or "oshen-day" for light
  --   end,
  -- },

  -- {
  --   "rose-pine/neovim",
  --   name = "rose-pine",
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     require("rose-pine").setup({
  --       variant = "main", -- "auto" | "main" | "moon" | "dawn"
  --       styles = { bold = true, italic = true, transparency = true },
  --       -- only overrides; merged into the default palette via vim.tbl_extend
  --       palette = {
  --         main = {
  --           -- gold = "#e6c087", -- original: #f6c177
  --           -- foam = "#c5e5ea", -- original: #9ccfd8
  --         },
  --       },
  --       highlight_groups = {},
  --     })
  --     vim.cmd.colorscheme("rose-pine")
  --   end,
  -- },

  -- {
  --   "shaunsingh/nord.nvim",
  --   lazy = true,
  --   init = function()
  --     vim.g.nord_contrast = true
  --     vim.g.nord_borders = false
  --     vim.g.nord_disable_background = true
  --     vim.g.nord_cursorline_transparent = true
  --     vim.g.nord_enable_sidebar_background = false
  --     vim.g.nord_italic = true
  --     vim.g.nord_uniform_diff_background = true
  --     vim.g.nord_bold = true
  --   end,
  -- },

  -- {
  --   "andersevenrud/nordic.nvim",
  --   lazy = true,
  --   init = function()
  --     vim.g.nord_underline_option = "none"
  --     vim.g.nord_italic = true
  --     vim.g.nord_italic_comments = true
  --     vim.g.nord_minimal_mode = false
  --     vim.g.nord_alternate_backgrounds = false
  --   end,
  -- },

  -- { "cocopon/iceberg.vim", lazy = true },

  -- {
  --   "Shatur/neovim-ayu",
  --   lazy = true,
  --   main = "ayu",
  --   opts = {
  --     mirage = true,
  --     terminal = true,
  --     -- overrides = function()
  --     --   local colors = require("ayu.colors")
  --     --   return { Comment = { fg = colors.comment, italic = true } }
  --     -- end,
  --     overrides = {},
  --   },
  -- },

  -----------------------------------
  --  suggestions for light theme  --
  -----------------------------------
  -- { "EdenEast/nightfox.nvim", lazy = true },
  -- { "talha-akram/noctis.nvim", lazy = true },
  -- { "savq/melange-nvim", lazy = true },
}
