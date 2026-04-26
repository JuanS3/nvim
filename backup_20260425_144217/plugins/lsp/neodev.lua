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
    group = "Neodev",   -- Name for the diagnostic group
  },
  enforce_setup = true, -- Ensures neodev is always setup before LSP servers
  verbose = true,       -- More verbose logging from neodev
})
