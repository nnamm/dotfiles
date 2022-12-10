local status, bufferline = pcall(require, "bufferline")
if (not status) then return end

bufferline.setup({
  options = {
    mode = "buffers",
    indicator = {style = "none"},
    -- diagnostics = "nvim_lsp",
    color_icons = true,
    show_buffer_icons = true,
    show_buffer_close_icons = false,
    show_close_icon = false,
    separator_style = {"|", "|"},
    always_show_bufferline = true
  },
  highlights = {
    fill = {bg = '#2e3440'},
    background = {fg = '#81a1c1', bg = '#2e3440'},
    buffer_visible = {fg = '#ebcb8b', bg = '#3b4252'},
    buffer_selected = {
      fg = '#ebcb8b',
      bg = '#3b4252',
      bold = true,
      italic = false
    },
    modified = {bg = '#2e3440'},
    modified_visible = {bg = '#2e3440'},
    modified_selected = {bg = '#3b4252'},
    separator = {fg = '#81a1c1', bg = '#2e3440'}
  }
})

vim.keymap.set('n', '<C-]>', '<Cmd>BufferLineCycleNext<CR>', {})
vim.keymap.set('n', '<C-_>', '<Cmd>BufferLineCyclePrev<CR>', {})
