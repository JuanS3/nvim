-- -- <space> bar leader key
-- vim.g.mapleader = ' '
--
-- -- save, quit
-- vim.keymap.set('n', '<leader>w', ':w<cr>', { silent = true })
-- vim.keymap.set('n', '<leader>q', ':q<cr>', { silent = true })
-- vim.keymap.set('n', '<leader>qn', ':q!<cr>', { silent = true })
-- vim.keymap.set('n', '<leader>wq', ':wq<cr>', { silent = true })
--
-- -- ignore capitalization mistakes
-- vim.cmd('ca W w')
-- vim.cmd('ca Q q')
-- vim.cmd('ca WQ wq')
-- vim.cmd('ca Wq wq')
--
-- vim.keymap.set('n', '<leader>sh', ':split<cr>', { silent = true })
-- vim.keymap.set('n', '<leader>sv', ':vsplit<cr>', { silent = true })
--
-- -- Center the screen on the next/prev search result with n/N
-- vim.keymap.set('n', 'n', 'nzzzv') -- next search result
-- vim.keymap.set('n', 'N', 'Nzzzv') -- previous search result
--
-- -- windows
-- vim.keymap.set('n', '<leader><left>', ':vertical resize +20<cr>', { silent = true })
-- vim.keymap.set('n', '<leader><right>', ':vertical resize -20<cr>', { silent = true })
-- vim.keymap.set('n', '<leader><up>', ':resize +10<cr>', { silent = true })
-- vim.keymap.set('n', '<leader><down>', ':resize -10<cr>', { silent = true })
--
-- -- buffers
-- vim.keymap.set('n', '<leader>n', ':bn<cr>', { silent = true }) -- next buffer
-- vim.keymap.set('n', '<leader>p', ':bp<cr>', { silent = true }) -- previous buffer
-- vim.keymap.set('n', '<leader>x', ':bd<cr>', { silent = true }) -- close buffer
-- vim.keymap.set('n', '<leader>m', ':b#<cr>', { silent = true }) -- switch to last buffer
--
-- -- unhilight
-- vim.keymap.set('n', '<leader>h', ':noh<cr>', { silent = true }) -- unhilight on search results and cursor position highlight
--
-- -- move to beginning/end of line
-- vim.keymap.set({ 'n', 'v' }, 'H', '^')
-- vim.keymap.set({ 'n', 'v' }, 'L', '$')
--
-- -- move a blocks of text up/down with K/J in visual mode
-- vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { silent = true })
-- vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { silent = true })
--
-- -- Center the screen after scrolling up/down with Ctrl-u/d
-- vim.keymap.set('n', '<C-u>', '<C-u>zz')
-- vim.keymap.set('n', '<C-d>', '<C-d>zz')
--
-- vim.keymap.set({ 'n', 'v' }, '<leader>f_', '/_<cr>', { silent = true }) -- move to next underscore
-- vim.keymap.set({ 'n', 'v' }, '<leader>F_', '?_<cr>', { silent = true }) -- move to previous underscore
--
-- vim.keymap.set({ 'n', 'v' }, '<leader>f,', '/,<cr>', { silent = true }) -- move to next comma
-- vim.keymap.set({ 'n', 'v' }, '<leader>F,', '?,<cr>', { silent = true }) -- move to previous comma
--
-- vim.keymap.set({ 'n', 'v' }, '<leader>f(', '/(<cr>', { silent = true }) -- Move to next open parenthesis '('
-- vim.keymap.set({ 'n', 'v' }, '<leader>F(', '?(<cr>', { silent = true }) -- Move to previous open parenthesis '('
-- vim.keymap.set({ 'n', 'v' }, '<leader>f)', '/)<cr>', { silent = true }) -- Move to next close parenthesis ')'
-- vim.keymap.set({ 'n', 'v' }, '<leader>F)', '?)<cr>', { silent = true }) -- Move to previous close parenthesis ')'
--
-- vim.keymap.set({ 'n', 'v' }, '<leader>f[', '/[<cr>', { silent = true }) -- Move to next open square bracket '['
-- vim.keymap.set({ 'n', 'v' }, '<leader>F[', '?[<cr>', { silent = true }) -- Move to previous open square bracket '['
-- vim.keymap.set({ 'n', 'v' }, '<leader>f]', '/]<cr>', { silent = true }) -- Move to next close square bracket ']'
-- vim.keymap.set({ 'n', 'v' }, '<leader>F]', '?]<cr>', { silent = true }) -- Move to previous close square bracket ']'
--
-- vim.keymap.set({ 'n', 'v' }, '<leader>f{', '/{<cr>', { silent = true }) -- Move to next open curly bracket '{'
-- vim.keymap.set({ 'n', 'v' }, '<leader>F{', '?{<cr>', { silent = true }) -- Move to previous open curly bracket '{'
-- vim.keymap.set({ 'n', 'v' }, '<leader>f}', '/}<cr>', { silent = true }) -- Move to next close curly bracket '}'
-- vim.keymap.set({ 'n', 'v' }, '<leader>F}', '?}<cr>', { silent = true }) -- Move to previous close curly bracket '}'
--
-- -- Go to next/previous erro_nd ENTER
-- vim.keymap.set('n', '<leader>ne', vim.diagnostic.goto_next)
-- vim.keymap.set('n', '<leader>pe', vim.diagnostic.goto_prev)
--
--
-- -- Run Python file (adapted for kitty terminal)
-- vim.keymap.set('n', '<F5>', function()
--   local filetype = vim.api.nvim_get_option_value('filetype', { buf = 0 })
--
--   local commands = {
--     python = 'python3',
--     go = 'go run',
--     rust = 'cargo run',
--   }
--
--   local command = commands[filetype]
--
--   if command then
--     -- Open a new kitty window and run the command
--     vim.api.nvim_command(':silent !kitty --hold sh -c "' .. command .. ' ' .. vim.api.nvim_buf_get_name(0) .. '"')
--   else
--     vim.api.nvim_command(":echo 'Buffer type not supported: " .. filetype .. "'")
--   end
-- end)
--
-- -- Run unit tests (adapted for kitty terminal)
-- vim.keymap.set('n', '<F6>', function()
--   -- Replace with your desired unit testing command(s)
--   -- Example for unittest framework:
--   vim.api.nvim_command(':silent !kitty --hold sh -c "python3 -m unittest "')
--   -- Remember to update tests.py with your actual test file name
-- end)


