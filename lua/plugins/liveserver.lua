require('live-server').setup({
  args = {
    '--port=5000',
    '--browser=vivaldi',
  }
})

vim.keymap.set('n', '<leader>lc', '<cmd>LiveServerToggle<cr>')
