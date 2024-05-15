require('specs').setup({
  show_jumps = true,
  min_jump = 30,
  popup = {
    delay_ms = 0, -- delay before popup displays
    inc_ms = 10, -- time increments used for fade/resize effects
    blend = 10, -- starting blend, between 0-100 (fully transparent), see :h winblend
    width = 10,
    winhl = "PMenu",
    fader = require('specs').linear_fader,
    resizer = require('specs').shrink_resizer
  },
  ignore_filetypes = {},
  ignore_buftypes = {
    nofile = true,
  },
})

vim.api.nvim_set_keymap('n', '<leader>v', ':lua require("specs").show_specs({width = 120, winhl = "Search", delay_ms = 10, inc_ms = 5})<CR>', { noremap = true, silent = true })
