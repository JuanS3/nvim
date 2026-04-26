local conform = require("conform")

conform.setup({
  -- Formatters por filetype
  formatters_by_ft = {
    lua = { "stylua" },
    python = { "isort", "black" },
    javascript = { "prettier" },
    typescript = { "prettier" },
    javascriptreact = { "prettier" },
    typescriptreact = { "prettier" },
    json = { "prettier" },
    yaml = { "prettier" },
    markdown = { "prettier" },
    html = { "prettier" },
    css = { "prettier" },
    rust = { "rustfmt" },
    sh = { "shfmt" },
    bash = { "shfmt" },
    go = { "gofmt", "goimports" },
  },

  -- Formatear al guardar con fallback al LSP
  format_on_save = {
    timeout_ms = 500,
    lsp_format = "fallback",
  },

  -- Opciones adicionales de formatters
  formatters = {
    black = {
      prepend_args = { "--fast", "--line-length", "120" },
    },
    isort = {
      prepend_args = { "--profile", "black" },
    },
    shfmt = {
      prepend_args = { "-i", "2" },
    },
  },
})

-- Keymap manual para formatear con conform
vim.keymap.set({ "n", "v" }, "<leader>cf", function()
  conform.format({
    lsp_format = "fallback",
    timeout_ms = 500,
  })
end, { desc = "Format with conform", noremap = true, silent = true })
