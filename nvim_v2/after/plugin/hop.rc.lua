local status, hop = pcall(require, "hop")
if (not status) then return end

hop.setup()

vim.api.nvim_set_keymap('n', '<leader>w', ":HopWord<CR>", { silent = true })
vim.api.nvim_set_keymap('n', '<leader>j', ":HopChar2<CR>", { silent = true })
