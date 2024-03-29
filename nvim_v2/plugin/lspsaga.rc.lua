local status, saga = pcall(require, "lspsaga")
if (not status) then return end

saga.setup({code_action_lightbulb = {enable = false}, server_filetype_map = {}})

-- Ref: https://github.com/glepnir/lspsaga.nvim
local opts = {noremap = true, silent = true}
vim.keymap.set('n', '<C-j>', '<cmd>Lspsaga diagnostic_jump_next<CR>', opts)
vim.keymap.set('n', 'K', '<cmd>Lspsaga hover_doc<CR>', opts)
vim.keymap.set('n', 'gl', '<cmd>Lspsaga lsp_finder<CR>', opts)
vim.keymap.set('n', 'gp', '<cmd>Lspsaga peek_definition<CR>', opts)
vim.keymap.set('n', '<Leader>a', '<cmd>Lspsaga code_action<CR>', opts)
vim.keymap.set('n', '<Leader>o', '<cmd>Lspsaga outline<CR>', opts)
vim.keymap.set('n', '<Leader>r', '<cmd>Lspsaga rename<CR>', opts)
