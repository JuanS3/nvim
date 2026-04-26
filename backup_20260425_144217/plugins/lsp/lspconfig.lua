-- --- LSP UI Customization ---
-- This should be safe to keep here or move to a general UI config if you have one.
require('lspconfig.ui.windows').default_options.border = 'rounded'


-- ~/.config/nvim/lua/plugins/lsp/lspconfig.lua

local lsp_defaults = require('plugins.lsp.init')
local lspconfig = require('lspconfig')

-- Configuración de cada Language Server
lspconfig.lua_ls.setup({
  capabilities = lsp_defaults.capabilities,
  on_attach = lsp_defaults.on_attach,
  settings = {
    Lua = {
      runtime = { version = "LuaJIT" },
      workspace = { checkThirdParty = false, library = vim.api.nvim_get_runtime_file("", true) },
      diagnostics = { globals = { 'vim' } },
      completion = { callSnippet = "Replace" },
    },
  },
})

lspconfig.ruff.setup({ capabilities = lsp_defaults.capabilities, on_attach = lsp_defaults.on_attach })
lspconfig.pyright.setup({
  capabilities = lsp_defaults.capabilities,
  on_attach = lsp_defaults.on_attach,
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

local setup_config = {
  capabilities = lsp_defaults.capabilities,
  on_attach = lsp_defaults.on_attach
}


lspconfig.ts_ls.setup(setup_config)
lspconfig.rust_analyzer.setup(setup_config)
lspconfig.jsonls.setup(setup_config)
lspconfig.yamlls.setup(setup_config)
lspconfig.dockerls.setup(setup_config)
lspconfig.clangd.setup(setup_config)
lspconfig.bashls.setup(setup_config)
lspconfig.html.setup(setup_config)
lspconfig.cssls.setup(setup_config)
lspconfig.marksman.setup(setup_config)
lspconfig.ltex.setup(setup_config)
lspconfig.sqlls.setup(setup_config)
lspconfig.sqlfluff.setup(setup_config)

-- Configuración de la UI de lspconfig
require('lspconfig.ui.windows').default_options.border = 'rounded'
