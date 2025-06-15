-- local builtin = require('telescope.builtin')
--
-- vim.keymap.set('n', '<C-p>', builtin.find_files, {})
-- vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
-- vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
-- vim.keymap.set('n', '<leader>fk', builtin.keymaps, {})
--
-- vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
-- vim.keymap.set('n', '<leader>fd', builtin.diagnostics, {})
-- vim.keymap.set('n', '<leader>fc', builtin.commands, {})
--
-- -- Git
-- vim.keymap.set('n', '<leader>gs', builtin.git_status, {})
-- vim.keymap.set('n', '<leader>gcm', builtin.git_commits, {})
-- vim.keymap.set('n', '<leader>gb', builtin.git_branches, {})
-- vim.keymap.set('n', '<leader>gl', builtin.git_bcommits, {})
-- vim.keymap.set('n', '<leader>gt', builtin.git_stash, {})
--
-- -- LSP
-- vim.keymap.set('n', '<leader>ld', builtin.lsp_definitions, {})
-- vim.keymap.set('n', '<leader>lr', builtin.lsp_references, {})
-- vim.keymap.set('n', '<leader>li', builtin.lsp_implementations, {})
-- vim.keymap.set('n', '<leader>lh', builtin.lsp_type_definitions, {})
-- vim.keymap.set('n', '<leader>ls', builtin.lsp_document_symbols, {})
--
-- -- Misc
-- -- Symbols
-- vim.keymap.set('n', '<leader>ms', ':Telescope symbols<cr>', {})


local builtin = require('telescope.builtin')

-- Define common options for Telescope mappings
-- Using { noremap = true, silent = true } is good practice for most keymaps
local telescope_opts = { noremap = true, silent = true }

-- --- Core File and Buffer Search ---
vim.keymap.set('n', '<C-p>', builtin.find_files, telescope_opts) -- Find files in the current directory
vim.keymap.set('n', '<leader>fg', builtin.live_grep, telescope_opts) -- Live grep (search content in files)
vim.keymap.set('n', '<leader>fb', builtin.buffers, telescope_opts) -- List open buffers
vim.keymap.set('n', '<leader>fh', builtin.help_tags, telescope_opts) -- Search Neovim help tags
vim.keymap.set('n', '<leader>fk', builtin.keymaps, telescope_opts) -- List current keymaps
vim.keymap.set('n', '<leader>fd', builtin.diagnostics, telescope_opts) -- List LSP diagnostics (errors, warnings)
vim.keymap.set('n', '<leader>fc', builtin.commands, telescope_opts) -- Search all available Vim commands

-- --- Git Integration ---
vim.keymap.set('n', '<leader>gs', builtin.git_status, telescope_opts) -- Show Git status (modified, untracked files)
vim.keymap.set('n', '<leader>gcm', builtin.git_commits, telescope_opts) -- Search Git commit messages (global)
vim.keymap.set('n', '<leader>gb', builtin.git_branches, telescope_opts) -- List Git branches
vim.keymap.set('n', '<leader>gl', builtin.git_bcommits, telescope_opts) -- Search Git commit messages for current buffer
vim.keymap.set('n', '<leader>gt', builtin.git_stash, telescope_opts) -- List Git stashes

-- --- LSP (Language Server Protocol) ---
vim.keymap.set('n', '<leader>ld', builtin.lsp_definitions, telescope_opts) -- Go to definition
vim.keymap.set('n', '<leader>lr', builtin.lsp_references, telescope_opts) -- Find references
vim.keymap.set('n', '<leader>li', builtin.lsp_implementations, telescope_opts) -- Go to implementation
vim.keymap.set('n', '<leader>lh', builtin.lsp_type_definitions, telescope_opts) -- Go to type definition
vim.keymap.set('n', '<leader>ls', builtin.lsp_document_symbols, telescope_opts) -- List symbols in the current document
-- Add project-wide symbols for a more complete LSP experience
vim.keymap.set('n', '<leader>lw', builtin.lsp_workspace_symbols, telescope_opts) -- List symbols in the entire workspace

-- --- Miscellaneous ---
-- For `symbols`, it's usually better to directly call the Telescope pickers
-- like `builtin.lsp_document_symbols` or `builtin.lsp_workspace_symbols`.
-- If you have a different plugin providing a generic `:Telescope symbols` command,
-- ensure that plugin is loaded and configured.
-- For general symbols, `lsp_document_symbols` and `lsp_workspace_symbols` cover most use cases.
-- If `ms` is meant to be a general symbols picker (e.g. for tags or fuzzy finding specific symbols not LSP related)
-- and you have a plugin that provides it, keep it. Otherwise, consider `lsp_workspace_symbols`.
-- vim.keymap.set('n', '<leader>ms', ':Telescope symbols<cr>', telescope_opts)

-- --- Common Telescope Configuration (if not in a separate config.lua) ---
-- If you need to customize Telescope's appearance or behavior globally,
-- you would typically add a `require('telescope').setup{ ... }` call here.
-- Example:
require('telescope').setup {
  defaults = {
    -- Default mappings within Telescope windows
    mappings = {
      i = {
        -- To close telescope window on Ctrl-c
        ['<C-c>'] = require('telescope.actions').close,
        -- To select the current item
        ['<CR>'] = require('telescope.actions').select_default,
      },
    },
    -- Adjust preview window behavior
    file_ignore_patterns = {"%.git/", "node_modules/", "%.DS_Store"},
    -- layout_config = {
    --   prompt_position = "top",
    --   preview_width = 0.6,
    -- },
  },
  -- Other built-in pickers if you use them often
  -- pickers = {
  --   find_files = {
  --     hidden = true, -- Show hidden files by default
  --     no_ignore = false, -- Respect .gitignore
  --   },
  -- },
  -- Setup extensions (if you have them)
  -- extensions = {
  --   fzf = {
  --     fuzzy = true, -- false will only do exact matching
  --     override_generic_sorter = true, -- override the generic sorter
  --     override_file_sorter = true, -- override the file sorter
  --     case_mode = "smart_case", -- or "ignore_case" or "respect_case"
  --   }
  -- }
}

-- Load extensions (if configured above)
-- require('telescope').load_extension('fzf')
