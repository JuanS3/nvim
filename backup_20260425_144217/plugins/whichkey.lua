local wk = require('which-key')

local mappings = {
  ['<leader>'] = {
    name = 'Main actions',
    w = { ':w<cr>', 'Save' },
    q = { ':q<cr>', 'Quit' },
    Q = { ':q!<cr>', 'Quit!' },
    W = { ':wq<cr>', 'Save and Quit' },
    n = { ':nzzzv<cr>', 'Next search result' },
    N = { ':Nzzzv<cr>', 'Previous search result' },
    x = { ':bd<cr>', 'Close buffer' },
    m = { ':b#<cr>', 'Last buffer' },
    ['<left>'] = { ':vertical resize -20<cr>', 'Decrease window width' },
    ['<right>'] = { ':vertical resize +20<cr>', 'Increase window width' },
    ['<up>'] = { ':resize +10<cr>', 'Increase window height' },
    ['<down>'] = { ':resize -10<cr>', 'Decrease window height' },
    p = { ':bp<cr>', 'Previous buffer' },
  },
}

wk.register(mappings, { prefix = '<leader>' })
