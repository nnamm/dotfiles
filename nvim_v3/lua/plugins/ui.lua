return {
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

  {
    "rcarriga/nvim-notify",
    opts = {
      timeout = 5000,
    },
  },

  {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    keys = {
      { "<tab>", "<Cmd>BufferLineCycleNext<CR>", desc = "Next tab" },
      { "<s-tab>", "<Cmd>BufferLineCyclePrev<CR>", desc = "Prev tab" },
    },
    opts = {
      options = {
        mode = "buffers",
        -- separator_style = "slant",
        show_buffer_close_icons = false,
        show_close_icon = false,
        color_icons = true,
        show_buffer_icons = true,
        always_show_bufferline = true,
      },
    },
  },
}
