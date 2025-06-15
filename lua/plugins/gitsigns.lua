-- local ok, gitsigns = pcall(require, "gitsigns")
-- if not ok then
--   return
-- end
--
-- gitsigns.setup({
--
--   signs = {
--     add = { text = "󰌴" },
--     change = { text = "󰑌" },
--     delete = { text = "󰗨" },
--     topdelete = { text = "󰗨" },
--     changedelete = { text = "~" },
--     untracked = { text = "󱁖" },
--   },
--
--   signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
--   numhl = true, -- Toggle with `:Gitsigns toggle_numhl`
--   linehl = true, -- Toggle with `:Gitsigns toggle_linehl`
--   word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
--   watch_gitdir = {
--     interval = 1000,
--     follow_files = true,
--   },
--
--   attach_to_untracked = true,
--   current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
--   current_line_blame_opts = {
--     virt_text = true,
--     virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
--     delay = 1000,
--     ignore_whitespace = false,
--   },
--   current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
--   -- current_line_blame_formatter_opts = {
--   --   relative_time = false,
--   -- },
--
--   sign_priority = 6,
--   update_debounce = 100,
--   status_formatter = nil, -- Use default
--   max_file_length = 40000,
--
--   preview_config = {
--     -- Options passed to nvim_open_win
--     border = "single",
--     style = "minimal",
--     relative = "cursor",
--     row = 0,
--     col = 1,
--   },
--
--   -- yadm = {
--   --   enable = false,
--   -- },
--
-- })


local ok, gitsigns = pcall(require, "gitsigns")
if not ok then
  return -- Safely exit if gitsigns is not available
end

gitsigns.setup({
  -- Custom signs for Git changes. These require a Nerd Font to display correctly.
  signs = {
    add = { text = "󰌴" },        -- Added lines
    change = { text = "󰑌" },     -- Changed lines
    delete = { text = "󰗨" },     -- Deleted lines (start of deletion)
    topdelete = { text = "󰗨" },  -- Deleted lines (top of a deletion block)
    changedelete = { text = "~" }, -- Changed and deleted lines (replaced with ~)
    untracked = { text = "󱁖" },  -- Untracked files/lines
  },

  -- Enable/disable features that display in the sign column or line.
  signcolumn = true, -- Show signs in the sign column (left gutter)
  numhl = true,      -- Highlight line numbers for changed lines
  linehl = true,     -- Highlight the entire line for changed lines
  word_diff = false, -- Show word-level differences. Can be noisy, so 'false' is common.

  -- Watch the Git directory for changes.
  watch_gitdir = {
    interval = 1000,    -- Check for Git changes every 1000ms (1 second)
    follow_files = true, -- Update signs when files are moved/renamed
  },

  attach_to_untracked = true, -- Show untracked signs on new files.

  -- Current line blame settings (displays git blame info on the current line)
  current_line_blame = true, -- Enable current line blame
  current_line_blame_opts = {
    virt_text = true,   -- Display blame information as virtual text
    virt_text_pos = "eol", -- Position of the virtual text: 'eol' (end of line) | 'overlay' | 'right_align'
    delay = 100,        -- Delay before showing blame (changed from 1000 to 100 for faster feedback)
    ignore_whitespace = false, -- Include whitespace changes in blame (usually false is good)
  },
  -- Formatter for the current line blame virtual text.
  -- `<author>, <author_time:%Y-%m-%d> - <summary>` shows author, date, and commit summary.
  current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
  -- You can use `current_line_blame_formatter_opts.relative_time = true`
  -- if you prefer "2 days ago" instead of explicit date.
  -- current_line_blame_formatter_opts = {
  --   relative_time = false,
  -- },

  sign_priority = 6,     -- Priority for Git signs when multiple signs are on the same line.
  update_debounce = 50,  -- Delay before updating signs after changes (changed from 100 to 50 for faster feedback)
  status_formatter = nil, -- Use default status line formatter (good if Lualine/others handle Git status)
  max_file_length = 40000, -- Maximum file length for Gitsigns to be active (prevents slowdowns on huge files)

  -- Configuration for preview popups (e.g., when hovering over a sign).
  preview_config = {
    border = "single", -- Border style for the preview window
    style = "minimal", -- Window style (minimal, auto, etc.)
    relative = "cursor", -- Position relative to the cursor
    row = 0,           -- Offset row from relative position
    col = 1,           -- Offset column from relative position
  },

  -- yadm = { -- Only enable if you use yadm for dotfile management
  --   enable = false,
  -- },
})

-- --- Optional Keymaps for Gitsigns (consider adding to your keymaps.lua or here) ---

-- -- Text object for git hunks
-- vim.keymap.set({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>', { desc = 'Select Git Hunk' })

-- local gitsigns_opts = { noremap = true, silent = true }
-- vim.keymap.set('n', '<leader>gs', function() require('gitsigns').next_hunk() end, gitsigns_opts)
-- vim.keymap.set('n', '<leader>gp', function() require('gitsigns').prev_hunk() end, gitsigns_opts)
-- vim.keymap.set('n', '<leader>ghs', function() require('gitsigns').stage_hunk() end, gitsigns_opts)
-- vim.keymap.set('n', '<leader>ghu', function() require('gitsigns').undo_stage_hunk() end, gitsigns_opts)
-- vim.keymap.set('n', '<leader>gbs', function() require('gitsigns').blame_line({full = true}) end, { desc = 'Show full blame for line' })
-- vim.keymap.set('n', '<leader>gbd', function() require('gitsigns').diffthis() end, { desc = 'Show diff for current file' })
-- vim.keymap.set('n', '<leader>gbr', function() require('gitsigns').reset_hunk() end, gitsigns_opts)
-- vim.keymap.set('n', '<leader>gbl', function() require('gitsigns').blame_line() end, gitsigns_opts)
-- vim.keymap.set('n', '<leader>gdt', function() require('gitsigns').toggle_current_line_blame() end, { desc = 'Toggle current line blame' })
-- vim.keymap.set('n', '<leader>gtd', function() require('gitsigns').toggle_deleted() end, { desc = 'Toggle showing deleted lines' })
