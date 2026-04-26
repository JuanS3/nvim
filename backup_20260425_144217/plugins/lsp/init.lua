local cmp_nvim_lsp = require('cmp_nvim_lsp')

local capabilities = cmp_nvim_lsp.default_capabilities()

local on_attach = function(client, bufnr)
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
  if client.supports_method('textDocument/formatting') then
    vim.api.nvim_create_autocmd('BufWritePre', {
      group = vim.api.nvim_create_augroup('LspFormatting', { clear = true }),
      buffer = bufnr,
      callback = function() vim.lsp.buf.format({ bufnr = bufnr, async = false }) end,
      desc = 'Format on save',
    })
  end
end

return {
  on_attach = on_attach,
  capabilities = capabilities,
}
