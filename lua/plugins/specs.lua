local specs = require('specs')


specs.setup({
  popup = {
    inc_ms = 10,  -- time increments used for fade/resize effects
    width = 120,
    winhl = 'Search',
    fader = specs.pulse_fader,
    resizer = specs.shrink_resizer,
  },
})

vim.api.nvim_set_keymap('n', '<leader>v',
  ':lua require("specs").show_specs()<CR>',
  { noremap = true, silent = true }
)
