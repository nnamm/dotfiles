return {
  -- "rose-pine/neovim",
  -- name = "rose-pine",
  -- opts = {
  --   styles = { bold = true, italic = true, transparency = true },
  --   -- groups = { border = "pine" },
  -- },

  "shaunsingh/nord.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    vim.cmd([[colorscheme nord]])
    vim.g.nord_contrast = true
    vim.g.nord_borders = false
    vim.g.nord_disable_background = true
    vim.g.nord_cursorline_transparent = true
    vim.g.nord_enable_sidebar_background = false
    vim.g.nord_italic = true
    vim.g.nord_uniform_diff_background = true
    vim.g.nord_bold = true
    require("nord").set()
  end,

  -- "neanias/everforest-nvim",
  -- version = false,
  -- lazy = false,
  -- priority = 1000,
  -- config = function()
  --   require("everforest").setup({
  --     background = "hard",
  --     transparent_background_level = 0,
  --   })
  -- end,
}
