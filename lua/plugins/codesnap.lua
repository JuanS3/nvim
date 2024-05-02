require('codesnap').setup({
  save_path = '~/Pictures',
  has_breadcrumb = false,
  bg_color = '#2e3440',
  watermark = 'OneCode',
  has_line_number = true,
  title = 'OneCode',
  mac_window_bar = true,
})

vim.keymap.set("x", "<leader>ca", ":CodeSnap<cr>")
vim.keymap.set("x", "<leader>cs", ":CodeSnapSave<cr>")
