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
  if client.server_capabilities.documentFormattingProvider then
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = vim.api.nvim_create_augroup("Format", { clear = true }),
      buffer = bufnr,
      callback = function() vim.lsp.buf.formatting_seq_sync() end
    })
  end
end

-- For cancel on_attach func
-- Formatting uses null-ls.nvim instead ???
--local no_attach = function(client)
--  client.resolved_capabilities.document_formatting = false
--end

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

local capabilities = require('cmp_nvim_lsp').update_capabilities(
  vim.lsp.protocol.make_client_capabilities()
)


--------------------------------------------------------------------------------------------
-- Set up completion using nvim_cmp with LSP source
-- Ref: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
--------------------------------------------------------------------------------------------

-- Golang
nvim_lsp.gopls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "gopls", "serve" },
  filetypes = { "go", "gomod" },
  root_dir = nvim_lsp.util.root_pattern("go.work", "go.mod", ".git"),
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
      },
      staticcheck = true,
    }
  }
}
--nvim_lsp.golangci_lint_ls.setup {}

-- format on save
-- Ref: https://github.com/golang/tools/blob/master/gopls/doc/vim.md#neovim-config
--      from https://zenn.dev/knsh14/articles/nvim-gopls-2021-01-16
function Go_org_imports(wait_ms)
  local params = vim.lsp.util.make_range_params()
  params.context = { only = { "source.organizeImports" } }
  local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, wait_ms)
  for cid, res in pairs(result or {}) do
    for _, r in pairs(res.result or {}) do
      if r.edit then
        local enc = (vim.lsp.get_client_by_id(cid) or {}).offset_encoding or "utf-16"
        vim.lsp.util.apply_workspace_edit(r.edit, enc)
      end
    end
  end
end

vim.cmd([[autocmd BufWritePre *.go lua Go_org_imports()]])

-- Python
nvim_lsp.pyright.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  --[[ For Poeetry projects
  on_new_config = function(config, root_dir)
    local env = vim.trim(vim.fn.system('cd "' .. root_dir .. '"; poetry env info -p 2>/dev/null'))
    if string.len(env) > 0 then
      config.settings.python.pythonPath = env .. '/bin/python'
    end
  end
  ]] --
}

-- C/C++
nvim_lsp.clangd.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

-- TypeScript
nvim_lsp.tsserver.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

-- html
nvim_lsp.html.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    "editor.Tabsize" == 2,
  }
}

-- Lua
-- Use mason.nvim insted forLSP loading
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
