-- ~/.config/nvim/lua/plugins/lsp/lspconfig.lua
-- FIX: Migrado de lspconfig[server].setup() (deprecado en lspconfig v3 / nvim 0.11+)
-- a vim.lsp.config() + vim.lsp.enable() para eliminar warnings de deprecación.
-- Se usa require('lspconfig.configs.<server>') directamente para obtener defaults
-- sin disparar el metatable __index del framework lspconfig.

local lsp_defaults = require('plugins.lsp.init')

--- Configura un LSP server usando vim.lsp.config (nvim 0.11+)
-- @param name string: nombre del servidor (debe existir en lspconfig/configs/)
-- @param opts table|nil: opciones custom (settings, capabilities, on_attach, etc.)
local function setup_server(name, opts)
  opts = opts or {}
  local ok, server = pcall(require, 'lspconfig.configs.' .. name)
  local default_config = ok and server.default_config or {}

  -- Merge: defaults de lspconfig -> capabilities/on_attach base -> opts custom
  local config = vim.tbl_deep_extend('force', default_config, {
    capabilities = lsp_defaults.capabilities,
    on_attach = lsp_defaults.on_attach,
  }, opts)

  vim.lsp.config(name, config)
  vim.lsp.enable(name)
end

-- === Servidores LSP ===

setup_server('lua_ls', {
  settings = {
    Lua = {
      runtime = { version = "LuaJIT" },
      workspace = { checkThirdParty = false, library = vim.api.nvim_get_runtime_file("", true) },
      diagnostics = { globals = { 'vim' } },
      completion = { callSnippet = "Replace" },
    },
  },
})

setup_server('ruff')
setup_server('pyright', {
  settings = {
    python = {
      analysis = {
        ignore = { '*' }, -- Ajusta esto según tus necesidades
        useLibraryCodeForTypes = true,
        autoSearchPaths = true,
      },
    },
  },
})

setup_server('ts_ls')
setup_server('rust_analyzer')
setup_server('jsonls')
setup_server('yamlls')
setup_server('dockerls')
setup_server('clangd')
setup_server('bashls')
setup_server('html')
setup_server('cssls')
setup_server('marksman')
setup_server('ltex')
setup_server('sqlls')
setup_server('tailwindcss')
-- FIX: sqlfluff removido porque no es un LSP server en nvim-lspconfig.
-- sqlfluff es un linter formateable vía null-ls / conform.nvim / nvim-lint.
-- Si necesitas linting SQL, considera añadirlo a null-ls.lua como diagnostics.sqlfluff
