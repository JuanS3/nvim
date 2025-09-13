return {
  'goolord/alpha-nvim',
  event = 'VimEnter',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    local alpha = require('alpha')
    local dashboard = require('alpha.themes.dashboard')

    dashboard.section.header.val = {
      '██████╗  █████╗ ████████╗ ██████╗ ██╗  ██╗   ██╗████████╗██╗██╗  ██╗',
      '██╔══██╗██╔══██╗╚══██╔══╝██╔═══██╗██║  ██║   ██║╚══██╔══╝██║╚██╗██╔╝',
      '██║  ██║███████║   ██║   ██║   ██║██║  ╚██████╔╝   ██║   ██║ ╚███╔╝',
      '██║  ██║██╔══██║   ██║   ██║   ██║██║   ╚═██╔═╝    ██║   ██║ ██╔██╗',
      '██████╔╝██║  ██║   ██║   ╚██████╔╝███████╗██║      ██║   ██║██╔╝ ██╗',
      '╚═════╝ ╚═╝  ╚═╝   ╚═╝    ╚═════╝ ╚══════╝╚═╝      ╚═╝   ╚═╝╚═╝  ╚═╝',
    }

    dashboard.section.buttons.val = {
      dashboard.button('e', '  New file', ':ene <CR>'),
      dashboard.button('f', '  Find file', ':Telescope find_files <CR>'),
      dashboard.button('g', '  Find text', ':Telescope live_grep <CR>'),
      dashboard.button('r', '  Recent files', ':Telescope oldfiles <CR>'),
      dashboard.button('c', '  Config', ':e ~/.config/nvim/init.lua <CR>'),
      dashboard.button('l', '  Lazy', ':Lazy <CR>'),
      dashboard.button('m', '  Mason', ':Mason <CR>'),
      dashboard.button('q', '  Quit', ':qa <CR>'),
    }

    local function footer()
      local quotes = {
        "Talk is cheap. Show me the code.",                                                                                -- Linus Torvalds
        "Any fool can write code that a computer can understand. Good programmers write code that humans can understand.", -- Martin Fowler
        "First, solve the problem. Then, write the code.",                                                                 -- John Johnson
        "The best way to predict the future is to invent it.",                                                             -- Alan Kay
      }
      math.randomseed(os.time())
      return quotes[math.random(#quotes)]
    end

    dashboard.section.footer.val = footer()

    dashboard.config.opts.noautocmd = true
    alpha.setup(dashboard.config)
  end,
}
