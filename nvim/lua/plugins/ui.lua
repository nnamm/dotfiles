return {
  -- buffer line
  {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    keys = {
      { "<tab>", "<Cmd>BufferLineCycleNext<CR>", desc = "Next tab" },
      { "<s-tab>", "<Cmd>BufferLineCyclePrev<CR>", desc = "Prev tab" },
    },
    config = function()
      -- local bufferline = require("bufferline")
      require("bufferline").setup({
        options = {
          mode = "buffers",
          indicator = {
            icon = "",
            style = "none",
          },
          -- style_preset = bufferline.style_preset.no_italic,
          separator_style = { "/", "/" },
          show_buffer_icons = true,
          show_buffer_close_icons = false,
          show_close_icon = false,
          show_tab_indicators = true,
          color_icons = true,
          always_show_bufferline = true,
        },
      })
    end,
  },

  -- notification messages
  {
    "folke/noice.nvim",
    opts = function(_, opts)
      table.insert(opts.routes, {
        filter = {
          event = "notify",
          find = "No information available",
        },
        opts = { skip = true },
      })

      opts.presets.lsp_doc_border = true
    end,
  },

  -- notification messages timeout
  {
    "rcarriga/nvim-notify",
    opts = {
      timeout = 5000,
    },
  },
}
