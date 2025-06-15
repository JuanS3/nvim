local lspsaga = require('lspsaga')

lspsaga.setup({
  -- Keymaps for navigating through diagnostic/finder results within Saga popups.
  -- These allow you to move between different items in a diagnostic list or references finder.
  move_in_saga = {
    prev = "<C-k>", -- Move to previous item
    next = "<C-j>"  -- Move to next item
  },

  -- Keymap to open an item from the finder results (e.g., references, definitions).
  finder_action_keys = {
    open = "<CR>", -- Press Enter to open the selected item
  },

  -- Keymap to open a definition from the definition popup.
  definition_action_keys = {
    edit = "<CR>", -- Press Enter to open the definition in the current window
    split = "<C-s>h", -- Optional: Open in a horizontal split
    vsplit = "<C-s>v", -- Optional: Open in a vertical split
  },

  -- --- Common lspsaga options you might consider ---
  border_style = "rounded", -- Use rounded borders for Saga windows/popups
  saga_win_width = 0.7,     -- Set width of the main Saga window (e.g., for code actions)
  saga_win_height = 0.7,    -- Set height of the main Saga window
  diagnostic_only_current_line = false, -- Show diagnostics for whole buffer, not just current line
  show_line_diagnostics = true,     -- Display diagnostics inline
  -- Hover actions:
  hover_actions = {
    keys = "K", -- Default mapping for hover (same as lspconfig default)
    -- Use a specific floating window style for hover
    border = "rounded",
    max_width = 80,
  },
  -- UI customization for different elements:
  symbol_in_winbar = { -- Display current function/class in winbar
    enable = true,
    color_mode = "auto", -- or "auto", "start", "end"
  },
  lightbulb = { -- Code action lightbulb icon
    enable = true,
    sign = true,
    virtual_text = false,
  },
})

-- --- Keymaps for LspSaga Commands ---
-- It's good practice to use silent and noremap for keymaps.
local lspsaga_map_opts = { silent = true, noremap = true }

-- Toggle LspSaga's integrated terminal
vim.keymap.set('n', '<leader>t', '<cmd>Lspsaga term_toggle<cr>', lspsaga_map_opts)

-- --- Other useful LspSaga keymaps (examples) ---

local map = vim.keymap.set
-- Show LSP diagnostics for the current line (similar to K)
map('n', 'K', '<cmd>Lspsaga hover_doc<CR>', lspsaga_map_opts)

-- Show buffer diagnostics (list all errors/warnings in current file)
map('n', '<leader>d', '<cmd>Lspsaga show_line_diagnostics<CR>', lspsaga_map_opts)
map('n', '<leader>D', '<cmd>Lspsaga show_buffer_diagnostics<CR>', lspsaga_map_opts)

-- Code action at cursor
map('n', '<leader>ca', '<cmd>Lspsaga code_action<CR>', lspsaga_map_opts)

-- Rename symbol
map('n', '<leader>rn', '<cmd>Lspsaga rename<CR>', lspsaga_map_opts)

-- Go to definition (Saga's finder UI) - alternative to builtin.lsp_definitions
map('n', 'gd', '<cmd>Lspsaga goto_definition<CR>', lspsaga_map_opts)

-- Skow references (Saga's finder UI) - alternative to builtin.lsp_references
map('n', 'gr', '<cmd>Lspsaga show_references<CR>', lspsaga_map_opts)

-- Toggle outline window (for symbols in current file)
map('n', '<leader>o', '<cmd>Lspsaga outline<CR>', lspsaga_map_opts)
