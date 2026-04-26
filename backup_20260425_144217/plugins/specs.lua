local specs = require('specs')

specs.setup({
  popup = {
    inc_ms = 10, -- time increments used for fade/resize effects
    width = 120,
    winhl = 'Search',
  },
})

vim.api.nvim_set_keymap('n', '<leader>v',
  ':lua require("specs").show_specs()<CR>',
  { noremap = true, silent = true }
)

vim.api.nvim_set_keymap('n', 'n',
  'n:lua require("specs").show_specs()<CR>',
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap('n', 'N',
  'N:lua require("specs").show_specs()<CR>',
  { noremap = true, silent = true }
)
