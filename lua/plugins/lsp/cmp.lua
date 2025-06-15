local cmp = require('cmp')
local lspkind = require('lspkind')
local luasnip = require('luasnip') -- Ensure LuaSnip is explicitly required here for use

cmp.setup({
  -- Key mappings for completion menu
  mapping = cmp.mapping.preset.insert({
    ['<C-Space>'] = cmp.mapping.complete(),            -- Manually trigger completion
    ['<C-e>'] = cmp.mapping.abort(),                   -- Abort completion and restore original text
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Confirm selection and insert (selects first item by default)
    -- Add navigation keys for better UX
    -- ['<C-n>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }), -- Select next item
    -- ['<C-p>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }), -- Select previous item
    -- Optional: If you use the completion window (Pmenu) frequently, consider these
    ['<Down>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
    ['<Up>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
  }),

  -- Snippet engine integration
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body) -- Use LuaSnip to expand snippets
    end,
  },

  -- Order of completion sources
  sources = cmp.config.sources({
    { name = 'luasnip' },  -- LuaSnip snippets
    { name = 'codeium' },  -- Codeium AI completion
    { name = 'nvim_lsp' }, -- LSP suggestions (from language servers)
    -- Consider adding:
    { name = 'path' },     -- File paths
    { name = 'buffer' },   -- Words from open buffers
  }),

  -- Appearance of the completion window (Pmenu)
  window = {
    completion = {
      -- Apply custom highlight groups to the completion window elements
      winhighlight = 'Normal:Pmenu,FloatBorder:Pmenu,Search:None',
      -- Adjust position relative to the completion source
      column_offset = -3,
      side_padding = 0,
    },
    -- Optional: Configure documentation window (for LSP hover docs)
    documentation = {
      border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" }, -- Rounded border
      winhighlight = 'Normal:CmpPmenu,FloatBorder:CmpPmenuBorder',
      max_height = 10,
      max_width = 80,
    },
  },

  -- Formatting of completion items in the menu
  formatting = {
    expandable_indicator = true,         -- Show indicator for expandable items (e.g., snippets)
    fields = { 'kind', 'abbr', 'menu' }, -- Order of fields
    format = function(entry, vim_item)
      -- Use lspkind to format the 'kind' field with icons
      local kind = lspkind.cmp_format({
        mode = 'symbol_text', -- Display both symbol and text (e.g., ' Function')
        maxwidth = 50         -- Max width for the kind text
      })(entry, vim_item)

      -- Split the kind string (e.g., " Function" -> "", "Function")
      local strings = vim.split(kind.kind, '%s', { trimempty = true })
      local sk = strings[1] -- Symbol (e.g., '')
      local sm = strings[2] -- Text (e.g., 'Function')

      -- Custom icon and menu for Codeium source
      if sk == 'Codeium' then
        sk = '󱐋' -- Custom Codeium icon
        sm = 'Smart?' -- Custom menu text
      end

      -- Reconstruct the 'kind' and 'menu' fields
      kind.kind = ' ' .. (sk or '') .. ' '      -- Add spaces around the icon
      kind.menu = '   ( ' .. (sm or '') .. ' )' -- Custom menu formatting

      return kind
    end,
  },
})

-- --- Command-line completion (for '/' and '?') ---
cmp.setup.cmdline({ '/', '?' }, {
  mapping = cmp.mapping.preset.cmdline(), -- Standard cmdline mappings
  sources = {
    { name = 'buffer' },                  -- Complete from current buffer contents
  },
})

-- --- Command-line completion (for ':') ---
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(), -- Standard cmdline mappings
  sources = cmp.config.sources({
    { name = 'path' },                    -- Complete file paths
  }, {
    { name = 'cmdline' },                 -- Complete Vim commands
  }),
})

-- --- Custom Highlight Groups for Completion UI ---
-- These define the colors and styles for various parts of the completion menu.
-- Ensure these colors align with your 'tokyonight' theme.

local hl = vim.api.nvim_set_hl

