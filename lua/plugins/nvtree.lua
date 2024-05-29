vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require('nvim-tree').setup({
  sort_by = 'case_sensitive',
  view = {
    adaptive_size = true,
    number = true,
    relativenumber = true,
    signcolumn = 'yes',
  },
  renderer = {
    group_empty = true,
    highlight_git = true,
    special_files = {
      'README.md',
      'Makefile',
      'package.json',
      'LICENSE',
      '.gitignore',
      'requirements.txt',
    },
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
      glyphs = {
        default = '',
        symlink = '',
        folder = {
          arrow_closed = '󰜴',
          arrow_open = '󰜮',
          default = '',
          open = '',
          empty = '',
          empty_open = '',
          symlink = '',
          symlink_open = '',
        },
        git = {
          unstaged = '󰦒',
          staged = '󰸞',
          unmerged = '',
          renamed = '➜',
          untracked = '',
          deleted = '󰗨',
          ignored = '',
        }
      }
    }
  },
  filters = {
    dotfiles = true,
    git_ignored = false,
    exclude = { '.gitignore' },
    custom = {
      '.pyc',
      '.DS_Store',
      '.cache',
      '.vscode',
      '.idea',
      -- '__pycache__',
    }
  },
  git = {
    enable = true,
  },
})

vim.keymap.set('n', '<C-b>', ':NvimTreeToggle<CR>')
vim.keymap.set('n', '<C-b>f', ':NvimTreeFindFile<CR>')
vim.keymap.set('n', '<C-b>r', ':NvimTreeRefresh<CR>')

-- close nvim-tree on last buffer


vim.cmd([[ autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif ]]) -- close nvim-tree on last buffer

-- open nvim-tree on startup
-- vim.cmd("autocmd VimEnter * NvimTreeToggle")

