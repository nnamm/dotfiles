local status, prettier = pcall(require, "prettier")
if (not status) then return end

prettier.setup {
  bin = 'prettierd',
  -- bin = 'prettier',
  filetypes = {
    "css",
    "html",
    "javascript",
    "javascriptreact",
    "typescript",
    "typescriptreact",
    "json",
    "scss",
    "less",
    "toml",
    "yaml"
  }
}
