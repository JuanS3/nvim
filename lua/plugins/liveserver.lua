require('live-server').setup({
  args = {
    '--port=5000',
    '--browser=opera',
  }
})

vim.keymap.set('n', '<leader>lc', '<cmd>LiveServerToggle<cr>')