-- <space> bar leader key
vim.g.mapleader = ' '

local map = vim.keymap.set
-- Default options for keymaps: not recursive, silent
local opts = { noremap = true, silent = true }

-- --- Editor Basics ---

-- Save, Quit
map('n', '<leader>w', ':w<cr>', opts)
map('n', '<leader>q', ':q<cr>', opts)
map('n', '<leader>qn', ':q!<cr>', opts)
map('n', '<leader>wq', ':wq<cr>', opts)

-- Command aliases (using vim.api.nvim_set_command for consistency with Lua)
-- Note: These create actual Vim commands, not keymaps.
vim.api.nvim_create_user_command('W', 'write', {})
vim.api.nvim_create_user_command('Q', 'quit', {})
vim.api.nvim_create_user_command('WQ', 'wq', {})
vim.api.nvim_create_user_command('Wq', 'wq', {})

-- Window Management
map('n', '<leader>sh', ':split<cr>', opts)  -- Split horizontally
map('n', '<leader>sv', ':vsplit<cr>', opts) -- Split vertically

-- Resize Windows
map('n', '<leader><left>', ':vertical resize +20<cr>', opts)
map('n', '<leader><right>', ':vertical resize -20<cr>', opts)
map('n', '<leader><up>', ':resize +10<cr>', opts)
map('n', '<leader><down>', ':resize -10<cr>', opts)

