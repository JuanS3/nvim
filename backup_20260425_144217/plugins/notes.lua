require('note').setup({
  spaces = { '~/Notes', '~/Notes/datolytix', '~/Notes/inter' },
})

vim.keymap.set('n', '<leader>nn', ':Note ')
