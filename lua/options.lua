local opt = vim.opt -- Shorten vim.opt for cleaner code

-- Encoding
opt.encoding = "utf-8"
opt.fileencoding = "utf-8" -- Ensure files are read/written with UTF-8

-- Line Numbers
opt.number = true          -- Enable line numbers
opt.relativenumber = true  -- Enable relative line numbers

-- Indentation
opt.tabstop = 4           -- Number of spaces a Tab character takes
opt.softtabstop = 4       -- Number of spaces for a <Tab> keypress
opt.shiftwidth = 4        -- Number of spaces used for auto-indent
opt.expandtab = true      -- Convert Tabs to spaces
opt.smartindent = true    -- Smart indentation for C-like languages

-- Clipboard
opt.clipboard = "unnamedplus" -- Use system clipboard for yank, delete, put operations

-- UI Blending
opt.winbl = 20        -- Disable window blending by default, as '20' can make things blurry.
                      -- You might want this if you use floating windows (like Noice),
                      -- but set it to 0 initially and adjust per plugin if needed.

-- Cursor Highlighting
opt.cursorline = true     -- Highlight the current line
opt.cursorcolumn = true   -- Generally set to false to avoid visual clutter.
                          -- It can make text hard to read in some contexts.
                          -- Consider removing or setting to false unless explicitly needed.

-- Line Wrapping
opt.wrap = false          -- Do not wrap lines
opt.autoindent = true     -- Auto indentation (global, but relevant for new lines)
opt.formatoptions:remove("t") -- No auto-indent of line breaks, keep line wrap disabled

-- Visual Aides for Whitespace
opt.list = true           -- Show listchars for tabs, trailing spaces, etc.
opt.listchars = "tab:»\\ ,extends:›,precedes:‹,nbsp:·,trail:·" -- show tab characters and trailing whitespace

-- Search Options
opt.ignorecase = true     -- Ignore case when searching
opt.smartcase = true      -- Don't ignore case if search pattern contains uppercase

-- Swap, Backup, and Undo Files
opt.swapfile = false      -- Do not use a swap file for the buffer (modern Neovim uses treesitter/LSP for recovery)
opt.backup = false        -- Do not keep a backup file
opt.undodir = vim.fn.stdpath("data") .. "/undodir" -- Use standard Neovim data path for undo files
-- opt.undodir = os.getenv("HOME") .. "/.vim/undodir" -- set directory where undo files are stored
opt.undofile = true       -- Save undo history to a file

-- Search Highlighting
opt.hlsearch = true       -- Highlight all matches on previous search pattern
opt.incsearch = true      -- Incrementally highlight searches as you type

-- True Color Support
opt.termguicolors = true  -- Enable true color support (necessary for many themes)

-- Scrolling and Sign Column
opt.scrolloff = 8         -- Minimum number of lines to keep above and below the cursor
opt.sidescrolloff = 8     -- Minimum number of columns to keep to the sides of the cursor
opt.signcolumn = "yes"    -- Always show the sign column (e.g., for LSP diagnostics, GitGutter signs)
opt.isfname:append("@-@") -- Include '@' in the set of characters considered part of a file name

-- Update Time for Plugins
opt.updatetime = 300      -- Time in milliseconds to wait before triggering plugin events (e.g., LSP diagnostics).
                          -- 50ms is too low and can cause performance issues or excessive updates.
                          -- 300ms is a common good balance.

--- Autocommands ---

-- Python Formatting (textwidth and colorcolumn)
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = "*.py",
  callback = function()
    opt.textwidth = 120
    opt.colorcolumn = "120"
  end
})

-- JavaScript/HTML/CSS/Lua Formatting (indentation)
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = { "*.js", "*.html", "*.css", "*.lua", "*.sql" },
  callback = function()
    opt.tabstop = 2
    opt.softtabstop = 2
    opt.shiftwidth = 2
  end
})

-- Return to last edit position when opening files
vim.api.nvim_create_autocmd("BufReadPost", {
  pattern = "*",
  callback = function()
    if vim.fn.line("'\"") > 0 and vim.fn.line("'\"") <= vim.fn.line("$") then
      vim.cmd("normal! g`\"")
    end
  end
})

-- Highlight yanked text using the 'IncSearch' highlight group for 40ms
local HighlightYank = vim.api.nvim_create_augroup('HighlightYank', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  group = HighlightYank,
  pattern = '*',
  callback = function()
    vim.highlight.on_yank({
      higroup = 'IncSearch',
      timeout = 40,
    })
  end,
})

-- Remove trailing whitespace from all lines before saving a file
local CleanOnSave = vim.api.nvim_create_augroup('CleanOnSave', { clear = true })
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  group = CleanOnSave,
  pattern = "*",
  command = [[%s/\s\+$//e]],
})

-- Auto-format Python files with Black on save
local Black = vim.api.nvim_create_augroup("Black", { clear = true })
vim.api.nvim_create_autocmd("BufWritePost", {
  group = Black,
  pattern = "*.py",
  command = "silent !black %",
})
