-- require('bufferline').setup({
--   options = {
--     offsets = {
--       {
--         filetype = "NvimTree",
--         text = '⦗ One Code ⦘',
--         highlight = 'Directory',
--         text_align = 'center',
--       },
--     },
--     diagnostics = 'nvim_lsp',
--     separator_style = 'slant',
--     show_close_icon = false,
--     numbers = function(opts)
--       return string.format('%s\u{E0B9}', opts.lower(opts.ordinal))
--     end,
--     diagnostics_indicator = function (count, level)
--       local icon = level:match('error') and ' ' or ' '
--       return ' ' .. icon .. count
--     end
--   },
-- })
--
--
-- vim.keymap.set('n', '<leader>1', ':BufferLineGoToBuffer 1<cr>')
-- vim.keymap.set('n', '<leader>2', ':BufferLineGoToBuffer 2<cr>')
-- vim.keymap.set('n', '<leader>3', ':BufferLineGoToBuffer 3<cr>')
-- vim.keymap.set('n', '<leader>4', ':BufferLineGoToBuffer 4<cr>')
-- vim.keymap.set('n', '<leader>5', ':BufferLineGoToBuffer 5<cr>')
-- vim.keymap.set('n', '<leader>6', ':BufferLineGoToBuffer 6<cr>')
-- vim.keymap.set('n', '<leader>7', ':BufferLineGoToBuffer 7<cr>')
-- vim.keymap.set('n', '<leader>8', ':BufferLineGoToBuffer 8<cr>')
-- vim.keymap.set('n', '<leader>9', ':BufferLineGoToBuffer 9<cr>')
-- vim.keymap.set('n', '<leader>0', ':BufferLineGoToBuffer -1<cr>')
--
-- vim.keymap.set('n', '<left>', ':BufferLineCyclePrev<cr>')
-- vim.keymap.set('n', '<right>', ':BufferLineCycleNext<cr>')


require('bufferline').setup({
  options = {
    -- Offsets allow you to add content to the left of the bufferline
    -- This is great for integrating with file explorers like NvimTree.
    offsets = {
      {
        filetype = "NvimTree", -- Apply this offset specifically when NvimTree is open
        text = '⦗ Datolytix ⦘',  -- Custom text to display
        highlight = 'Directory', -- Highlight group for the text (e.g., to match your directory colors)
        text_align = 'center',   -- Center the text within the offset area
      },
    },
    -- Show LSP diagnostics directly in the bufferline tabs
    diagnostics = 'nvim_lsp',
    -- Style of the separators between buffer tabs
    separator_style = 'slant', -- 'slant', 'padded_slant', 'thin', 'padded_thin' or a table of characters
    show_close_icon = false,   -- Hide the 'x' icon to close buffers

    -- Custom function to format buffer numbers
    numbers = function(opts)
      -- `opts.ordinal` is the 1-based index of the buffer.
      -- `opts.lower` converts to lowercase (not relevant for numbers).
      -- `\u{E0B9}` is a Unicode Powerline symbol (right-pointing triangle).
      -- This creates a format like "1", "2", etc.
      return string.format('%s\u{E0B9}', opts.ordinal)
    end,

    -- Custom function to format diagnostic indicators
    diagnostics_indicator = function(count, level)
      local icon = level:match('error') and ' ' or ' '
      -- The icons '' (error) and '' (warning/info) require a Nerd Font.
      -- Formats as "  5" for 5 errors, or "  3" for 3 warnings/info.
      return ' ' .. icon .. count
    end,

    -- --- Recommended additional options ---

    -- Show buffer numbers or indices in the bufferline.
    -- Default is 'ordinal' (1, 2, 3...). You can also use 'buffer_id', 'none'.
    -- You already have a custom 'numbers' function, which overrides this.
    -- numbers = 'ordinal',

    -- How to show buffers that are not visible. 'none' is common for simplicity.
    -- other_buffer_kennung = 'none',
    -- indents_after_offsets = false, -- Prevent extra indentation after offsets if you don't like it.

    -- Order buffers. 'default_by_age' is often good.
    -- buffer_close_icon = '', -- Custom close icon (if show_close_icon is true)
    modified_icon = '●', -- Icon for modified buffers
    -- left_trunc_marker = '', -- Marker for truncated tabs on the left
    -- right_trunc_marker = '', -- Marker for truncated tabs on the right
    max_name_length = 18, -- Max length of buffer name before truncation
    max_prefix_length = 15, -- Max length of directory prefix for buffer name
    show_buffer_icons = true, -- Show filetype icons (requires nvim-web-devicons)
    -- show_buffer_close_icons = 'all', -- 'always', 'on_hover', 'none', 'all'
    show_tab_indicators = true, -- Show a small line/dot under active tab
    perspective_icon = '🗠', -- Icon for perspective (if using persisted.nvim)
    -- diagnostics_update_in_insert = false, -- Do not update diagnostics in insert mode
  },
})

-- --- Keymaps for Bufferline ---

-- It's good practice to use the 'opts' table from keymaps.lua if available,
-- but { silent = true } is fine too.
local buf_map_opts = { silent = true, noremap = true } -- Define options once
local map = vim.keymap.set

-- Go to specific buffer by number
-- Ensure these mappings use the `buf_map_opts` table.
map('n', '<leader>1', ':BufferLineGoToBuffer 1<cr>', buf_map_opts)
map('n', '<leader>2', ':BufferLineGoToBuffer 2<cr>', buf_map_opts)
map('n', '<leader>3', ':BufferLineGoToBuffer 3<cr>', buf_map_opts)
map('n', '<leader>4', ':BufferLineGoToBuffer 4<cr>', buf_map_opts)
map('n', '<leader>5', ':BufferLineGoToBuffer 5<cr>', buf_map_opts)
map('n', '<leader>6', ':BufferLineGoToBuffer 6<cr>', buf_map_opts)
map('n', '<leader>7', ':BufferLineGoToBuffer 7<cr>', buf_map_opts)
map('n', '<leader>8', ':BufferLineGoToBuffer 8<cr>', buf_map_opts)
map('n', '<leader>9', ':BufferLineGoToBuffer 9<cr>', buf_map_opts)
map('n', '<leader>0', ':BufferLineGoToBuffer -1<cr>', buf_map_opts) -- -1 usually means the last buffer, check bufferline docs for exact behavior.

-- Cycle through buffers
map('n', '<left>', ':BufferLineCyclePrev<cr>', buf_map_opts)
map('n', '<right>', ':BufferLineCycleNext<cr>', buf_map_opts)

-- --- Other useful Bufferline mappings (consider adding) ---
-- Close current buffer (you have this in keymaps.lua as <leader>x)
map('n', '<leader>x', ':BufferLineClose<cr>', buf_map_opts)

-- Close all other buffers
-- vim.keymap.set('n', '<leader>bc', ':BufferLineCloseOthers<cr>', buf_map_opts)

-- Pin/Unpin current buffer
-- vim.keymap.set('n', '<leader>bp', ':BufferLineTogglePin<cr>', buf_map_opts)

-- Sort buffers
map('n', '<leader>bs', ':BufferLineSortByDirectory<cr>', buf_map_opts)
