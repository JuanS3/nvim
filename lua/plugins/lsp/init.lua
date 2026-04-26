local cmp_nvim_lsp = require('cmp_nvim_lsp')

local capabilities = cmp_nvim_lsp.default_capabilities()

local on_attach = function(client, bufnr)
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
  -- NOTE: Formateo on-save ahora lo maneja conform.nvim con fallback a LSP.
  -- El autocmd BufWritePre de vim.lsp.buf.format fue removido para evitar
  -- doble formateo. Ver lua/plugins/conform.lua
end

return {
  on_attach = on_attach,
  capabilities = capabilities,
}
