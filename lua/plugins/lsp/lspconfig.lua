local lspconfig = require('lspconfig')

local on_attach = function(client, bufnr)
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { buffer = bufnr })
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer = bufnr })
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = bufnr })
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, { buffer = bufnr })
  vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, { buffer = bufnr })
  vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, { buffer = bufnr })
  vim.keymap.set('n', '<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, { buffer = bufnr })
  vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, { buffer = bufnr })
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { buffer = bufnr })
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { buffer = bufnr })
  vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, { buffer = bufnr })
  vim.keymap.set('n', '<leader>f', function()
    vim.lsp.buf.format({ async = true })
  end, { buffer = bufnr })
end

local capabilities = require('cmp_nvim_lsp').default_capabilities()

lspconfig.lua_ls.setup({ capabilities = capabilities, on_attach = on_attach })

lspconfig.ruff.setup({ capabilities = capabilities, on_attach = on_attach }) -- To install: pip install ruff_lsp / OpenSuse sudo zypper install python311-ruff
lspconfig.pyright.setup({
  capabilities = capabilities,
  on_attach = on_attach,
  settings = {
    python = {
      analysis = {
        ignore = { '*' },
      },
    },
  },
})

lspconfig.ts_ls.setup({ capabilities = capabilities, on_attach = on_attach })
lspconfig.rust_analyzer.setup({ capabilities = capabilities, on_attach = on_attach })
lspconfig.jsonls.setup({ capabilities = capabilities, on_attach = on_attach })
lspconfig.yamlls.setup({ capabilities = capabilities, on_attach = on_attach })
lspconfig.dockerls.setup({ capabilities = capabilities, on_attach = on_attach })
lspconfig.clangd.setup({ capabilities = capabilities, on_attach = on_attach })
lspconfig.bashls.setup({ capabilities = capabilities, on_attach = on_attach })
lspconfig.html.setup({ capabilities = capabilities, on_attach = on_attach })
lspconfig.cssls.setup({ capabilities = capabilities, on_attach = on_attach })
lspconfig.marksman.setup({ capabilities = capabilities, on_attach = on_attach })
lspconfig.ltex.setup({ capabilities = capabilities, on_attach = on_attach })
lspconfig.sqlls.setup({ capabilities = capabilities, on_attach = on_attach })

require('lspconfig.ui.windows').default_options.border = 'rounded'
