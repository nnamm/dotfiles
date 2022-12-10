local keymap = vim.keymap

vim.g.mapleader = ','

-- Do not yank with x
keymap.set('n', 'x', '"_x')
keymap.set('v', 'x', '"_x')

-- Increment/decrement
keymap.set('n', '+', '<C-a>')
keymap.set('n', '-', '<C-x>')

-- Delete a word backwards
keymap.set('n', 'dw', 'vb"_d')

-- Select all
keymap.set('n', '<C-a>', 'gg<S-v>G')

-- New tab
keymap.set('n', 'te', ':tabedit ')
keymap.set('n', 'tn', ':tabnew<CR> ', {silent = true})
keymap.set('n', 'ss', ':split<CR><C-w>w', {silent = true})
keymap.set('n', 'sv', ':vsplit<CR><C-w>w', {silent = true})
-- Move tab
-- keymap.set('n', '<C-_>', ':bprevious<Return>', { silent = true })
-- keymap.set('n', '<C-]>', ':bnext<Return>', { silent = true })
-- Move window
keymap.set('n', '<Space>', '<C-w>w')
keymap.set('', 'sh', '<C-w>h')
keymap.set('', 'sk', '<C-w>k')
keymap.set('', 'sj', '<C-w>j')
keymap.set('', 'sl', '<C-w>l')
-- Resize window
keymap.set('n', '<C-w><RIGHT>', '<C-w>>')
keymap.set('n', '<C-w><LEFT>', '<C-w><')
keymap.set('n', '<C-w><UP>', '<C-w>+')
keymap.set('n', '<C-w><DOWN>', '<C-w>-')

-- Clear search highlight
keymap.set('n', '<ESC><ESC>', ':set nohlsearch<Return>', {silent = true})

-- Cursor control
keymap.set('i', '<C-f>', '<RIGHT>')
keymap.set('i', '<C-b>', '<LEFT>')
keymap.set('i', '<C-p>', '<UP>')
keymap.set('i', '<C-n>', '<DOWN>')

-- Delete a word at cursor position
keymap.set('i', '<C-d>', '<DEL>')

-- Plugins
keymap.set('n', 'tm', ':Template ') -- vim-sonictemplate
