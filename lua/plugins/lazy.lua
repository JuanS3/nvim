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
    { 'folke/neodev.nvim',          opts = {} }, -- Essential for Neovim development, providing LSP for Lua config

    -- --- UI & Aesthetics ---
    -- Dashboard
    { import = 'plugins.dashboard' },

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
    {
      'brenoprata10/nvim-highlight-colors',
      event = { 'BufReadPost', 'BufNewFile' },
      opts = { render = 'virtual', enable_named_colors = true, enable_tailwind = true, enable_italics = true },
    }, -- Highlights hex codes, RGB, HSL colors

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
    {
      'JuanS3/specs.nvim',
      event = { 'BufReadPost', 'BufNewFile' },
      opts = {
        popup = { inc_ms = 10, width = 120, winhl = 'Search' },
      },
      keys = {
        { '<leader>v', function() require('specs').show_specs() end, mode = 'n', desc = 'Show specs' },
        -- FIX: specs.nvim sobreescribía 'n'/'N' perdiendo el centrado (nzzzv).
        -- Se preserva nzzzv / Nzzzv y luego se invoca specs.show_specs().
        { 'n', 'nzzzv<Cmd>lua require("specs").show_specs()<CR>', mode = 'n', noremap = true, silent = true },
        { 'N', 'Nzzzv<Cmd>lua require("specs").show_specs()<CR>', mode = 'n', noremap = true, silent = true },
      },
    },

    -- --- Core Editing Features ---
    -- Tree-sitter for Syntax Highlighting & Text Objects
    -- FIX: Pinchado a v0.10.0 porque versiones recientes (post c82bf96f) dropean soporte nvim 0.11.
    -- El usuario tiene NVIM v0.11.6; nvim-treesitter main ahora requiere 0.12+.
    {
      'nvim-treesitter/nvim-treesitter',
      version = 'v0.10.0',
      build = ':TSUpdate',
      event = { 'BufReadPost', 'BufNewFile' },
      dependencies = {
        -- FIX: Removidos playground y refactor (obsoletos en nvim-treesitter v1.0+/nvim 0.11+)
        'nvim-treesitter/nvim-treesitter-textobjects', -- Essential for your text objects
        'JoosepAlviste/nvim-ts-context-commentstring', -- Improves commenting for different languages
        -- 'p00f/nvim-ts-rainbow', -- nvim-treesitter now includes rainbow parens, consider removing this if using built-in
      },
      -- Config `ensure_installed` etc. will be in your treesitter.lua
    },
    { 'nvim-treesitter/nvim-treesitter-context', event = { 'BufReadPost', 'BufNewFile' } }, -- Show current scope context

    -- Autotag
    {
      'windwp/nvim-ts-autotag',
      event = { 'BufReadPost', 'BufNewFile' },
      opts = {
        opts = {
          enable_close = true,
          enable_rename = true,
          enable_close_on_slash = false,
        },
      },
    }, -- Auto close/rename HTML/XML tags (uses Tree-sitter)

    -- Autopairs
    { 'windwp/nvim-autopairs', event = 'InsertEnter' }, -- Auto-closes parentheses, quotes, etc.

    -- Comments
    { 'terrortylor/nvim-comment', keys = { { '<leader>/', mode = { 'n', 'v' } } }, opts = {} }, -- Toggling comments

    -- --- LSP (Language Server Protocol) ---
    { 'neovim/nvim-lspconfig' },                                   -- Core Neovim LSP client
    { 'mason-org/mason.nvim' },                                    -- Universal package manager for LSP, DAP, Linters, Formatters
    { 'mason-org/mason-lspconfig.nvim' },                          -- Bridges Mason and Nvim-LSPconfig
    -- FIX: null-ls.nvim está archivado y usa vim.tbl_add_reverse_lookup (deprecado en nvim 0.11+).
    -- Migrado a none-ls.nvim (fork community-maintained), drop-in replacement.
    { 'nvimtools/none-ls.nvim' },
    { 'jay-babu/mason-null-ls.nvim' },                             -- Bridges Mason y none-ls/null-ls
    { 'onsails/lspkind.nvim' },                                    -- Icons for LSP autocompletion (requires nvim-cmp integration)
    { 'glepnir/lspsaga.nvim', branch = 'main', event = 'LspAttach' }, -- Enhanced LSP UI (diagnostics, code actions, etc.)
    -- { 'VonHeikemen/lsp-zero.nvim' }, -- lsp-zero is an *LSP starter kit*. If you're manually configuring
    --                                  -- mason, mason-lspconfig, null-ls, and nvim-cmp, lsp-zero might be redundant
    --                                  -- or cause conflicts if you don't use its full features.
    --                                  -- Consider removing if you are doing a manual setup.

    -- --- Autocompletion (nvim-cmp) & Snippets (LuaSnip) ---
    { 'hrsh7th/nvim-cmp' },         -- Completion plugin
    { 'hrsh7th/cmp-nvim-lsp' },     -- LSP source for nvim-cmp
    { 'hrsh7th/cmp-cmdline' },      -- Command-line completion
    { 'saadparwaiz1/cmp_luasnip' }, -- LuaSnip source for nvim-cmp
    { 'L3MON4D3/LuaSnip' },         -- Snippets engine
    { 'nvim-lua/plenary.nvim' },    -- Plenary is a common dependency for many plugins (Telescope, Nvim-cmp, etc.)

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
      branch = '0.1.x',
      event = 'VeryLazy',
      keys = {
        { '<C-p>', mode = 'n' },
        { '<leader>fg', mode = 'n' },
        { '<leader>fb', mode = 'n' },
      },
      dependencies = { 'nvim-lua/plenary.nvim' }
    },
    { 'nvim-telescope/telescope-symbols.nvim', event = 'VeryLazy' },

    -- --- File Explorer ---
    { 'nvim-tree/nvim-tree.lua' },

    -- --- Git Integration ---
    { 'lewis6991/gitsigns.nvim' }, -- Git diffs in the gutter

    -- --- Utilities & Quality of Life ---
    -- Keymaps Helper
    {
      'folke/which-key.nvim',
      event = 'VeryLazy',
      config = function()
        local wk = require('which-key')
        wk.add({
          { '<leader>w',  ':w<cr>',                  desc = 'Save' },
          { '<leader>q',  ':q<cr>',                  desc = 'Quit' },
          { '<leader>Q',  ':q!<cr>',                 desc = 'Quit!' },
          { '<leader>W',  ':wq<cr>',                 desc = 'Save and Quit' },
          { '<leader>n',  ':nzzzv<cr>',              desc = 'Next search result' },
          { '<leader>N',  ':Nzzzv<cr>',              desc = 'Previous search result' },
          { '<leader>x',  ':bd<cr>',                 desc = 'Close buffer' },
          { '<leader>m',  ':b#<cr>',                 desc = 'Last buffer' },
          { '<leader><left>',  ':vertical resize -20<cr>', desc = 'Decrease window width' },
          { '<leader><right>', ':vertical resize +20<cr>', desc = 'Increase window width' },
          { '<leader><up>',    ':resize +10<cr>',          desc = 'Increase window height' },
          { '<leader><down>',  ':resize -10<cr>',          desc = 'Decrease window height' },
          { '<leader>p',  ':bp<cr>',                 desc = 'Previous buffer' },
        })
      end,
    },

    -- Autosave
    { 'Pocco81/auto-save.nvim', event = { 'BufReadPost', 'BufNewFile' }, opts = {} },

    -- Markdown Preview
    {
      'iamcco/markdown-preview.nvim',
      cmd = { 'MarkdownPreviewToggle' },
      ft = { 'markdown' },
      init = function()
        -- FIX: Neovim no carga el entorno de nvm. Detectamos Node.js manualmente
        -- antes de que el plugin se instale/compile para usar la versión correcta.
        local nvm_nodes = vim.fn.glob('~/.nvm/versions/node/*/bin/node', false, true)
        if #nvm_nodes > 0 then
          table.sort(nvm_nodes)
          vim.g.mkdp_node_path = nvm_nodes[#nvm_nodes]
        else
          local node_in_path = vim.fn.exepath('node')
          if node_in_path ~= '' then
            vim.g.mkdp_node_path = node_in_path
          end
        end
      end,
      build = function()
        -- FIX: El script mkdp#util#install() descarga un bundle pre-compilado que
        -- a veces falla o queda incompleto (falta tslib). Instalamos las deps
        -- directamente con npm del Node.js detectado en el directorio app/.
        local app_dir = vim.fn.stdpath('data') .. '/lazy/markdown-preview.nvim/app'
        local node = vim.g.mkdp_node_path or 'node'
        local npm = vim.fn.fnamemodify(node, ':h') .. '/npm'
        vim.fn.system({
          'sh', '-c',
          'cd ' .. vim.fn.shellescape(app_dir) .. ' && '
            .. vim.fn.shellescape(npm) .. ' install --production'
        })
      end,
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
    -- FIX: live-server.nvim deprecó require('live-server').setup() en favor de vim.g.live_server
    {
      'barrett-ruth/live-server.nvim',
      build = 'bun add -g live-server',
      cmd = { 'LiveServerStart', 'LiveServerStop', 'LiveServerToggle' },
      config = function()
        vim.g.live_server = {}
      end,
    },

    -- Code Snapshot
    {
      'mistricky/codesnap.nvim',
      as = 'codesnap',
      build = 'make build_generator',
      cmd = { 'CodeSnap', 'CodeSnapSave' },
      keys = { { '<leader>ca', mode = 'x' }, { '<leader>cs', mode = 'x' } },
      opts = {
        save_path = '~/Pictures',
        has_breadcrumb = false,
        bg_color = '#2e3440',
        watermark = 'Datolytix',
        has_line_number = true,
        title = 'Datolytix',
        mac_window_bar = true,
      },
    },

    -- Flash: Search and jump (highly efficient navigation)
    {
      "folke/flash.nvim",
      event = "VeryLazy", -- Load late to ensure everything else is ready
      opts = {},          -- Your flash.lua (or similar) will handle setup
      keys = {
        { "s",     mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash Jump" },
        { "S",     mode = { "n", "x", "o" }, function() require("flash").treesitter() end,        desc = "Flash Treesitter" },
        { "r",     mode = "o",               function() require("flash").remote() end,            desc = "Remote Flash" },
        { "R",     mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
        { "<c-s>", mode = { "c" },           function() require("flash").toggle() end,            desc = "Toggle Flash Search" },
      },
    },

    -- Bullet points for Markdown
    {
      'bullets-vim/bullets.vim',
      ft = 'markdown' -- Only load for markdown filetypes
    },

    -- --- Language Specific Plugins ---
    -- Python
    -- FIX: vim-python-pep8-indent removido (Vimscript legacy). Treesitter indent cubre Python.
    -- { 'Vimjas/vim-python-pep8-indent' },
    -- Consider using: `nvim-treesitter-textobjects`'s python-specific queries for better indentation.

    -- Rust
    { 'rust-lang/rust.vim', ft = 'rust' },

    -- HTML/CSS/JS (Emmet)
    { 'mattn/emmet-vim', ft = { 'html', 'css', 'javascript', 'typescript', 'javascriptreact', 'typescriptreact' } },

    -- --- Debugger ---
    {
      'mfussenegger/nvim-dap',
      event = 'VeryLazy',
      keys = {
        { '<F9>', function() require('dap').toggle_breakpoint() end, desc = 'DAP Toggle Breakpoint' },
        { '<F10>', function() require('dap').continue() end, desc = 'DAP Continue' },
      },
      dependencies = {
        'rcarriga/nvim-dap-ui',
        'nvim-neotest/nvim-nio',
      }
    },

    -- --- Recommended Plugins (Productivity) ---

    -- Modern formatting (replaces null-ls/none-ls for formatting)
    {
      'stevearc/conform.nvim',
      event = { 'BufReadPre', 'BufNewFile' },
      cmd = 'ConformInfo',
      config = function() require('plugins.conform') end,
    },

    -- Elegant diagnostics/quickfix list
    {
      'folke/trouble.nvim',
      cmd = 'Trouble',
      dependencies = { 'nvim-tree/nvim-web-devicons' },
      config = function() require('plugins.trouble') end,
    },

    -- Quick file bookmarks (harpoon2)
    {
      'ThePrimeagen/harpoon',
      branch = 'harpoon2',
      dependencies = { 'nvim-lua/plenary.nvim' },
      config = function() require('plugins.harpoon') end,
    },

    -- Highlight and search TODO/FIXME/HACK comments
    {
      'folke/todo-comments.nvim',
      dependencies = { 'nvim-lua/plenary.nvim' },
      event = { 'BufReadPost', 'BufNewFile' },
      config = function() require('plugins.todo-comments') end,
    },

    -- Edit filesystem like a buffer
    {
      'stevearc/oil.nvim',
      cmd = 'Oil',
      keys = { '<leader>e', '-' },
      config = function() require('plugins.oil') end,
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
