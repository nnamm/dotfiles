-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- Increment/Decremant
keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")

-- Delete a word backwards
keymap.set("n", "dw", "vb_d")

-- Select all
-- keymap.set("n", "<C-a>", "gg<S-v>G")

-- Jumplist
-- keymap.set("n", "<C-m">, "<C-i>", opts)

-- New tab
keymap.set("n", "te", ":tabedit ", opts)
keymap.set("n", "tn", ":tabnew<Return>", opts)
-- keymap.set("n", "<tab>", ":tabnext<Return>", opts)
-- keymap.set("n", "<s-tab>", ":tabprev<Return>", opts)
-- keymap.set("n", "<C-]>", ":tabnext<Return>", opts)
-- keymap.set("n", "<C-[>", ":tabprev<Return>", opts)

-- Split window
keymap.set("n", "ss", ":split<Return>", opts)
keymap.set("n", "sv", ":vsplit<Return>", opts)
-- Move window
keymap.set("", "sh", "<C-w>h")
keymap.set("", "sk", "<C-w>k")
keymap.set("", "sj", "<C-w>j")
keymap.set("", "sl", "<C-w>l")

-- Resize window
keymap.set("n", "<C-w><left>", "<C-w><")
keymap.set("n", "<C-w><right>", "<C-w>>")
keymap.set("n", "<C-w><up>", "<C-w>+")
keymap.set("n", "<C-w><down>", "<C-w>-")

-- Delete a word at cursor position
keymap.set("i", "<C-d>", "<del>")

-- Diagnostics
keymap.set("n", "<C-j>", function()
  vim.diagnostic.goto_next()
end)

-- for Windows (WSL)
keymap.set("n", "<C-S-u>", "<C-u>")
keymap.set("n", "<C-S-d>", "<C-d>")
keymap.set("n", "<C-S-f>", "<C-f>")
keymap.set("n", "<C-S-b>", "<C-b>")
