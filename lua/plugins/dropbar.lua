local dropbar_api = require('dropbar.api')

require('dropbar').setup({
  general = {
    enable = function(buf, win)
      return not vim.api.nvim_win_get_config(win).zindex
        and vim.bo[buf].buftype == ''
        and vim.api.nvim_buf_get_name(buf) ~= ''
        and not vim.wo[win].diff
    end,
    attach_events = {
      'OptionSet',
      'BufWinEnter',
      'BufWritePost',
    },
    update_interval = 0,
    update_events = {
      win = {
        'CursorMoved',
        'CursorMovedI',
        'WinEnter',
        'WinResized',
      },
      buf = {
        'BufModifiedSet',
        'FileChangedShellPost',
        'TextChanged',
        'TextChangedI',
      },
      global = {
        'DirChanged',
        'VimResized',
      },
    },
  },
  icons = {
    enable = true,
    kinds = {
      use_devicons = true,
      symbols = {
        Array = '󰅪 ',
        Boolean = ' ',
        BreakStatement = '󰙧 ',
        Call = '󰃷 ',
        CaseStatement = '󱃙 ',
        Class = '󰠱 ',
        Color = '󰏘 ',
        Constant = '󰏿 ',
        Constructor = ' ',
        ContinueStatement = '→ ',
        Copilot = ' ',
        Declaration = '󰙠 ',
        Delete = '󰩺 ',
        DoStatement = '󰑖 ',
        Enum = ' ',
        EnumMember = ' ',
        Event = ' ',
        Field = ' ',
        File = ' ',
        Folder = ' ',
        ForStatement = '󰑖 ',
        Function = '󰊕 ',
        H1Marker = '󰉫 ',
        H2Marker = '󰉬 ',
        H3Marker = '󰉭 ',
        H4Marker = '󰉮 ',
        H5Marker = '󰉯 ',
        H6Marker = '󰉰 ',
        Identifier = '󰀫 ',
        IfStatement = '󰇉 ',
        Interface = ' ',
        Keyword = '󰌋 ',
        List = '󰅪 ',
        Log = '󰦪 ',
        Lsp = ' ',
        Macro = '󰁌 ',
        MarkdownH1 = '󰉫 ',
        MarkdownH2 = '󰉬 ',
        MarkdownH3 = '󰉭 ',
        MarkdownH4 = '󰉮 ',
        MarkdownH5 = '󰉯 ',
        MarkdownH6 = '󰉰 ',
        Method = '󰆧 ',
        Module = '󰆧 ',
        Namespace = '󰅩 ',
        Null = '󰢤 ',
        Number = ' ',
        Object = '󰅩 ',
        Operator = '󰆕 ',
        Package = '󰏗 ',
        Pair = '󰅪 ',
        Property = ' ',
        Reference = '󰦾 ',
        Regex = ' ',
        Repeat = '󰑖 ',
        Scope = '󰅩 ',
        Specifier = '󰦪 ',
        Statement = '󰅩 ',
        String = '󰉾 ',
        Struct = '󰙅 ',
        SwitchStatement = '󰺟 ',
        Text = ' ',
        Type = ' ',
        TypeParameter = ' ',
        Unit = ' ',
        Value = '󰎠 ',
        Variable = '󰀫 ',
        WhileStatement = '󰑖 ',
      },
    },
  },
  symbol = {
    preview = {
      ---Reorient the preview window on previewing a new symbol
      ---@param _ integer source window id, ignored
      ---@param range {start: {line: integer}, end: {line: integer}} 0-indexed
      reorient = function(_, range)
        local invisible = range['end'].line - vim.fn.line('w$') + 1
        if invisible > 0 then
          local view = vim.fn.winsaveview()
          view.topline = view.topline + invisible + math.ceil(vim.fn.winheight(0) / 2)
          vim.fn.winrestview(view)
        end
      end,
    },
    jump = {
      reorient = function()
        local view = vim.fn.winsaveview()
        local win_height = vim.fn.winheight(0)
        local topline = view.topline
        local botline = view.topline + win_height
        if view.lnum - topline < 3 then
          view.topline = math.max(view.lnum - math.ceil(win_height / 2), 1)
        elseif botline - view.lnum < 3 then
          view.topline = math.max(view.lnum - math.ceil(win_height / 2), 1)
        end
        vim.fn.winrestview(view)
      end,
    },
  },
  bar = {
    hover = true,
    -- Truncate the dropbar menu if it exceeds the window width
    truncate = true,
    -- Bar padding
    padding = {
      left = 1,
      right = 1,
    },
    -- Pick mode
    pick = {
      pivots = 'abcdefghijklmnopqrstuvwxyz',
    },
    -- Enable click and hover support
    sources = nil,
  },
  menu = {
    -- Menu window options
    win_configs = {},
    -- Preview symbol under cursor on hover
    preview = true,
    -- Keymaps for the menu
    keymaps = {
      ['<LeftMouse>'] = function()
        local menu = require('dropbar.api').get_current_dropbar_menu()
        if not menu then
          return
        end
        local mouse = vim.fn.getmousepos()
        if mouse.winid ~= menu.win then
          local prev_menu = require('dropbar.api').get_dropbar_menu(mouse.winid)
          if prev_menu and prev_menu.sub_menu then
            prev_menu.sub_menu:close()
          end
          if vim.api.nvim_win_is_valid(mouse.winid) then
            vim.api.nvim_set_current_win(mouse.winid)
          end
          return
        end
        menu:click_at({ mouse.line, mouse.column }, nil, 1, 'l')
      end,
      ['<CR>'] = function()
        local menu = require('dropbar.api').get_current_dropbar_menu()
        if not menu then
          return
        end
        local cursor = vim.api.nvim_win_get_cursor(menu.win)
        local component = menu.entries[cursor[1]]:first_clickable(cursor[2])
        if component then
          menu:click_on(component, nil, 1, 'l')
        end
      end,
    },
  },
})

-- Keymaps
local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<leader>dp', dropbar_api.pick, opts)
-- Close dropbar menu if open (get_current_dropbar_menu returns nil if none)
vim.keymap.set('n', '<leader>dc', function()
  local menu = dropbar_api.get_current_dropbar_menu()
  if menu then
    menu:close()
  end
end, opts)
