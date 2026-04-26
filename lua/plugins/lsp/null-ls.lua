local ok, null_ls = pcall(require, "null-ls")

if not ok then
  return
end

-- FIX: eslint_d fue removido de none-ls.nvim (builtin no disponible).
-- Se dejan sources vacíos; mason-null-ls con automatic_setup = true
-- registrará automáticamente las fuentes instaladas (black, isort, ruff, etc.)
-- sin necesidad de listarlas aquí explícitamente.
null_ls.setup({
  sources = {},
})
