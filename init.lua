-- Set character encoding. Always good practice.
vim.g.encoding = "UTF-8"
vim.o.fileencoding = "UTF-8"

-- Disable Vi compatibility to prevent unexpected behaviors.
vim.opt.compatible = false

-- Make Neovim search for configuration files in the correct order.
-- You can add more paths if you have external or shared configurations.
vim.opt.rtp:prepend(vim.fn.stdpath("config") .. "/lua")

-- Load general options.
require('options')

-- Load keymaps.
require('keymaps')

--- Plugin Manager (MUST BE LOADED FIRST) ---
require('plugins.lazy')

--- Theme and UI Plugins ---
-- Load your color scheme and theme.
require('plugins.theme')
require('plugins.indent')
require('plugins.noice')
require('plugins.bufferline')
require('plugins.lualine')

--- General Functionality and Development Plugins ---
require('plugins.gitsigns')
require('plugins.treesitter')
require('plugins.telescope')
require('plugins.nvtree')
require('plugins.autopairs')
-- FIX: Los siguientes plugins se configuran ahora vía lazy.nvim (lazy loading):
-- require('plugins.comment')     -> nvim-comment: lazy por keys+opts en lazy.lua
-- require('plugins.autotag')     -> nvim-ts-autotag: lazy por event+opts en lazy.lua
-- require('plugins.whichkey')    -> which-key: lazy por event; config movida a lazy.lua
-- require('plugins.codesnap')    -> codesnap: lazy por cmd+keys+opts en lazy.lua
-- require('plugins.specs')       -> specs: lazy por event+opts+keys en lazy.lua
-- require('plugins.markdown')    -> render-markdown: lazy por ft+config en lazy.lua
require('plugins.liveserver')
require('plugins.notes')


--- LSP and Autocompletion Plugins (CRITICAL ORDER) ---
require('plugins.lsp.mason')        -- LSP server installer and manager
require('plugins.lsp.neodev')       -- Better support for Neovim Lua development, before lspconfig
-- require('plugins.lsp.lsp_zero')    -- Simplifies LSP configuration, usually loaded before lspconfig
require('plugins.lsp.lspconfig')    -- Core LSP client configuration
require('plugins.lsp.cmp_nvim_lsp') -- Integration of cmp with lsp
require('plugins.lsp.cmp')          -- Autocompletion (requires cmp_nvim_lsp and lspconfig)
require('plugins.lsp.null-ls')      -- For linters, formatters, etc.
require('plugins.lsp.lspsaga')      -- UI enhancements for LSP
