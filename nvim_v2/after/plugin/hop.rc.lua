local status, hop = pcall(require, "hop")
if (not status) then return end

hop.setup()

vim.api.nvim_set_keymap('n', '<leader>j', ":HopWord<CR>", { silent = true })
vim.api.nvim_set_keymap('n', '<leader>c', ":HopChar2<CR>", { silent = true })
