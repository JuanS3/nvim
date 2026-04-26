require('codesnap').setup({
  save_path = '~/Pictures',
  has_breadcrumb = false,
  bg_color = '#2e3440',
  watermark = 'Datolytix',
  has_line_number = true,
  title = 'Datolytix',
  mac_window_bar = true,
})

vim.keymap.set("x", "<leader>ca", ":CodeSnap<cr>")
vim.keymap.set("x", "<leader>cs", ":CodeSnapSave<cr>")
