-- <space> bar leader key
vim.g.mapleader = ' '

-- save, quit
vim.keymap.set('n', '<leader>w', ':w<cr>', { silent = true })
vim.keymap.set('n', '<leader>q', ':q<cr>', { silent = true })
vim.keymap.set('n', '<leader>qn', ':q!<cr>', { silent = true })
vim.keymap.set('n', '<leader>wq', ':wq<cr>', { silent = true })

-- ignore capitalization mistakes
vim.cmd('ca W w')
vim.cmd('ca Q q')
vim.cmd('ca WQ wq')
vim.cmd('ca Wq wq')

vim.keymap.set('n', '<leader>sh', ':split<cr>', { silent = true })
vim.keymap.set('n', '<leader>sv', ':vsplit<cr>', { silent = true })

-- Center the screen on the next/prev search result with n/N
vim.keymap.set('n', 'n', 'nzzzv') -- next search result
vim.keymap.set('n', 'N', 'Nzzzv') -- previous search result

-- windows
vim.keymap.set('n', '<leader><left>', ':vertical resize +20<cr>', { silent = true })
vim.keymap.set('n', '<leader><right>', ':vertical resize -20<cr>', { silent = true })
vim.keymap.set('n', '<leader><up>', ':resize +10<cr>', { silent = true })
vim.keymap.set('n', '<leader><down>', ':resize -10<cr>', { silent = true })

-- buffers
vim.keymap.set('n', '<leader>n', ':bn<cr>', { silent = true }) -- next buffer
vim.keymap.set('n', '<leader>p', ':bp<cr>', { silent = true }) -- previous buffer
vim.keymap.set('n', '<leader>x', ':bd<cr>', { silent = true }) -- close buffer
vim.keymap.set('n', '<leader>m', ':b#<cr>', { silent = true }) -- switch to last buffer

-- unhilight
vim.keymap.set('n', '<leader>h', ':noh<cr>', { silent = true }) -- unhilight on search results and cursor position highlight

-- move to beginning/end of line
vim.keymap.set({ 'n', 'v' }, 'H', '^')
vim.keymap.set({ 'n', 'v' }, 'L', '$')

-- move a blocks of text up/down with K/J in visual mode
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { silent = true })
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { silent = true })

-- Center the screen after scrolling up/down with Ctrl-u/d
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', '<C-d>', '<C-d>zz')

vim.keymap.set({ 'n', 'v' }, '<leader>f_', '/_<cr>', { silent = true }) -- move to next underscore
vim.keymap.set({ 'n', 'v' }, '<leader>F_', '?_<cr>', { silent = true }) -- move to previous underscore

vim.keymap.set({ 'n', 'v' }, '<leader>f,', '/,<cr>', { silent = true }) -- move to next comma
vim.keymap.set({ 'n', 'v' }, '<leader>F,', '?,<cr>', { silent = true }) -- move to previous comma

vim.keymap.set({ 'n', 'v' }, '<leader>f(', '/(<cr>', { silent = true }) -- Move to next open parenthesis '('
vim.keymap.set({ 'n', 'v' }, '<leader>F(', '?(<cr>', { silent = true }) -- Move to previous open parenthesis '('
vim.keymap.set({ 'n', 'v' }, '<leader>f)', '/)<cr>', { silent = true }) -- Move to next close parenthesis ')'
vim.keymap.set({ 'n', 'v' }, '<leader>F)', '?)<cr>', { silent = true }) -- Move to previous close parenthesis ')'

vim.keymap.set({ 'n', 'v' }, '<leader>f[', '/[<cr>', { silent = true }) -- Move to next open square bracket '['
vim.keymap.set({ 'n', 'v' }, '<leader>F[', '?[<cr>', { silent = true }) -- Move to previous open square bracket '['
vim.keymap.set({ 'n', 'v' }, '<leader>f]', '/]<cr>', { silent = true }) -- Move to next close square bracket ']'
vim.keymap.set({ 'n', 'v' }, '<leader>F]', '?]<cr>', { silent = true }) -- Move to previous close square bracket ']'

vim.keymap.set({ 'n', 'v' }, '<leader>f{', '/{<cr>', { silent = true }) -- Move to next open curly bracket '{'
vim.keymap.set({ 'n', 'v' }, '<leader>F{', '?{<cr>', { silent = true }) -- Move to previous open curly bracket '{'
vim.keymap.set({ 'n', 'v' }, '<leader>f}', '/}<cr>', { silent = true }) -- Move to next close curly bracket '}'
vim.keymap.set({ 'n', 'v' }, '<leader>F}', '?}<cr>', { silent = true }) -- Move to previous close curly bracket '}'

-- Go to next/previous erro_nd ENTER
vim.keymap.set('n', '<leader>ne', vim.diagnostic.goto_next)
vim.keymap.set('n', '<leader>pe', vim.diagnostic.goto_prev)


-- Run Python file (adapted for kitty terminal)
vim.keymap.set('n', '<F5>', function()
  local filetype = vim.api.nvim_get_option_value('filetype', { buf = 0 })

  local commands = {
    python = 'python3',
    go = 'go run',
    rust = 'cargo run',
  }

  local command = commands[filetype]

  if command then
    -- Open a new kitty window and run the command
    vim.api.nvim_command(':silent !kitty --hold sh -c "' .. command .. ' ' .. vim.api.nvim_buf_get_name(0) .. '"')
  else
    vim.api.nvim_command(":echo 'Buffer type not supported: " .. filetype .. "'")
  end
end)

-- Run unit tests (adapted for kitty terminal)
vim.keymap.set('n', '<F6>', function()
  -- Replace with your desired unit testing command(s)
  -- Example for unittest framework:
  vim.api.nvim_command(':silent !kitty --hold sh -c "python3 -m unittest "')
  -- Remember to update tests.py with your actual test file name
end)
