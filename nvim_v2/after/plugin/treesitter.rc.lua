local status, ts = pcall(require, "nvim-treesitter.configs")
if (not status) then return end

ts.setup {
  highlight = {enable = true, disable = {}},
  indent = {
    enable = true,
    disable = {"python"} -- For autoindent does not work in *.py
  },
  ensure_installed = {
    "c",
    "cpp",
    "css",
    "dockerfile",
    "fish",
    "glsl",
    "go",
    "help",
    "html",
    "json",
    "lua",
    "markdown",
    "markdown_inline",
    -- "python",
    "rust",
    "sql",
    "toml",
    "tsx",
    "vim",
    "yaml",
    "zig"
  },
  autotag = {enable = true}
}

local parser_config = require"nvim-treesitter.parsers".get_parser_configs()
parser_config.tsx.filetype_to_parsername = {"javascript", "typescript.tsx"}
