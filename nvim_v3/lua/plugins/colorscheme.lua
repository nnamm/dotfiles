return {
  {
    "ronisbr/nano-theme.nvim",
    init = function()
      vim.o.background = "dark"
    end,

    -- "shaunsingh/nord.nvim",
    -- lazy = true,
    -- priority = 1000,
    -- config = function()
    --   vim.g.nord_contrast = true
    --   vim.g.nord_borders = true
    --   vim.g.nord_disable_background = false
    --   vim.g.nord_italic = false
    --   vim.g.nord_uniform_diff_background = true
    --   vim.g.nord_bold = false
    --   require("nord").set()
    -- end,
  },
}
