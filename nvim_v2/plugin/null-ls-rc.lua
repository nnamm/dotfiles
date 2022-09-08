local status, null_ls = pcall(require, "null-ls")
if (not status) then return end

local sources = {
  -- diagnostics
  -- null_ls.builtins.diagnostics.mypy,
  -- null_ls.builtins.diagnostics.pylint,
  null_ls.builtins.diagnostics.pyproject_flake8,
  null_ls.builtins.diagnostics.eslint_d.with({
    diagnostics_format = '[eslint] #{m}\n(#{c})'
  }),

  -- formatting
  null_ls.builtins.formatting.black.with({ extra_args = { "--fast" } }),
  null_ls.builtins.formatting.isort,
  -- null_ls.builtins.formatting.djlint,
  -- null_ls.builtins.formatting.clang_format,
}

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
null_ls.setup({
  sources = sources,

  -- Ref: https://github.com/jose-elias-alvarez/null-ls.nvim/wiki/Formatting-on-save
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
