-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.g.mapleader = " "
vim.g.lazyvim_picker = "snacks"

vim.scriptencoding = "utf-8"
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"

vim.wo.number = true
vim.wo.relativenumber = true

vim.opt.shell = "fish"
vim.opt.title = true
vim.opt.hlsearch = true
vim.opt.backup = false
vim.opt.showcmd = true
vim.opt.cmdheight = 1
vim.opt.laststatus = 0
vim.opt.scrolloff = 10
vim.opt.backupskip = { "/tmp/*", "/private/tmp/*" } -- Unix, Mac
vim.opt.inccommand = "split"
vim.opt.ignorecase = true

vim.opt.autoindent = true
vim.opt.breakindent = true
vim.opt.smartindent = true
vim.opt.wrap = false

vim.opt.expandtab = true
vim.opt.smarttab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2

vim.opt.path:append({ "**" }) -- Finding files - Search down into subfolders
vim.opt.wildignore:append({ "*/node_modules/*" })

-- Undercurl
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])
vim.opt.termguicolors = true

-- Background (for colorscheme)
-- vim.o.background = "light"

-- shiftwidth/tabstop
vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
  pattern = { "*.go", "*.c", "*.cpp", "*.h", "*.hpp", "*.vert", "*.flag" },
  callback = function()
    vim.opt.shiftwidth = 4
    vim.opt.tabstop = 4
  end,
})

-- wrap for markdown files
vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
  pattern = { "*.md", "*.markdown" },
  callback = function()
    vim.opt.wrap = true
  end,
})

-- GLSL
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = { "*.vert", "*.frag" },
  callback = function()
    vim.bo.filetype = "glsl"
  end,
})