-- --- Navigation ---

-- Center the screen on the next/prev search result with n/N
map('n', 'n', 'nzzzv', opts) -- Next search result, center screen
map('n', 'N', 'Nzzzv', opts) -- Previous search result, center screen

-- Highlight search results (remove highlighting)
map('n', '<leader>h', ':noh<cr>', opts)

-- Move to beginning/end of line
map({ 'n', 'v' }, 'H', '^', opts)
map({ 'n', 'v' }, 'L', '$', opts)

-- Move blocks of text up/down in visual mode
map('v', 'K', ":m '<-2<CR>gv=gv", opts) -- Move up
map('v', 'J', ":m '>+1<CR>gv=gv", opts) -- Move down

-- Center the screen after scrolling up/down with Ctrl-u/d
map('n', '<C-u>', '<C-u>zz', opts)
map('n', '<C-d>', '<C-d>zz', opts)

-- Move to specific characters (using / and ? is efficient, but if you prefer fixed mappings)
-- Consider if these are truly necessary if you use 'f', 't', ';', ',' or plugins like 'Leap.nvim'
map({ 'n', 'v' }, '<leader>f_', '/_<cr>', opts) -- Move to next underscore
map({ 'n', 'v' }, '<leader>F_', '?_<cr>', opts) -- Move to previous underscore
map({ 'n', 'v' }, '<leader>f,', '/,<cr>', opts) -- Move to next comma
map({ 'n', 'v' }, '<leader>F,', '?,<cr>', opts) -- Move to previous comma
map({ 'n', 'v' }, '<leader>f(', '/(<cr>', opts) -- Move to next open parenthesis '('
map({ 'n', 'v' }, '<leader>F(', '?(<cr>', opts) -- Move to previous open parenthesis '('
map({ 'n', 'v' }, '<leader>f)', '/)<cr>', opts) -- Move to next close parenthesis ')'
map({ 'n', 'v' }, '<leader>F)', '?)<cr>', opts) -- Move to previous close parenthesis ')'
map({ 'n', 'v' }, '<leader>f[', '/[<cr>', opts) -- Move to next open square bracket '['
map({ 'n', 'v' }, '<leader>F[', '?[<cr>', opts) -- Move to previous open square bracket '['
map({ 'n', 'v' }, '<leader>f]', '/]<cr>', opts) -- Move to next close square bracket ']'
map({ 'n', 'v' }, '<leader>F]', '?]<cr>', opts) -- Move to previous close square bracket ']'
map({ 'n', 'v' }, '<leader>f{', '/{<cr>', opts) -- Move to next open curly bracket '{'
map({ 'n', 'v' }, '<leader>F{', '?{<cr>', opts) -- Move to previous open curly bracket '{'
map({ 'n', 'v' }, '<leader>f}', '/}<cr>', opts) -- Move to next close curly bracket '}'
map({ 'n', 'v' }, '<leader>F}', '?}<cr>', opts) -- Move to previous close curly bracket '}'

-- --- Buffer Management (using Bufferline for enhanced functionality) ---
-- If you're using Bufferline, these mappings are more robust.
-- If not, your ':bn<cr>', ':bp<cr>', ':bd<cr>' are perfectly fine.
-- map('n', '<leader>n', '<cmd>BufferLineCycleNext<cr>', opts)    -- Next buffer via Bufferline
-- map('n', '<leader>p', '<cmd>BufferLineCyclePrev<cr>', opts)    -- Previous buffer via Bufferline
map('n', '<leader>x', '<cmd>BufferLineClose<cr>', opts) -- Close current buffer via Bufferline
-- map('n', '<leader>m', '<cmd>BufferLineGoToBuffer 1<cr>', opts) -- Go to first buffer (example, customize as needed)
-- Note: '<leader>m' as ':b#<cr>' switches to last buffer.
--       If you want to keep that functionality, you can do:
--       map('n', '<leader>m', ':b#<cr>', opts)

