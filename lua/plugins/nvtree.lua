-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1
--
-- require('nvim-tree').setup({
--   sort_by = 'case_sensitive',
--   view = {
--     adaptive_size = true,
--     number = true,
--     relativenumber = true,
--     signcolumn = 'yes',
--   },
--   renderer = {
--     group_empty = true,
--     highlight_git = true,
--     special_files = {
--       'README.md',
--       'Makefile',
--       'package.json',
--       'LICENSE',
--       '.gitignore',
--       'requirements.txt',
--     },
--     icons = {
--       show = {
--         file = true,
--         folder = true,
--         folder_arrow = true,
--         git = true,
--         modified = true,
--         diagnostics = true,
--         bookmarks = true,
--       },
--       glyphs = {
--         default = '',
--         symlink = '',
--         folder = {
--           arrow_closed = '󰜴',
--           arrow_open = '󰜮',
--           default = '',
--           open = '',
--           empty = '',
--           empty_open = '',
--           symlink = '',
--           symlink_open = '',
--         },
--         git = {
--           unstaged = '󰦒',
--           staged = '󰸞',
--           unmerged = '',
--           renamed = '➜',
--           untracked = '',
--           deleted = '󰗨',
--           ignored = '',
--         }
--       }
--     }
--   },
--   filters = {
--     dotfiles = true,
--     git_ignored = false,
--     exclude = { '.gitignore' },
--     custom = {
--       '.pyc',
--       '.DS_Store',
--       '.cache',
--       '.vscode',
--       '.idea',
--       -- '__pycache__',
--     }
--   },
--   git = {
--     enable = true,
--   },
-- })
--
-- vim.keymap.set('n', '<C-b>', ':NvimTreeToggle<CR>')
-- vim.keymap.set('n', '<C-b>f', ':NvimTreeFindFile<CR>')
-- vim.keymap.set('n', '<C-b>r', ':NvimTreeRefresh<CR>')
--
-- -- close nvim-tree on last buffer
--
--
-- vim.cmd([[ autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif ]]) -- close nvim-tree on last buffer
--
-- -- open nvim-tree on startup
-- -- vim.cmd("autocmd VimEnter * NvimTreeToggle")



-- Disable Neovim's built-in file explorer (netrw)
-- This is crucial when using a dedicated file explorer like nvim-tree.lua.
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require('nvim-tree').setup({
  -- Sorting order for files and directories.
  sort_by = 'case_sensitive', -- Sorts alphabetically, respecting case.

  -- Visual settings for the NvimTree window itself.
  view = {
    adaptive_size = true,     -- Automatically adjust NvimTree window size.
    number = true,            -- Show absolute line numbers in NvimTree.
    relativenumber = true,    -- Show relative line numbers in NvimTree.
    signcolumn = 'yes',       -- Always show the sign column (for Git signs, diagnostics).
    width = 30,               -- You could set a fixed width if adaptive_size is too dynamic.
    float = {                 -- Experimental feature for floating NvimTree
      enable = false,
      quit_on_focus_loss = true,
      -- open_fn = function()
      --   return vim.api.nvim_open_win({
      --     relative='editor',
      --     row=0,
      --     col=0,
      --     width=50,
      --     height=20
      --   }, {
      --       enter=true
      --   })
      -- end,
    },
  },

  -- Renderer options control how files and folders are displayed.
  renderer = {
    group_empty = true,       -- Group empty folders together.
    highlight_git = true,     -- Highlight files based on Git status (requires gitsigns).
    -- List of specific files to highlight (e.g., important project files).
    special_files = {
      'README.md',
      'Makefile',
      'package.json',
      'LICENSE',
      '.gitignore',
      'requirements.txt',
      -- You might add: 'Dockerfile', 'docker-compose.yml', 'tsconfig.json'
    },
    -- Icon display settings. Requires nvim-web-devicons for full effect.
    icons = {
      show = {
        file = true,
        folder = true,
        folder_arrow = true,
        git = true,
        modified = true,
        diagnostics = true,
        bookmarks = true,
      },
      -- Custom glyphs (icons). These require a Nerd Font.
      glyphs = {
        default = '',          -- Generic file icon
        symlink = '',          -- Symlink icon
        folder = {
          arrow_closed = '󰜴', -- Closed folder arrow
          arrow_open = '󰜮',    -- Open folder arrow
          default = '',      -- Default folder icon
          open = '',         -- Open folder icon
          empty = '',        -- Empty folder icon
          empty_open = '',    -- Empty open folder icon
          symlink = '',      -- Symlink folder icon
          symlink_open = '', -- Symlink open folder icon
        },
        git = {
          unstaged = '󰦒',      -- Unstaged changes
          staged = '󰸞',       -- Staged changes
          unmerged = '',     -- Unmerged (conflict)
          renamed = '➜',      -- Renamed
          untracked = '',    -- Untracked
          deleted = '󰗨',      -- Deleted
          ignored = '',      -- Ignored
        }
      }
    }
  },

  -- Filters to control which files/folders are displayed in NvimTree.
  filters = {
    dotfiles = true,          -- Show dotfiles (e.g., .bashrc, .config)
    git_ignored = false,      -- Do NOT show git ignored files (true is also common, depends on preference)
    exclude = { '.gitignore' }, -- Explicitly exclude .gitignore from the tree view (even if dotfiles is true)
    custom = {                -- Custom list of patterns to exclude
      '.pyc',
      '.DS_Store',
      '.cache',
      '.vscode',
      '.idea',
      '__pycache__',          -- Added __pycache__ as it's a common Python exclude
    }
  },
  git = {
    enable = true,            -- Enable Git integration (requires gitsigns.nvim)
  },
  -- Diagnostics integration (requires LSP setup)
  diagnostics = {
    enable = true,
    show_on_dirs = true,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    }
  },
  -- Other common options to consider:
  -- update_focused_file = {
  --   enable = true,        -- Auto-reveal and select the current file in the tree
  --   update_cwd = true,    -- Change CWD to the parent of the current file
  --   ignore_list = {},     -- List of filetypes/paths to ignore for auto-updating
  -- },
  -- auto_reload_on_write = true, -- Automatically reload the tree when files change on disk.
  -- disable_netrw = true,     -- This is handled by global vars above, but good to know this option exists.
})

-- --- Keymaps for NvimTree ---
-- It's good practice to use the 'opts' table from keymaps.lua if available,
-- but { silent = true } is fine too.
local nvtree_map_opts = { silent = true, noremap = true }
local map = vim.keymap.set

map('n', '<C-b>', ':NvimTreeToggle<CR>', nvtree_map_opts)       -- Toggle NvimTree
map('n', '<C-b>f', ':NvimTreeFindFile<CR>', nvtree_map_opts)     -- Reveal and select current file in NvimTree
map('n', '<C-b>r', ':NvimTreeRefresh<CR>', nvtree_map_opts)     -- Refresh NvimTree

-- --- Autocommands for NvimTree ---

-- Close NvimTree when it's the last window (very common and useful!)
vim.cmd([[ autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif ]])

-- Open NvimTree on startup (currently commented out)
-- vim.cmd("autocmd VimEnter * NvimTreeToggle")
-- Alternative: Open NvimTree if Neovim starts without arguments
-- vim.cmd([[ autocmd VimEnter * if !argc() | NvimTreeToggle | endif ]])
