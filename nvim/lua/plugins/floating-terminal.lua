return {
  {
    "folke/snacks.nvim",
    opts = {
      terminal = {
        win = {
          position = "float",
          border = "rounded",
        },
      },
    },
    config = function(_, opts)
      require("snacks").setup(opts)

      -- Ghostty Iceberg
      vim.g.terminal_color_0 = "#161821" -- black
      vim.g.terminal_color_1 = "#e27878" -- red
      vim.g.terminal_color_2 = "#b4be82" -- green
      vim.g.terminal_color_3 = "#e2a478" -- yellow
      vim.g.terminal_color_4 = "#84a0c6" -- blue
      vim.g.terminal_color_5 = "#a093c7" -- magenta
      vim.g.terminal_color_6 = "#89b8c2" -- cyan
      vim.g.terminal_color_7 = "#c6c8d1" -- white
      vim.g.terminal_color_8 = "#6b7089" -- bright black
      vim.g.terminal_color_9 = "#e98989" -- bright red
      vim.g.terminal_color_10 = "#c0ca8e" -- bright green
      vim.g.terminal_color_11 = "#e9b189" -- bright yellow
      vim.g.terminal_color_12 = "#91acd1" -- bright blue
      vim.g.terminal_color_13 = "#ada0d3" -- bright magenta
      vim.g.terminal_color_14 = "#95c4ce" -- bright cyan
      vim.g.terminal_color_15 = "#d2d4de" -- bright white
    end,
  },
}
