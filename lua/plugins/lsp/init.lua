local cmp_nvim_lsp = require('cmp_nvim_lsp')

local capabilities = cmp_nvim_lsp.default_capabilities()

local on_attach = function(client, bufnr)
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
  -- local buf_set_keymap = function(mode, lhs, rhs, desc)
  --   -- vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, opts or { silent = true, noremap = true })
  --   vim.keymap.set(mode, lhs, rhs, { silent = true, noremap = true, buffer = bufnr, desc = desc})
  -- end
  --
  -- buf_set_keymap('n', 'gD', vim.lsp.buf.declaration, { desc = 'Go to Declaration' })
  -- buf_set_keymap('n', 'gd', vim.lsp.buf.definition, { desc = 'Go to Definition' })
  -- buf_set_keymap('n', 'K', vim.lsp.buf.hover, { desc = 'Hover Documentation' })
  -- buf_set_keymap('n', 'gi', vim.lsp.buf.implementation, { desc = 'Go to Implementation' })
  -- buf_set_keymap('n', '<leader>D', vim.lsp.buf.type_definition, { desc = 'Go to Type Definition' })
  -- buf_set_keymap('n', 'gr', vim.lsp.buf.references, { desc = 'Show References' })
  -- buf_set_keymap('n', '<leader>rn', vim.lsp.buf.rename, { desc = 'Rename Symbol' })
  -- buf_set_keymap('n', '<leader>ca', vim.lsp.buf.code_action, { desc = 'Code Action' })
  -- buf_set_keymap('n', '<leader>f', function() vim.lsp.buf.format({ async = true, bufnr = bufnr }) end, { desc = 'Format Buffer' })
  -- buf_set_keymap('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, { desc = 'Add Workspace Folder' })
  -- buf_set_keymap('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, { desc = 'Remove Workspace Folder' })
  -- buf_set_keymap('n', '<leader>wl', function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, { desc = 'List Workspace Folders' })
  -- buf_set_keymap('n', '<leader>ws', vim.lsp.buf.workspace_symbol, { desc = 'Workspace Symbols' })
  -- buf_set_keymap('n', '[d', vim.diagnostic.jump({count = -1}), { desc = 'Go to Previous Diagnostic' })
  -- buf_set_keymap('n', ']d', vim.diagnostic.jump({count = 1}), { desc = 'Go to Next Diagnostic' })
  -- buf_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.jump({count = -1})<CR>', { desc = 'Go to Previous Diagnostic' })
  -- buf_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.jump({count = 1})<CR>', { desc = 'Go to Next Diagnostic' })
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
