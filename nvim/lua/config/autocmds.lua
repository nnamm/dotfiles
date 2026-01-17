-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- Turn off paste mode when leaving insert
vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = "*",
  command = "set nopaste",
})

-- Fix conceallevel
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "json", "jsonc", "markdown" },
  callback = function()
    vim.wo.conceallevel = 0
  end,
})

-- Disable spell check in Markdown (override LazyVim's wrap_spell)
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "markdown" },
  callback = function()
    vim.opt_local.spell = false
  end,
})

-- Automatically navigate to the project root when opening Markdown file
-- To ensure configuration file like .markdownlint.json are loaded reliaby
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*.md",
  callback = function()
    local root = vim.fs.find({ ".git", ".markdownlint.json" }, {
      upward = true,
      path = vim.fn.expand("%:p:h"),
    })[1]

    if root then
      vim.cmd("lcd " .. vim.fn.fnamemodify(root, ":h"))
    end
  end,
})
