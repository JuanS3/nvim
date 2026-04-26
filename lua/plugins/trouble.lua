local trouble = require("trouble")

trouble.setup({
  icons = true,
  fold_open = "",
  fold_closed = "",
  indent_lines = true,
  signs = {
    error = "",
    warning = "",
    hint = "",
    information = "",
    other = "",
  },
  use_diagnostic_signs = true,
})

local opts = { noremap = true, silent = true }

-- Diagnósticos del workspace
vim.keymap.set("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", opts)
-- Diagnósticos del documento actual
vim.keymap.set("n", "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", opts)
-- Quickfix list
vim.keymap.set("n", "<leader>xq", "<cmd>Trouble qflist toggle<cr>", opts)
-- Loclist
vim.keymap.set("n", "<leader>xl", "<cmd>Trouble loclist toggle<cr>", opts)
-- Símbolos LSP del documento
vim.keymap.set("n", "<leader>cs", "<cmd>Trouble symbols toggle focus=false<cr>", opts)
-- Referencias LSP
vim.keymap.set("n", "<leader>cl", "<cmd>Trouble lsp toggle focus=false win.position=right<cr>", opts)
