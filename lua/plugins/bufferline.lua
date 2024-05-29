require('bufferline').setup({
  options = {
    offsets = {
      {
        filetype = "NvimTree",
        text = '⦗ One Code ⦘',
        highlight = 'Directory',
        text_align = 'center',
      },
    },
    diagnostics = 'nvim_lsp',
    separator_style = 'slant',
    show_close_icon = false,
    numbers = function(opts)
      return string.format('%s\u{E0B9}', opts.lower(opts.ordinal))
    end,
    diagnostics_indicator = function (count, level)
      local icon = level:match('error') and ' ' or ' '
      return ' ' .. icon .. count
    end
  },
})


vim.keymap.set('n', '<leader>1', ':BufferLineGoToBuffer 1<cr>')
vim.keymap.set('n', '<leader>2', ':BufferLineGoToBuffer 2<cr>')
vim.keymap.set('n', '<leader>3', ':BufferLineGoToBuffer 3<cr>')
vim.keymap.set('n', '<leader>4', ':BufferLineGoToBuffer 4<cr>')
vim.keymap.set('n', '<leader>5', ':BufferLineGoToBuffer 5<cr>')
vim.keymap.set('n', '<leader>6', ':BufferLineGoToBuffer 6<cr>')
vim.keymap.set('n', '<leader>7', ':BufferLineGoToBuffer 7<cr>')
vim.keymap.set('n', '<leader>8', ':BufferLineGoToBuffer 8<cr>')
vim.keymap.set('n', '<leader>9', ':BufferLineGoToBuffer 9<cr>')
vim.keymap.set('n', '<leader>0', ':BufferLineGoToBuffer -1<cr>')

vim.keymap.set('n', '<left>', ':BufferLineCyclePrev<cr>')
vim.keymap.set('n', '<right>', ':BufferLineCycleNext<cr>')
