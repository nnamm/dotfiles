return {
  -----------------------------------
  --  suggestions for dark themes  --
  -----------------------------------
  -- "rose-pine/neovim",
  -- name = "rose-pine",
  -- opts = {
  --   styles = { bold = true, italic = true, transparency = true },
  --   palette = {
  --     main = {
  --       _nc = "#16141f",
  --       base = "#191724",
  --       surface = "#1f1d2e",
  --       overlay = "#26233a",
  --       muted = "#6e6a86",
  --       subtle = "#908caa",
  --       text = "#e0def4",
  --       love = "#eb6f92",
  --       -- gold = "#f6c177", -- original
  --       gold = "#e6c087",
  --       rose = "#ebbcba",
  --       pine = "#31748f",
  --       -- foam = "#9ccfd8", -- original
  --       foam = "#c5e5ea",
  --       iris = "#c4a7e7",
  --       leaf = "#95b1ac",
  --       highlight_low = "#21202e",
  --       highlight_med = "#403d52",
  --       highlight_high = "#524f67",
  --       none = "NONE",
  --     },
  --   },
  --   highlight_groups = {},
  -- },

  -- "shaunsingh/nord.nvim",
  -- lazy = false,
  -- priority = 1000,
  -- config = function()
  --   vim.cmd([[colorscheme nord]])
  --   vim.g.nord_contrast = true
  --   vim.g.nord_borders = false
  --   vim.g.nord_disable_background = true
  --   vim.g.nord_cursorline_transparent = true
  --   vim.g.nord_enable_sidebar_background = false
  --   vim.g.nord_italic = true
  --   vim.g.nord_uniform_diff_background = true
  --   vim.g.nord_bold = true
  --   require("nord").set()
  -- end,

  -- "andersevenrud/nordic.nvim",
  -- lazy = false,
  -- priority = 1000,
  -- config = function()
  --   vim.g.nord_underline_option = "none"
  --   vim.g.nord_italic = true
  --   vim.g.nord_italic_comments = true
  --   vim.g.nord_minimal_mode = false
  --   vim.g.nord_alternate_backgrounds = false
  --   vim.cmd("colorscheme nordic")
  -- end,

  -- "cocopon/iceberg.vim",
  -- lazy = false,
  -- priority = 1000,

  "fenetikm/falcon",
  lazy = false,
  priority = 1000,
  config = function()
    vim.g.falcon_inactive = 1
    vim.g.falcon_background = 0
    vim.cmd("colorscheme falcon")
  end,

  -----------------------------------
  --  suggestions for light theme  --
  -----------------------------------
  -- "EdenEast/nightfox.nvim",
  -- lazy = false,
  -- priority = 1000,

  -- "talha-akram/noctis.nvim",
  -- lazy = false,
  -- priority = 1000,

  -- "savq/melange-nvim",
  -- lazy = false,
  -- priority = 1000,
}
