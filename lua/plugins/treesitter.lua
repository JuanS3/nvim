-- local ok, treesitter = pcall(require, 'nvim-treesitter.configs')
--
--
-- treesitter.setup({
--   ensure_installed = {
--     'bash',
--     'c',
--     'cpp',
--     'css',
--     'dockerfile',
--     'go',
--     'html',
--     'java',
--     'javascript',
--     'json',
--     'lua',
--     'make',
--     'python',
--     'rust',
--     'toml',
--     'typescript',
--     'yaml',
--   },
--
--   highlight = {
--     enable = true,
--   },
--
--   indent = {
--     enable = true,
--   },
--
--   incremental_selection = {
--     enable = true,
--     keymaps = {
--       init_selection = '<CR>',
--       node_incremental = '<CR>',
--       node_decremental = '<BS>',
--       scope_incremental = '<S-CR>',
--     },
--   },
--
--   textobjects = {
--     select = {
--       enable = true,
--       lookahead = true,
--       keymaps = {
--         ['af'] = '@function.outer',
--         ['if'] = '@function.inner',
--         ['ac'] = '@class.outer',
--         ['ic'] = '@class.inner',
--         ['al'] = '@loop.outer',
--         ['il'] = '@loop.inner',
--         ['ab'] = '@block.outer',
--         ['ib'] = '@block.inner',
--         ['a/'] = '@comment.outer',
--         ['i/'] = '@comment.inner',
--       },
--
--     },
--
--     move = {
--       enable = true,
--       set_jumps = true,
--       goto_next_start = {
--         [']m'] = '@function.outer',
--         [']]'] = '@class.outer',
--       },
--       goto_next_end = {
--         [']M'] = '@function.outer',
--         [']['] = '@class.outer',
--       },
--       goto_previous_start = {
--         ['[m'] = '@function.outer',
--         ['[['] = '@class.outer',
--       },
--       goto_previous_end = {
--         ['[M'] = '@function.outer',
--         ['[]'] = '@class.outer',
--       },
--     },
--   },
--
-- })


local ok, treesitter = pcall(require, 'nvim-treesitter.configs')
if not ok then
  return -- Safely exit if nvim-treesitter.configs is not available
end

treesitter.setup({
  -- Ensure that these parsers are installed.
  -- nvim-treesitter will automatically install them if they're missing.
  ensure_installed = {
    'bash', 'c', 'cpp', 'css', 'dockerfile', 'go', 'html', 'java', 'javascript',
    'json', 'lua', 'make', 'python', 'rust', 'toml', 'typescript', 'yaml',
    -- Consider adding:
    -- 'markdown',          -- For better Markdown highlighting
    -- 'markdown_inline',   -- For inline Markdown elements
    -- 'vimdoc',            -- For Neovim help files
    -- 'regex',             -- For regular expressions
    -- 'query',             -- For Treesitter queries themselves
    -- 'luap',              -- For Lua patterns (if you use them)
  },

  -- Enable Tree-sitter powered syntax highlighting.
  highlight = {
    enable = true,
    -- You can add specific filetypes to disable or enable certain features.
    -- For example:
    -- disable = { "c", "cpp" }, -- If you prefer legacy syntax highlighting for these
    -- additional_vim_regex_highlighting = false, -- Sometimes useful for complex regex
  },

  -- Enable Tree-sitter powered indentation.
  -- This usually provides more accurate indentation than Neovim's built-in system.
  indent = {
    enable = true,
    -- disable = { "python", "css" }, -- Example: if Tree-sitter indentation conflicts
  },

  -- Incremental selection allows you to grow/shrink selection based on Tree-sitter nodes.
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = '<CR>',    -- Start selection (Enter)
      node_incremental = '<CR>',  -- Expand to next node (Enter)
      node_decremental = '<BS>',  -- Shrink to previous node (Backspace)
      scope_incremental = '<S-CR>', -- Expand to larger scope (Shift+Enter)
    },
  },

  -- Tree-sitter text objects provide context-aware text selection and movement.
  textobjects = {
    select = {
      enable = true,
      lookahead = true, -- Extend selection to the next node if current is empty
      -- Your custom keymaps for selecting different code structures.
      -- These combine well with 'v' (visual) or 'a'/'i' (around/inside) operators.
      keymaps = {
        ['af'] = '@function.outer',   -- around function
        ['if'] = '@function.inner',   -- inside function
        ['ac'] = '@class.outer',      -- around class
        ['ic'] = '@class.inner',      -- inside class
        ['al'] = '@loop.outer',       -- around loop
        ['il'] = '@loop.inner',       -- inside loop
        ['ab'] = '@block.outer',      -- around block (e.g., if/else blocks, curly braces)
        ['ib'] = '@block.inner',      -- inside block
        ['a/'] = '@comment.outer',    -- around comment
        ['i/'] = '@comment.inner',    -- inside comment
        ['ap'] = '@parameter.outer', -- around parameters/arguments
        ['ip'] = '@parameter.inner', -- inside parameters/arguments
        ['aa'] = '@parameter.outer', -- alternative for around arguments
        ['ia'] = '@parameter.inner', -- alternative for inside arguments
        ['as'] = '@statement.outer', -- around statement
        ['is'] = '@statement.inner', -- inside statement
        ['aq'] = '@text.outer',      -- around quotes
        ['iq'] = '@text.inner',      -- inside quotes
        ['a='] = '@assignment.outer', -- around assignment
        ['i='] = '@assignment.inner', -- inside assignment
      },
    },

    move = {
      enable = true,
      set_jumps = true, -- Adds entries to the jumplist when moving with text objects.
      goto_next_start = {
        [']m'] = '@function.outer', -- Next function start
        [']]'] = '@class.outer',    -- Next class start
        -- Consider adding other next starts:
        [']s'] = '@statement.outer', -- Next statement start
        [']l'] = '@loop.outer',     -- Next loop start
      },
      goto_next_end = {
        [']M'] = '@function.outer', -- Next function end
        [']['] = '@class.outer',    -- Next class end
        -- Consider adding other next ends:
        [']S'] = '@statement.outer', -- Next statement end
        [']L'] = '@loop.outer',     -- Next loop end
      },
      goto_previous_start = {
        ['[m'] = '@function.outer', -- Previous function start
        ['[['] = '@class.outer',    -- Previous class start
        -- Consider adding other previous starts:
        ['[s'] = '@statement.outer', -- Previous statement start
        ['[l'] = '@loop.outer',     -- Previous loop start
      },
      goto_previous_end = {
        ['[M'] = '@function.outer', -- Previous function end
        ['[]'] = '@class.outer',    -- Previous class end
        -- Consider adding other previous ends:
        ['[S'] = '@statement.outer', -- Previous statement end
        ['[L'] = '@loop.outer',     -- Previous loop end
      },
    },
    -- Swap text objects (e.g., swap parameters in a function call)
    swap = {
      enable = true,
      swap_next = {
        ["<leader>a"] = "@parameter.inner",
      },
      swap_previous = {
        ["<leader>A"] = "@parameter.inner",
      },
    },
  },
  -- Playgrounds (optional, for debugging treesitter queries)
  -- playground = {
  --   enable = false,
  --   disable = {},
  --   updatetime = 25, -- Debounced time for highlighting nodes in the playground.
  --   persist_query = false, -- Whether the query persists across vim sessions
  --   keybindings = {
  --     toggle_query_editor = 'R',
  --     toggle_hl_groups = 'H',
  --     toggle_language = 'L',
  --     focus_language = 'F',
  --     go_to_node = '<cr>',
  --     show_help = '?',
  --   },
  -- },
})
