-- require('lualine').setup {
--   options = {
--     icons_enabled = true,
--     theme = 'tokyonight',
--     component_separators = { left = '\u{E0B5}', right = '\u{E0B7}'},
--     section_separators = { left = '\u{E0B4}', right = '\u{E0B6}'},
--     disabled_filetypes = {
--       statusline = {},
--       winbar = {},
--     },
--     ignore_focus = {},
--     always_divide_middle = true,
--     globalstatus = false,
--     refresh = {
--       statusline = 1000,
--       tabline = 1000,
--       winbar = 1000,
--     }
--   },
--   sections = {
--     lualine_a = {'mode'},
--     lualine_b = {'branch', 'diff', 'diagnostics'},
--     lualine_c = {'filename'},
--     lualine_x = {'encoding', 'fileformat', 'filetype'},
--     lualine_y = {'progress'},
--     lualine_z = {'location'}
--   },
--   inactive_sections = {
--     lualine_a = {},
--     lualine_b = {},
--     lualine_c = {'filename'},
--     lualine_x = {'location'},
--     lualine_y = {},
--     lualine_z = {}
--   },
--   tabline = {},
--   winbar = {},
--   inactive_winbar = {},
--   extensions = {}
-- }



require('lualine').setup {
  options = {
    icons_enabled = true, -- Enable Nerd Font icons (requires a Nerd Font in your terminal)
    theme = 'tokyonight', -- Use the 'tokyonight' theme for Lualine (ensure your main colorscheme supports this or is similar)
    -- Custom Powerline-style separators. Require a Nerd Font.
    component_separators = { left = '\u{E0B5}', right = '\u{E0B7}' }, -- Arrows between components
    section_separators = { left = '\u{E0B4}', right = '\u{E0B6}' },   -- Arrows between sections
    disabled_filetypes = {
      statusline = {}, -- No filetypes disable the statusline
      winbar = {},     -- No filetypes disable the winbar
    },
    ignore_focus = {},         -- No specific windows/buffers to ignore focus
    always_divide_middle = true, -- Always divide the middle section even if there's no Lualine_c content.
    globalstatus = false,      -- Statusline is per-window, not global (true makes it global).
    refresh = {
      statusline = 500, -- Refresh statusline every 500ms (was 1000, faster feedback)
      tabline = 500,    -- Refresh tabline every 500ms (was 1000, faster feedback)
      winbar = 500,     -- Refresh winbar every 500ms (was 1000, faster feedback)
    }
  },
  sections = {
    -- Active window statusline sections
    lualine_a = {'mode'},        -- Mode indicator (e.g., NORMAL, INSERT)
    lualine_b = {'branch', 'diff', 'diagnostics'}, -- Git branch, Git diff, LSP diagnostics
    lualine_c = {'filename'},    -- Current filename
    lualine_x = {'encoding', 'fileformat', 'filetype'}, -- File encoding, format (unix/dos), and type
    lualine_y = {'progress'},    -- Progress bar/percentage
    lualine_z = {'location'}     -- Current line/column location
  },
  inactive_sections = {
    -- Inactive window statusline sections (less detailed to reduce clutter)
    lualine_a = {},              -- No mode
    lualine_b = {},              -- No branch/diff/diagnostics
    lualine_c = {'filename'},    -- Still show filename
    lualine_x = {'location'},    -- Still show location
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},                  -- No tabline enabled by default (common if using bufferline)
  winbar = {},                   -- No winbar enabled by default (can be useful for breadcrumbs)
  inactive_winbar = {},
  extensions = { 'nvim-tree', 'lazy' }                -- No extensions enabled (e.g., 'nvim-tree', 'lazy')
}

