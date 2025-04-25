local ok, mason = pcall(require, "mason")
if not ok then
  return
end

mason.setup()

local ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not ok then
  return
end

mason_lspconfig.setup({
  ensure_installed = {
    "bashls",
    "clangd",
    "cssls",
    "dockerls",
    "html",
    "jsonls",
    "ltex",
    "lua_ls",
    "marksman",
    "pyright",
    "ruff",
    "rust_analyzer",
    "sqlls",
    "sqruff",
    "ts_ls",
    "yamlls",
  }
})

-- mason_lspconfig.setup_handlers({
--   function (server_name)
--     require("lspconfig")[server_name].setup({})
--   end
-- })

local ok, mason_null_ls = pcall(require, "mason-null-ls")
if not ok then
  return
end


mason_null_ls.setup()
