-- FIX: live-server.nvim deprecó require('live-server').setup() en favor de vim.g.live_server
-- Se migró la configuración a vim.g.live_server para evitar warnings en startup.
-- Nota: --browser=opera no está soportado por live-server subyacente; se removió.
vim.g.live_server = {
  port = 5000,
}

vim.keymap.set('n', '<leader>lc', '<cmd>LiveServerToggle<cr>')
