local status, null_ls = pcall(require, "null-ls")
if (not status) then return end

local sources = {
  -- diagnostics
  -- null_ls.builtins.diagnostics.mypy, -- Requires machine resources to use
  -- null_ls.builtins.diagnostics.pylint, -- Requires machine resources to use
  null_ls.builtins.diagnostics.pyproject_flake8,
  -- null_ls.builtins.diagnostics.eslint_d.with({
  --   diagnostics_format = '[eslint] #{m}\n(#{c})'
  -- }),

  -- formatting
  null_ls.builtins.formatting.gofmt, null_ls.builtins.formatting.goimports,
  null_ls.builtins.formatting.clang_format,
  null_ls.builtins.formatting.black.with({extra_args = {"--fast"}}),
  null_ls.builtins.formatting.isort, null_ls.builtins.formatting.prettierd,
  null_ls.builtins.formatting.rustfmt, null_ls.builtins.formatting.zigfmt,
  null_ls.builtins.formatting.lua_format
}

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
---@diagnostic disable-next-line: redundant-parameter
null_ls.setup({
  sources = sources,
  -- Ref: https://github.com/jose-elias-alvarez/null-ls.nvim/wiki/Formatting-on-save
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({group = augroup, buffer = bufnr})
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function() vim.lsp.buf.format({bufnr = bufnr}) end
      })
    end
  end
})
