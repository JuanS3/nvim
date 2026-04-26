local wk = require('which-key')

-- FIX: Migrado de wk.register() (deprecado en which-key v3) a wk.add()
wk.add({
  { '<leader>w',  ':w<cr>',                  desc = 'Save' },
  { '<leader>q',  ':q<cr>',                  desc = 'Quit' },
  { '<leader>Q',  ':q!<cr>',                 desc = 'Quit!' },
  { '<leader>W',  ':wq<cr>',                 desc = 'Save and Quit' },
  { '<leader>n',  ':nzzzv<cr>',              desc = 'Next search result' },
  { '<leader>N',  ':Nzzzv<cr>',              desc = 'Previous search result' },
  { '<leader>x',  ':bd<cr>',                 desc = 'Close buffer' },
  { '<leader>m',  ':b#<cr>',                 desc = 'Last buffer' },
  { '<leader><left>',  ':vertical resize -20<cr>', desc = 'Decrease window width' },
  { '<leader><right>', ':vertical resize +20<cr>', desc = 'Increase window width' },
  { '<leader><up>',    ':resize +10<cr>',          desc = 'Increase window height' },
  { '<leader><down>',  ':resize -10<cr>',          desc = 'Decrease window height' },
  { '<leader>p',  ':bp<cr>',                 desc = 'Previous buffer' },
})
