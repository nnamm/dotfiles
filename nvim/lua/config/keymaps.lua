-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- Increment / Decrement
keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")

-- Delete a word backwards
keymap.set("n", "dw", "vb_d")

-- New tab
keymap.set("n", "te", ":tabedit ", opts)
keymap.set("n", "tn", ":tabnew<Return>", opts)

-- Split window
keymap.set("n", "ss", ":split<Return>", opts)
keymap.set("n", "sv", ":vsplit<Return>", opts)

-- Move window
keymap.set("", "sh", "<C-w>h")
keymap.set("", "sk", "<C-w>k")
keymap.set("", "sj", "<C-w>j")
keymap.set("", "sl", "<C-w>l")

-- Resize window
keymap.set("n", "<C-w>h", "<C-w><") -- left
keymap.set("n", "<C-w>l", "<C-w>>") -- right
keymap.set("n", "<C-w>k", "<C-w>+") -- up
keymap.set("n", "<C-w>j", "<C-w>-") -- down

-- only Windows (WSL)
keymap.set("n", "<C-S-u>", "<C-u>")
keymap.set("n", "<C-S-d>", "<C-d>")
keymap.set("n", "<C-S-f>", "<C-f>")
keymap.set("n", "<C-S-b>", "<C-b>")

-- Diagnostics
keymap.set("n", "<C-j>", function()
  vim.diagnostic.goto_next()
end)