-- --- LSP Diagnostics ---
map('n', '<leader>ne', vim.diagnostic.goto_next, opts) -- Go to next diagnostic
map('n', '<leader>pe', vim.diagnostic.goto_prev, opts) -- Go to previous diagnostic

map('n', 'gD', vim.lsp.buf.declaration, opts)
map('n', 'gd', vim.lsp.buf.definition, opts)
map('n', 'K', vim.lsp.buf.hover, opts)
map('n', 'gi', vim.lsp.buf.implementation, opts)
map('n', '<leader>D', vim.lsp.buf.type_definition, opts)
map('n', 'gr', vim.lsp.buf.references, opts)
map('n', '<leader>rn', vim.lsp.buf.rename, opts)
map('n', '<leader>ca', vim.lsp.buf.code_action, opts)
map('n', '<leader>f', function() vim.lsp.buf.format({ async = true }) end, opts)
map('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, opts)
map('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, opts)
map('n', '<leader>wl', function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, opts)
map('n', '<leader>ws', vim.lsp.buf.workspace_symbol, opts)
-- --- Custom Functions (Run File / Unit Tests) ---

-- Run Python/Go/Rust file (adapted for kitty terminal)
map('n', '<F5>', function()
  local filetype = vim.api.nvim_get_option_value('filetype', { buf = 0 })

  local commands = {
    python = 'uv run',
    go = 'go run',
    rust = 'cargo run',
    -- Add more file types and their run commands here
    -- bash = 'bash',
    -- lua = 'lua',
    -- node = 'node',
  }

  local command_prefix = commands[filetype]
  local file_path = vim.api.nvim_buf_get_name(0) -- Get full path of current file

  if command_prefix then
    -- Construct the full command. Use vim.fn.shellescape for safety.
    local full_command = command_prefix .. ' ' .. vim.fn.shellescape(file_path)

    -- Open a new vertical split terminal and execute the command.
    -- The `.` at the end of the command will keep the terminal open after execution.
    vim.api.nvim_command(':vsplit term://' ..
      full_command .. '; read -n 1 -p "Press any key to close this terminal..." && exit')
    -- Explanation of the added shell commands:
    -- `; read -n 1 -s -p "..."`: Waits for a single key press (-n 1), silently (-s),
    --                          with a prompt (-p).
    -- `&& exit`: If read is successful, the terminal will then close.
    -- You can remove `&& exit` if you prefer the terminal to stay open for manual interaction.
  else
    vim.api.nvim_command(":echo 'Buffer type not supported for running: " .. filetype .. "'")
  end
end, opts)


-- Run unit tests in a new vertical split terminal
map('n', '<F6>', function()
  local filetype = vim.api.nvim_get_option_value('filetype', { buf = 0 })
  local current_file = vim.api.nvim_buf_get_name(0)
  local test_command = ''

  if filetype == 'python' then
    test_command = 'uv run -m unittest ' .. vim.fn.shellescape(current_file)
    -- Or for pytest: test_command = 'pytest ' .. vim.fn.shellescape(current_file)
  elseif filetype == 'javascript' then
    test_command =
    'npm test' -- Often runs all tests, or configure Jest to run specific files
  elseif filetype == 'go' then
    test_command = 'go test -v ' ..
        vim.fn.shellescape(vim.fn.fnamemodify(current_file, ':h')) -- Run tests in current directory
  else
    vim.api.nvim_command(":echo 'No unit test command configured for filetype: " .. filetype .. "'")
    return -- Exit function if no command is found
  end

  if test_command ~= '' then
    -- Open a new vertical split terminal and execute the test command.
    vim.api.nvim_command(':vsplit term://' ..
      test_command .. '; read -n 1 -p "Press any key to close this terminal..." && exit')
  end
end, opts)