-- Main Pmenu (popup menu) background and foreground
hl(0, 'PmenuSel', { bg = '#282C34', fg = 'NONE' }) -- Selected item background
hl(0, 'Pmenu', { fg = '#C5CDD9', bg = '#22252A' }) -- General Pmenu background/foreground

-- Styling for abbreviation text
hl(0, 'CmpItemAbbrDeprecated', { fg = '#7E8294', bg = 'NONE', strikethrough = true }) -- Deprecated items
hl(0, 'CmpItemAbbrMatch', { fg = '#82AAFF', bg = 'NONE', bold = true })               -- Matched characters (exact)
hl(0, 'CmpItemAbbrMatchFuzzy', { fg = '#82AAFF', bg = 'NONE', bold = true })          -- Matched characters (fuzzy)
hl(0, 'CmpItemMenu', { fg = '#C792EA', bg = 'NONE', italic = true, bold = true })     -- Menu text (e.g., 'Smart?')

-- Specific highlight groups for different LSP 'kind' types.
-- These apply distinct background colors based on the type of completion item (Function, Variable, etc.)
-- This is a very detailed and aesthetic choice!

hl(0, 'CmpItemKindField', { fg = '#EED8DA', bg = '#B5585F' })
hl(0, 'CmpItemKindProperty', { fg = '#EED8DA', bg = '#B5585F' })
hl(0, 'CmpItemKindEvent', { fg = '#EED8DA', bg = '#B5585F' })

hl(0, 'CmpItemKindText', { fg = '#C3E88D', bg = '#9FBD73' })
hl(0, 'CmpItemKindEnum', { fg = '#C3E88D', bg = '#9FBD73' })
hl(0, 'CmpItemKindKeyword', { fg = '#C3E88D', bg = '#9FBD73' })

hl(0, 'CmpItemKindConstant', { fg = '#FFE082', bg = '#D4BB6C' })
hl(0, 'CmpItemKindConstructor', { fg = '#FFE082', bg = '#D4BB6C' })
hl(0, 'CmpItemKindReference', { fg = '#FFE082', bg = '#D4BB6C' })

hl(0, 'CmpItemKindFunction', { fg = '#EADFF0', bg = '#A377BF' })
hl(0, 'CmpItemKindStruct', { fg = '#EADFF0', bg = '#A377BF' })
hl(0, 'CmpItemKindClass', { fg = '#EADFF0', bg = '#A377BF' })
hl(0, 'CmpItemKindModule', { fg = '#EADFF0', bg = '#A377BF' })
hl(0, 'CmpItemKindOperator', { fg = '#EADFF0', bg = '#A377BF' })

hl(0, 'CmpItemKindVariable', { fg = '#C5CDD9', bg = '#7E8294' })
hl(0, 'CmpItemKindFile', { fg = '#C5CDD9', bg = '#7E8294' })

hl(0, 'CmpItemKindUnit', { fg = '#F5EBD9', bg = '#D4A959' })
hl(0, 'CmpItemKindSnippet', { fg = '#F5EBD9', bg = '#D4A959' })
hl(0, 'CmpItemKindFolder', { fg = '#F5EBD9', bg = '#D4A959' })

hl(0, 'CmpItemKindMethod', { fg = '#DDE5F5', bg = '#6C8ED4' })
hl(0, 'CmpItemKindValue', { fg = '#DDE5F5', bg = '#6C8ED4' })
hl(0, 'CmpItemKindEnumMember', { fg = '#DDE5F5', bg = '#6C8ED4' })

hl(0, 'CmpItemKindInterface', { fg = '#D8EEEB', bg = '#58B5A8' })
hl(0, 'CmpItemKindColor', { fg = '#D8EEEB', bg = '#58B5A8' })
hl(0, 'CmpItemKindTypeParameter', { fg = '#D8EEEB', bg = '#58B5A8' })

hl(0, 'CmpItemKindCodeium', { fg = '#EADFF0', bg = '#58B5A8' })
