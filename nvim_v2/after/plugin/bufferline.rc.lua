local status, bufferline = pcall(require, "bufferline")
if (not status) then return end

bufferline.setup({
  options = {
    mode = "buffers",
    separator_style = { '|', '|' },
    always_show_bufferline = true,
    show_buffer_close_icons = false,
    show_close_icon = false,
    color_icons = true
  },
  highlights = {
    fill = {
      bg = '#bf616a'
    },
    background = {
      --fg = '#3b4252',
      fg = '#81a1c1',
      bg = '#2e3440'
    },
    buffer_visible = {
      fg = '#ebcb8b',
      bg = '#3b4252'
    },
    buffer_selected = {
      fg = '#ebcb8b',
      bg = '#3b4252',
      --bg = '#2e3440',
      bold = true
    },
    separator = {
      fg = '#81a1c1',
      bg = '#2e3440'
    },
  },
})

vim.keymap.set('n', '<C-]>', '<Cmd>BufferLineCycleNext<CR>', {})
vim.keymap.set('n', '<C-_>', '<Cmd>BufferLineCyclePrev<CR>', {})
