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
require('plugins.colors') -- If 'colors.lua' is solely for loading the color scheme
require('plugins.theme')   -- If 'theme.lua' sets up the main theme
require('plugins.indent')
require('plugins.noice')   -- Noice changes the UI, can be loaded before or after lualine/bufferline
require('plugins.bufferline')
require('plugins.lualine')

--- General Functionality and Development Plugins ---
require('plugins.gitsigns')
require('plugins.treesitter')
require('plugins.telescope')
require('plugins.nvtree')
require('plugins.autopairs')
require('plugins.comment')
require('plugins.markdown')
require('plugins.autotag')
require('plugins.whichkey')
require('plugins.liveserver')
require('plugins.codesnap')
require('plugins.notes')
require('plugins.specs')


--- LSP and Autocompletion Plugins (CRITICAL ORDER) ---
require('plugins.lsp.mason')       -- LSP server installer and manager
require('plugins.lsp.neodev')      -- Better support for Neovim Lua development, before lspconfig
-- require('plugins.lsp.lsp_zero')    -- Simplifies LSP configuration, usually loaded before lspconfig
require('plugins.lsp.lspconfig')   -- Core LSP client configuration
require('plugins.lsp.cmp_nvim_lsp') -- Integration of cmp with lsp
require('plugins.lsp.cmp')         -- Autocompletion (requires cmp_nvim_lsp and lspconfig)
require('plugins.lsp.null-ls')     -- For linters, formatters, etc.
require('plugins.lsp.lspsaga')     -- UI enhancements for LSP
