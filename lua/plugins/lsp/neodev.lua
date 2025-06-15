-- IMPORTANT: make sure to setup neodev BEFORE lspconfig
-- This ensures that nvim-lspconfig (and subsequently Lua LS)
-- is aware of Neovim's runtime files for better completion and diagnostics
-- for your Neovim Lua configuration.
local ok, neodev = pcall(require, "neodev")
if not ok then
  return -- Safely exit if neodev is not available
end

neodev.setup({
  -- Add any options here, or leave empty to use the default settings.
  -- These are the recommended defaults for Neodev:
  library = {
    plugins = { "nvim-dap-ui", "nvim-tree.lua" }, -- Add any other plugins you want LSP support for
    types = true,
  },
  diagnostics = {
    enable = true,
    group = "Neodev", -- Name for the diagnostic group
  },
  enforce_setup = true, -- Ensures neodev is always setup before LSP servers
  verbose = true,       -- More verbose logging from neodev
})

-- --- LSP Server Setup for Lua ---
-- This section should ideally be part of your main LSP configuration (e.g., lsp/init.lua)
-- if you are using `mason-lspconfig` and its `setup_handlers`.

-- If you have `automatic_setup = true` in `lsp/mason.lua`, then `mason-lspconfig`
-- will automatically call `require("lspconfig").lua_ls.setup({})`.

-- To add custom settings like `callSnippet = "Replace"`, you would typically
-- define a specific handler for `lua_ls` within your `mason-lspconfig` setup.

-- Example of how to integrate this into `mason-lspconfig`'s setup_handlers:
-- (This code would go into your `lsp/mason.lua` file within the `setup_handlers` table)

-- [[ Example in lsp/mason.lua ]]
-- mason_lspconfig.setup({
--   ensure_installed = {
--     -- ... other servers
--     "lua_ls",
--   },
--   setup_handlers = {
--     function(server_name)
--       local on_attach = require('plugins.lsp.init').on_attach -- Assuming this is defined
--       local capabilities = require('plugins.lsp.init').capabilities -- Assuming this is defined
--       local server_settings = {
--         on_attach = on_attach,
--         capabilities = capabilities,
--       }
--
--       -- Custom settings for lua_ls
--       if server_name == "lua_ls" then
--         vim.tbl_deep_extend("force", server_settings, {
--           settings = {
--             Lua = {
--               runtime = {
--                 version = "LuaJIT", -- Often recommended for Neovim (or "5.1" for compatibility)
--               },
--               workspace = {
--                 checkThirdParty = false, -- Prevent checking all of ~/.config/nvim by default
--                 -- Add Neovim's runtime and other plugin directories to Lua LS's library
--                 library = vim.api.nvim_get_runtime_file("", true),
--               },
--               -- Diagnostics settings
--               diagnostics = {
--                 globals = { 'vim' }, -- Important: tells Lua LS that 'vim' is a global
--               },
--               completion = {
--                 callSnippet = "Replace", -- Enable snippet completion for function calls
--               },
--             },
--           },
--         })
--       end
--
--       require("lspconfig")[server_name].setup(server_settings)
--     end,
--   },
-- })

-- The `lspconfig.lua_ls.setup` block directly in `neodev.lua` is only needed
-- if you are NOT using `mason-lspconfig` for automatic setup, or if you want
-- to override the settings applied by `mason-lspconfig` for `lua_ls`.
-- For a clean setup, it's usually better to consolidate all LSP server setups
-- within your `mason-lspconfig` configuration (e.g., in `lsp/mason.lua`)
-- using `setup_handlers` as shown above.
