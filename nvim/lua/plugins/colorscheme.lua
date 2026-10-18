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
  --  others                       --
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
  --   "gbprod/nord.nvim",
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     require("nord").setup({
  --       transparent = false,
  --       terminal_colors = true,
  --       diff = { mode = "bg" }, -- "bg" | "fg"
  --       borders = true, -- ウィンドウ区切りの線を表示する
  --       errors = { mode = "bg" }, -- "bg" | "fg" | "none"
  --       search = { theme = "vim" }, -- "vim" | "vscode"
  --       styles = {
  --         comments = { italic = true },
  --         keywords = {},
  --         functions = {},
  --         variables = {},
  --       },
  --     })
  --     vim.cmd.colorscheme("nord")
  --   end,
  -- },

  -- {
  --   "AlexvZyl/nordic.nvim",
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     vim.cmd.colorscheme("nordic")
  --   end,
  -- },

  -- { "cocopon/iceberg.vim", lazy = true },

  -- {
  --   "Shatur/neovim-ayu",
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     require("ayu").setup({
  --       -- overrides = {},
  --       overrides = function()
  --         local colors = require("ayu.colors")
  --         return { Comment = { fg = colors.comment, italic = true } }
  --       end,
  --     })
  --     vim.cmd.colorscheme("ayu-mirage")
  --   end,
  -- },
}
