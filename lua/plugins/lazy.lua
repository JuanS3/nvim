-- Install lazylazy
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable',
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup(
  {
    -- Theme
    -- { 'dracula/vim', as = 'dracula' },
    { 'folke/tokyonight.nvim' },
    { 'nvim-tree/nvim-web-devicons' }, -- icons in nvim tree view

    -- Statusline
    { 'nvim-lualine/lualine.nvim' },


    -- Markdown preview
    {
      'iamcco/markdown-preview.nvim',
      cmd = { 'MarkdownPreviewToggle' },
      ft = { 'markdown' },
      build = function() vim.fn['mkdp#util#install']() end,
    },

    -- Fuzzy Finder (files, lsp, etc)
    {
      'nvim-telescope/telescope.nvim',
      branch = '0.1.x',
      dependencies = { 'nvim-lua/plenary.nvim' }
    },                                           -- fuzzy finder for files and lsp results
    { 'nvim-telescope/telescope-symbols.nvim' }, -- symbols in Telescope finder

    -- Slidebar
    { 'nvim-tree/nvim-tree.lua' }, -- file explorer tree view

    -- tree-sitter syntax
    {
      'nvim-treesitter/nvim-treesitter',
      build = ':TSUpdate',
      dependencies = {
        'nvim-treesitter/playground',
        'nvim-treesitter/nvim-treesitter-textobjects',
        'nvim-treesitter/nvim-treesitter-refactor',
        'JoosepAlviste/nvim-ts-context-commentstring',
        'p00f/nvim-ts-rainbow',
      },
    },                                             -- syntax highlighting
    { 'nvim-treesitter/nvim-treesitter-context' }, -- show context

    -- LSP
    { 'neovim/nvim-lspconfig' },                                   -- enable LSP
    { 'williamboman/mason.nvim' },                                 -- simple to use language server installer
    { 'williamboman/mason-lspconfig.nvim' },                       -- simple to use language server installer
    { 'glepnir/lspsaga.nvim',                   branch = 'main' }, -- LSP UI
    { 'jose-elias-alvarez/null-ls.nvim' },                         -- for formatters and linters
    { 'onsails/lspkind.nvim' },                                    -- LSP icons
    { 'VonHeikemen/lsp-zero.nvim' },

    -- Cmp
    { 'hrsh7th/nvim-cmp' },         -- completion plugin
    { 'hrsh7th/cmp-nvim-lsp' },     -- LSP source for nvim-cmp
    { 'hrsh7th/cmp-cmdline' },
    { 'saadparwaiz1/cmp_luasnip' }, -- Snippets source for nvim-cmp
    { 'L3MON4D3/LuaSnip' },         -- Snippets plugin
    { 'nvim-lua/plenary.nvim' },
    {
      'Exafunction/codeium.nvim',
      config = function()
        require('codeium').setup({})
      end
    },

    -- Autopairs
    { 'windwp/nvim-autopairs' }, -- Autopairs, integrates with both cmp and treesitter

    -- Comments
    { 'terrortylor/nvim-comment' }, -- comments in lua

    -- Git
    { 'lewis6991/gitsigns.nvim' }, -- show git diff in gutter signs and stages hunks with <leader>hs and <leader>hu

    -- Keymaps
    { 'folke/which-key.nvim' }, -- keymaps helper for nvim config files

    -- Autosave
    { 'Pocco81/auto-save.nvim' }, -- autosave on focus lost and on buffer write

    -- Python
    { 'Vimjas/vim-python-pep8-indent' }, -- indent for python files

    -- Rust
    { 'rust-lang/rust.vim' },

    -- HTML
    { 'mattn/emmet-vim' }, -- emmet for vim

    -- Tmux
    { 'christoomey/vim-tmux-navigator' }, -- tmux integration

    -- Codesnapshot
    {
      'mistricky/codesnap.nvim',
      as = 'codesnap',
      build = 'make build_generator',
    },

    -- Indent guides
    { 'lukas-reineke/indent-blankline.nvim', main = 'ibl' },

    -- Highlights colors
    { 'brenoprata10/nvim-highlight-colors' },

    -- Autotag
    { 'windwp/nvim-ts-autotag' },

    -- Bufferline
    {
      'akinsho/bufferline.nvim',
      as = 'bufferline',
      dependencies = { 'nvim-tree/nvim-web-devicons' },
    },

    -- Live Server
    {
      'barrett-ruth/live-server.nvim',
      build = 'pnpm add -g live-server',
      cmd = { 'LiveServerStart', 'LiveServerStop' },
      config = true
    },

    -- Cursor
    { 'JuanS3/specs.nvim' },

    -- lazy.nvim
    {
      'folke/noice.nvim',
      event = 'VeryLazy',
      opts = {
        -- add any options here
      },
      dependencies = {
        -- if you lazy-load any plugin below, make sure to add proper `module='...'` entries
        'MunifTanjim/nui.nvim',
        -- OPTIONAL:
        --   `nvim-notify` is only needed, if you want to use the notification view.
        --   If not available, we use `mini` as the fallback
        'rcarriga/nvim-notify',
      }
    },

    -- DEBUG!
    {
      'rcarriga/nvim-dap-ui',
      dependencies = {
        'mfussenegger/nvim-dap',
        'nvim-neotest/nvim-nio'
      }
    },

    -- Neodev
    { 'folke/neodev.nvim', opts = {} },

    -- Notes
    {
      'gsuuon/note.nvim',
      opts = {
        spaces = {
          '~/Notes/',
        }
      },
      cmd = 'Note',
      ft = 'note',
    },

    -- Flash: Search and jump
    {
      "folke/flash.nvim",
      event = "VeryLazy",
      opts = {},
      -- stylua: ignore
      keys = {
        { "s",     mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash" },
        { "S",     mode = { "n", "x", "o" }, function() require("flash").treesitter() end,        desc = "Flash Treesitter" },
        { "r",     mode = "o",               function() require("flash").remote() end,            desc = "Remote Flash" },
        { "R",     mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
        { "<c-s>", mode = { "c" },           function() require("flash").toggle() end,            desc = "Toggle Flash Search" },
      },
    },

    -- Bullets
    {
      'bullets-vim/bullets.vim',
      ft = 'markdown'
    },
  }
)
