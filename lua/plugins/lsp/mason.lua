require('mason').setup {
  -- You can customize Mason's UI, install directory, etc. here.
  -- Example:
  ui = {
    border = "rounded",
    icons = {
      package_installed = "",
      package_pending = "",
      package_uninstalled = "",
    },
  },
  install_root_dir = vim.fn.stdpath("data") .. "/mason", -- Default, but good to know
}

local lsp_defaults = require('plugins.lsp.init') -- Path to this file

require('mason-lspconfig').setup {
  -- FIX: ensure_installed desactivado para prevenir errores de instalación en startup.
  -- Mason intenta instalar paquetes npm-based que fallan frecuentemente en headless/background.
  -- Instalar manualmente con :Mason o :MasonInstallAll (comando de conveniencia abajo).
  ensure_installed = {},
  -- FIX: automatic_installation = true causa "attempt to yield across C-call boundary"
  -- en nvim 0.11+ al abrir buffers. Se desactiva para evitar el crash en startup.
  automatic_installation = false,
}

-- It's highly recommended to UNCOMMENT and use `automatic_setup = true`
-- or your `setup_handlers` block. Without it, Mason will install the LSPs,
-- but `lspconfig` won't know how to *attach* them to your buffers.
--
-- If you have a separate `lspconfig.lua` file where you explicitly
-- `require("lspconfig").<server_name>.setup({})` for each server,
-- then `automatic_setup` might cause conflicts or be redundant.
-- However, for a streamlined setup where Mason handles the installation
-- *and* the basic configuration for `lspconfig`, it's recommended.

local ok, mason_null_ls = pcall(require, "mason-null-ls")
if not ok then
  return -- Safely exit if mason-null-ls is not available
end

-- FIX: Envuelto en vim.defer_fn para evitar "attempt to yield across C-call boundary"
-- en nvim 0.11+. mason-null-ls.ensure_installed usa registry.refresh() con
-- vim.schedule_wrap(), que ejecuta pkg:install() dentro de un callback de C.
-- El código async de Mason no puede hacer coroutine.yield() desde callbacks de C.
vim.defer_fn(function()
  mason_null_ls.setup({
    -- FIX: ensure_installed desactivado para prevenir errores de instalación en startup.
    -- Instalar manualmente con :Mason o :MasonInstallTools.
    ensure_installed = {},
    automatic_setup = true,
  })
end, 100)

-- Comandos de conveniencia para instalar LSPs y herramientas manualmente
vim.api.nvim_create_user_command('MasonInstallAll', function()
  local registry = require('mason-registry')
  local servers = {
    "bash-language-server", "clangd", "css-lsp", "dockerfile-language-server",
    "html-lsp", "json-lsp", "ltex-ls", "lua-language-server", "marksman",
    "pyright", "ruff", "rust-analyzer", "sql-language-server",
    "typescript-language-server", "yaml-language-server", "tailwindcss-language-server",
  }
  local queued = {}
  for _, pkg_name in ipairs(servers) do
    local ok, pkg = pcall(registry.get_package, pkg_name)
    if ok and not pkg:is_installed() then
      pkg:install()
      table.insert(queued, pkg_name)
    end
  end
  if #queued > 0 then
    vim.notify("Mason: " .. #queued .. " LSP installations queued. Check :Mason for progress.", vim.log.levels.INFO)
  else
    vim.notify("Mason: All LSP servers already installed.", vim.log.levels.INFO)
  end
end, { desc = "Install all recommended Mason LSP servers" })

vim.api.nvim_create_user_command('MasonInstallTools', function()
  local registry = require('mason-registry')
  local tools = { "stylua", "ruff", "black", "isort", "prettier", "rustfmt", "flake8", "shellcheck" }
  local queued = {}
  for _, pkg_name in ipairs(tools) do
    local ok, pkg = pcall(registry.get_package, pkg_name)
    if ok and not pkg:is_installed() then
      pkg:install()
      table.insert(queued, pkg_name)
    end
  end
  if #queued > 0 then
    vim.notify("Mason: " .. #queued .. " tool installations queued. Check :Mason for progress.", vim.log.levels.INFO)
  else
    vim.notify("Mason: All tools already installed.", vim.log.levels.INFO)
  end
end, { desc = "Install all recommended Mason formatting/linters" })
