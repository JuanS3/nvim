-- -- Install lazylazy
-- local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
-- if not vim.loop.fs_stat(lazypath) then
--   vim.fn.system({
--     'git',
--     'clone',
--     '--filter=blob:none',
--     'https://github.com/folke/lazy.nvim.git',
--     '--branch=stable',
--     lazypath,
--   })
-- end
-- vim.opt.rtp:prepend(lazypath)
--
-- require('lazy').setup(
--   {
--     -- Theme
--     -- { 'dracula/vim', as = 'dracula' },
--     { 'folke/tokyonight.nvim' },
--     { 'nvim-tree/nvim-web-devicons' }, -- icons in nvim tree view
--
--     -- Statusline
--     { 'nvim-lualine/lualine.nvim' },
--
--
--     -- Markdown preview
--     {
--       'iamcco/markdown-preview.nvim',
--       cmd = { 'MarkdownPreviewToggle' },
--       ft = { 'markdown' },
--       build = function() vim.fn['mkdp#util#install']() end,
--     },
--
--     -- Fuzzy Finder (files, lsp, etc)
--     {
--       'nvim-telescope/telescope.nvim',
--       branch = '0.1.x',
--       dependencies = { 'nvim-lua/plenary.nvim' }
--     },                                           -- fuzzy finder for files and lsp results
--     { 'nvim-telescope/telescope-symbols.nvim' }, -- symbols in Telescope finder
--
--     -- Slidebar
--     { 'nvim-tree/nvim-tree.lua' }, -- file explorer tree view
--
--     -- tree-sitter syntax
--     {
--       'nvim-treesitter/nvim-treesitter',
--       build = ':TSUpdate',
--       dependencies = {
--         'nvim-treesitter/playground',
--         'nvim-treesitter/nvim-treesitter-textobjects',
--         'nvim-treesitter/nvim-treesitter-refactor',
--         'JoosepAlviste/nvim-ts-context-commentstring',
--         'p00f/nvim-ts-rainbow',
--       },
--     },                                             -- syntax highlighting
--     { 'nvim-treesitter/nvim-treesitter-context' }, -- show context
--
--     -- LSP
--     { 'neovim/nvim-lspconfig' },                                   -- enable LSP
--     { 'williamboman/mason.nvim' },                                 -- simple to use language server installer
--     { 'williamboman/mason-lspconfig.nvim' },                       -- simple to use language server installer
--     { 'glepnir/lspsaga.nvim',                   branch = 'main' }, -- LSP UI
--     { 'jose-elias-alvarez/null-ls.nvim' },                         -- for formatters and linters
--     { 'onsails/lspkind.nvim' },                                    -- LSP icons
--     { 'VonHeikemen/lsp-zero.nvim' },
--
--     -- Cmp
--     { 'hrsh7th/nvim-cmp' },         -- completion plugin
--     { 'hrsh7th/cmp-nvim-lsp' },     -- LSP source for nvim-cmp
--     { 'hrsh7th/cmp-cmdline' },
--     { 'saadparwaiz1/cmp_luasnip' }, -- Snippets source for nvim-cmp
--     { 'L3MON4D3/LuaSnip' },         -- Snippets plugin
--     { 'nvim-lua/plenary.nvim' },
--     {
--       'Exafunction/codeium.nvim',
--       config = function()
--         require('codeium').setup({})
--       end
--     },
--
--     -- Autopairs
--     { 'windwp/nvim-autopairs' }, -- Autopairs, integrates with both cmp and treesitter
--
--     -- Comments
--     { 'terrortylor/nvim-comment' }, -- comments in lua
--
--     -- Git
--     { 'lewis6991/gitsigns.nvim' }, -- show git diff in gutter signs and stages hunks with <leader>hs and <leader>hu
--
--     -- Keymaps
--     { 'folke/which-key.nvim' }, -- keymaps helper for nvim config files
--
--     -- Autosave
--     { 'Pocco81/auto-save.nvim' }, -- autosave on focus lost and on buffer write
--
--     -- Python
--     { 'Vimjas/vim-python-pep8-indent' }, -- indent for python files
--
--     -- Rust
--     { 'rust-lang/rust.vim' },
--
--     -- HTML
--     { 'mattn/emmet-vim' }, -- emmet for vim
--
--     -- Tmux
--     { 'christoomey/vim-tmux-navigator' }, -- tmux integration
--
--     -- Codesnapshot
--     {
--       'mistricky/codesnap.nvim',
--       as = 'codesnap',
--       build = 'make build_generator',
--     },
--
--     -- Indent guides
--     { 'lukas-reineke/indent-blankline.nvim', main = 'ibl' },
--
--     -- Highlights colors
--     { 'brenoprata10/nvim-highlight-colors' },
--
--     -- Autotag
--     { 'windwp/nvim-ts-autotag' },
--
--     -- Bufferline
--     {
--       'akinsho/bufferline.nvim',
--       as = 'bufferline',
--       dependencies = { 'nvim-tree/nvim-web-devicons' },
--     },
--
--     -- Live Server
--     {
--       'barrett-ruth/live-server.nvim',
--       build = 'pnpm add -g live-server',
--       cmd = { 'LiveServerStart', 'LiveServerStop' },
--       config = true
--     },
--
--     -- Cursor
--     { 'JuanS3/specs.nvim' },
--
--     -- lazy.nvim
--     {
--       'folke/noice.nvim',
--       event = 'VeryLazy',
--       opts = {
--         -- add any options here
--       },
--       dependencies = {
--         -- if you lazy-load any plugin below, make sure to add proper `module='...'` entries
--         'MunifTanjim/nui.nvim',
--         -- OPTIONAL:
--         --   `nvim-notify` is only needed, if you want to use the notification view.
--         --   If not available, we use `mini` as the fallback
--         'rcarriga/nvim-notify',
--       }
--     },
--
--     -- DEBUG!
--     {
--       'rcarriga/nvim-dap-ui',
--       dependencies = {
--         'mfussenegger/nvim-dap',
--         'nvim-neotest/nvim-nio'
--       }
--     },
--
--     -- Neodev
--     { 'folke/neodev.nvim', opts = {} },
--
--     -- Notes
--     {
--       'gsuuon/note.nvim',
--       opts = {
--         spaces = {
--           '~/Notes/',
--         }
--       },
--       cmd = 'Note',
--       ft = 'note',
--     },
--
--     -- Flash: Search and jump
--     {
--       "folke/flash.nvim",
--       event = "VeryLazy",
--       opts = {},
--       -- stylua: ignore
--       keys = {
--         { "s",     mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash" },
--         { "S",     mode = { "n", "x", "o" }, function() require("flash").treesitter() end,        desc = "Flash Treesitter" },
--         { "r",     mode = "o",               function() require("flash").remote() end,            desc = "Remote Flash" },
--         { "R",     mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
--         { "<c-s>", mode = { "c" },           function() require("flash").toggle() end,            desc = "Toggle Flash Search" },
--       },
--     },
--
--     -- Bullets
--     {
--       'bullets-vim/bullets.vim',
--       ft = 'markdown'
--     },
--   }
-- )




-- Install lazy.nvim if it's not already present
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
    -- General Neovim Configuration
    { 'folke/neodev.nvim', opts = {} }, -- Essential for Neovim development, providing LSP for Lua config

    -- --- UI & Aesthetics ---
    -- Theme
    { 'folke/tokyonight.nvim' },
    { 'nvim-tree/nvim-web-devicons' }, -- Required for most icon plugins (NvimTree, Bufferline, Lualine, LSPKind)

    -- Statusline
    { 'nvim-lualine/lualine.nvim' },

    -- Bufferline
    {
      'akinsho/bufferline.nvim',
      as = 'bufferline',
      -- nvim-web-devicons is already a top-level dependency, no need to repeat
      -- dependencies = { 'nvim-tree/nvim-web-devicons' },
    },

    -- Indent Guides
    { 'lukas-reineke/indent-blankline.nvim', main = 'ibl' }, -- 'main = 'ibl' is good for easy requiring

    -- Highlights colors
    { 'brenoprata10/nvim-highlight-colors' }, -- Highlights hex codes, RGB, HSL colors

    -- Notifications and UI
    {
      'folke/noice.nvim',
      event = 'VeryLazy', -- Load very late to ensure all other plugins are set up
      opts = {},          -- Your noice.lua handles the specific setup
      dependencies = {
        'MunifTanjim/nui.nvim',
        'rcarriga/nvim-notify', -- OPTIONAL: for better notifications
      }
    },

    -- Cursor (assuming 'JuanS3/specs.nvim' is a cursor/visual indicator plugin)
    { 'JuanS3/specs.nvim' },

    -- --- Core Editing Features ---
    -- Tree-sitter for Syntax Highlighting & Text Objects
    {
      'nvim-treesitter/nvim-treesitter',
      build = ':TSUpdate', -- Command to run after installation to get parsers
      event = { 'BufReadPost', 'BufNewFile' }, -- Load on file open for better performance
      dependencies = {
        'nvim-treesitter/playground',            -- Optional: for debugging treesitter queries
        'nvim-treesitter/nvim-treesitter-textobjects', -- Essential for your text objects
        'nvim-treesitter/nvim-treesitter-refactor',    -- Optional: for refactoring with treesitter
        'JoosepAlviste/nvim-ts-context-commentstring', -- Improves commenting for different languages
        -- 'p00f/nvim-ts-rainbow', -- nvim-treesitter now includes rainbow parens, consider removing this if using built-in
      },
      -- Config `ensure_installed` etc. will be in your treesitter.lua
    },
    { 'nvim-treesitter/nvim-treesitter-context' }, -- Show current scope context

    -- Autotag
    { 'windwp/nvim-ts-autotag' }, -- Auto close/rename HTML/XML tags (uses Tree-sitter)

    -- Autopairs
    { 'windwp/nvim-autopairs' }, -- Auto-closes parentheses, quotes, etc.

    -- Comments
    { 'terrortylor/nvim-comment' }, -- Toggling comments

    -- --- LSP (Language Server Protocol) ---
    { 'neovim/nvim-lspconfig' },                  -- Core Neovim LSP client
    { 'mason-org/mason.nvim' },                -- Universal package manager for LSP, DAP, Linters, Formatters
    { 'mason-org/mason-lspconfig.nvim' },      -- Bridges Mason and Nvim-LSPconfig
    { 'jose-elias-alvarez/null-ls.nvim' },        -- For formatters and linters not covered by LSP (e.g., Black, Prettier)
    { 'onsails/lspkind.nvim' },                   -- Icons for LSP autocompletion (requires nvim-cmp integration)
    { 'glepnir/lspsaga.nvim', branch = 'main' },   -- Enhanced LSP UI (diagnostics, code actions, etc.)
    -- { 'VonHeikemen/lsp-zero.nvim' }, -- lsp-zero is an *LSP starter kit*. If you're manually configuring
    --                                  -- mason, mason-lspconfig, null-ls, and nvim-cmp, lsp-zero might be redundant
    --                                  -- or cause conflicts if you don't use its full features.
    --                                  -- Consider removing if you are doing a manual setup.

    -- --- Autocompletion (nvim-cmp) & Snippets (LuaSnip) ---
    { 'hrsh7th/nvim-cmp' },                       -- Completion plugin
    { 'hrsh7th/cmp-nvim-lsp' },                   -- LSP source for nvim-cmp
    { 'hrsh7th/cmp-cmdline' },                    -- Command-line completion
    { 'saadparwaiz1/cmp_luasnip' },               -- LuaSnip source for nvim-cmp
    { 'L3MON4D3/LuaSnip' },                       -- Snippets engine
    { 'nvim-lua/plenary.nvim' },                  -- Plenary is a common dependency for many plugins (Telescope, Nvim-cmp, etc.)

    -- AI Code Completion
    {
      'Exafunction/codeium.nvim',
      -- Use `lazy = true` if you want it to load on demand, or an `event`.
      -- If `config = true` is used here, the setup() function will run immediately.
      -- If you have a separate `codeium.lua` for config, remove `config = function()...end` here.
      config = function()
        require('codeium').setup({})
      end
    },

    -- --- Fuzzy Finder ---
    {
      'nvim-telescope/telescope.nvim',
      branch = '0.1.x', -- Stick to stable 0.1.x branch
      dependencies = { 'nvim-lua/plenary.nvim' }
    },
    { 'nvim-telescope/telescope-symbols.nvim' }, -- For finding symbols (requires ctags or LSP)

    -- --- File Explorer ---
    { 'nvim-tree/nvim-tree.lua' },

    -- --- Git Integration ---
    { 'lewis6991/gitsigns.nvim' }, -- Git diffs in the gutter

    -- --- Utilities & Quality of Life ---
    -- Keymaps Helper
    { 'folke/which-key.nvim' },

    -- Autosave
    { 'Pocco81/auto-save.nvim' },

    -- Markdown Preview
    {
      'iamcco/markdown-preview.nvim',
      cmd = { 'MarkdownPreviewToggle' },
      ft = { 'markdown' },
      build = function() vim.fn['mkdp#util#install']() end,
    },

    -- Notes
    {
      'gsuuon/note.nvim',
      opts = {
        spaces = {
          '~/Notes/', -- Ensure this path exists and is correct for your system
        }
      },
      cmd = 'Note',
      ft = 'note', -- Automatically load if filetype is 'note'
    },

    -- Live Server (for web development)
    {
      'barrett-ruth/live-server.nvim',
      build = 'pnpm add -g live-server', -- Ensure you have pnpm installed globally
      cmd = { 'LiveServerStart', 'LiveServerStop', 'LiveServerToggle' }, -- Add LiveServerToggle to cmd
      config = true -- This means it will load and call `require('live-server').setup({})`
                   -- If you have a separate `liveserver.lua` for setup, set this to `false`
                   -- and ensure your `liveserver.lua` is required.
    },

    -- Code Snapshot
    {
      'mistricky/codesnap.nvim',
      as = 'codesnap',
      build = 'make build_generator',
    },

    -- Flash: Search and jump (highly efficient navigation)
    {
      "folke/flash.nvim",
      event = "VeryLazy", -- Load late to ensure everything else is ready
      opts = {},          -- Your flash.lua (or similar) will handle setup
      keys = {
        { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash Jump" },
        { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
        { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
        { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
        { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
      },
    },

    -- Bullet points for Markdown
    {
      'bullets-vim/bullets.vim',
      ft = 'markdown' -- Only load for markdown filetypes
    },

    -- --- Language Specific Plugins ---
    -- Python
    { 'Vimjas/vim-python-pep8-indent' }, -- Legacy Python indentation, may conflict with Tree-sitter indent
    -- Consider using: `nvim-treesitter-textobjects`'s python-specific queries for better indentation.

    -- Rust
    { 'rust-lang/rust.vim' },

    -- HTML/CSS/JS (Emmet)
    { 'mattn/emmet-vim' },

    -- --- Debugger ---
    {
      'mfussenegger/nvim-dap', -- Debug Adapter Protocol client
      dependencies = {
        'rcarriga/nvim-dap-ui', -- UI for DAP
        'nvim-neotest/nvim-nio', -- Dependency for nvim-dap-ui
      }
    },

    -- Tmux Integration
    { 'christoomey/vim-tmux-navigator' }, -- Seamless navigation between Neovim panes and Tmux windows
  },
  {
    -- Lazy.nvim global options (optional)
    install = { colorscheme = { "tokyonight", "catppuccin" } }, -- Install these colorschemes first
    -- chdir = false, -- If you want to prevent lazy from changing directory
    -- checker = { enabled = true }, -- Enable auto-checking for updates
    -- performance = {
    --   rtp = {
    --     disabled_plugins = {
    --       "netrw", "netrwPlugin", "harpoon", "matchit", "zipPlugin",
    --     },
    --   },
    -- },
  }
)
