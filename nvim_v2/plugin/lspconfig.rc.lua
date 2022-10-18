local status, nvim_lsp = pcall(require, "lspconfig")
if (not status) then return end

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  --Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings
  -- Ref: https://github.com/neovim/nvim-lspconfig
  --      https://zenn.dev/botamotch/articles/21073d78bc68bf
  local opts = { noremap = true, silent = true }
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', 'gt', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)

  -- Format on save
  -- if client.server_capabilities.documentFormattingProvider then
  --   vim.api.nvim_create_autocmd("BufWritePre", {
  --     group = vim.api.nvim_create_augroup("Format", { clear = true }),
  --     buffer = bufnr,
  --     callback = function() vim.lsp.buf.formatting_seq_sync() end
  --   })
  -- end
end

-- Diagnostic settings
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
  underline = true,
  update_in_insert = false,
  virtual_text = { spacing = 4, prefix = "●" },
  severity_sort = true
}
)

-- Diagnostic symbols in the sign column (gutter)
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

vim.diagnostic.config({
  virtual_text = {
    prefix = '●'
  },
  update_in_insert = true,
  float = {
    source = "always", -- Or "if_many"
  },
})

local capabilities = require('cmp_nvim_lsp').default_capabilities(
  vim.lsp.protocol.make_client_capabilities()
)


--------------------------------------------------------------------------------------------
-- Set up completion using nvim_cmp with LSP source
-- Ref: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
--------------------------------------------------------------------------------------------

-- format on save for Golang
-- Ref: https://github.com/golang/tools/blob/master/gopls/doc/vim.md#neovim-config
--      from https://zenn.dev/knsh14/articles/nvim-gopls-2021-01-16
-- function Go_org_imports(wait_ms)
--   local params = vim.lsp.util.make_range_params()
--   params.context = { only = { "source.organizeImports" } }
--   local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, wait_ms)
--   for cid, res in pairs(result or {}) do
--     for _, r in pairs(res.result or {}) do
--       if r.edit then
--         local enc = (vim.lsp.get_client_by_id(cid) or {}).offset_encoding or "utf-16"
--         vim.lsp.util.apply_workspace_edit(r.edit, enc)
--       end
--     end
--   end
-- end
-- vim.cmd([[autocmd BufWritePre *.go lua Go_org_imports()]])

local lsp_servers = { 'gopls', 'pyright', 'zls', 'rust_analyzer', 'clangd', 'tsserver', 'html', 'cssls' }
for _, lsp in pairs(lsp_servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

-- Docker
nvim_lsp.dockerls.setup {
  capabilities = capabilities,
}

-- Lua (Use mason.nvim insted for LSP loading)
nvim_lsp.sumneko_lua.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' },
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true)
      }
    }
  }
}
