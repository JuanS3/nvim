local builtin = require('telescope.builtin')

vim.keymap.set('n', '<C-p>', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fk', builtin.keymaps, {})

vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>fd', builtin.diagnostics, {})
vim.keymap.set('n', '<leader>fc', builtin.commands, {})

-- Git
vim.keymap.set('n', '<leader>gs', builtin.git_status, {})
vim.keymap.set('n', '<leader>gcm', builtin.git_commits, {})
vim.keymap.set('n', '<leader>gb', builtin.git_branches, {})
vim.keymap.set('n', '<leader>gl', builtin.git_bcommits, {})
vim.keymap.set('n', '<leader>gt', builtin.git_stash, {})

-- LSP
vim.keymap.set('n', '<leader>ld', builtin.lsp_definitions, {})
vim.keymap.set('n', '<leader>lr', builtin.lsp_references, {})
vim.keymap.set('n', '<leader>li', builtin.lsp_implementations, {})
vim.keymap.set('n', '<leader>lh', builtin.lsp_type_definitions, {})
vim.keymap.set('n', '<leader>ls', builtin.lsp_document_symbols, {})

-- Misc
-- Symbols
vim.keymap.set('n', '<leader>ms', ':Telescope symbols<cr>', {})
