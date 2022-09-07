local status, null_ls = pcall(require, "null-ls")
if (not status) then return end

-- Ref: https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md
--      https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTIN_CONFIG.md
--      from https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/doc
local sources = {
  -- Python
  null_ls.builtins.diagnostics.mypy.with({ prefer_local = 'true' }),
  null_ls.builtins.diagnostics.pylint.with({ prefer_local = 'true' }),
  null_ls.builtins.diagnostics.pyproject_flake8.with({ prefer_local = 'true' }),
  null_ls.builtins.formatting.black.with({ prefer_local = 'true' }),
  null_ls.builtins.formatting.isort.with({ prefer_local = 'true' }),
  -- C/C++
  --null_ls.builtins.formatting.clang_format,
  -- TypeScript
  null_ls.builtins.diagnostics.eslint_d.with({
    diagnostics_format = '[eslint] #{m}\n(#{c})'
  }),
}

local nls_utils = require "null-ls.utils"
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
null_ls.setup({
  sources = sources,

  root_dir = nls_utils.root_pattern ".git",

  -- Ref: https://github.com/jose-elias-alvarez/null-ls.nvim/wiki/Formatting-on-save
  -- TODO I want to enable it only for Python files.
  --      If this is not enabled, the Python formatter will not function.
  --      In return, TypeScript forces you to choose between two formatters.
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.formatting_sync()
        end,
      })
    end
  end,
})

--[[
null_ls.setup {
  sources = {
    null_ls.builtins.diagnostics.eslint_d.with({
      diagnostics_format = '[eslint] #{m}\n(#{c})'
    }),
    null_ls.builtins.diagnostics.fish
  }
}
]] --
