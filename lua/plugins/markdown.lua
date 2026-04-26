require('render-markdown').setup({
  -- Enable rendering by default
  enabled = true,
  -- Maximum file size (in MB) to render
  max_file_size = 10.0,
  -- Anti-conceal cursor behavior: 'neutral' prevents hiding when cursor is on line
  anti_conceal = {
    enabled = true,
    -- Which elements to always show
    ignore = {
      code_background = true,
      sign = true,
    },
  },
  -- Heading configuration
  heading = {
    enabled = true,
    sign = true,
    -- Position of the icon: 'inline' or 'overlay'
    position = 'overlay',
    -- Icons for each heading level
    icons = { '󰲡 ', '󰲣 ', '󰲥 ', '󰲧 ', '󰲩 ', '󰲫 ' },
    -- Background highlights for headings
    backgrounds = {
      'RenderMarkdownH1Bg',
      'RenderMarkdownH2Bg',
      'RenderMarkdownH3Bg',
      'RenderMarkdownH4Bg',
      'RenderMarkdownH5Bg',
      'RenderMarkdownH6Bg',
    },
    -- Foreground highlights for headings
    foregrounds = {
      'RenderMarkdownH1',
      'RenderMarkdownH2',
      'RenderMarkdownH3',
      'RenderMarkdownH4',
      'RenderMarkdownH5',
      'RenderMarkdownH6',
    },
  },
  -- Code block configuration
  code = {
    enabled = true,
    sign = true,
    -- Position of the language icon
    style = 'full',
    -- Highlight for code blocks
    highlight = 'RenderMarkdownCode',
    -- Highlight for inline code
    highlight_inline = 'RenderMarkdownCodeInline',
  },
  -- Dash (horizontal rule) configuration
  dash = {
    enabled = true,
    -- Icon used for horizontal rules
    icon = '─',
    -- Width of the dash
    width = 'full',
    -- Highlight for dashes
    highlight = 'RenderMarkdownDash',
  },
  -- Bullet list configuration
  bullet = {
    enabled = true,
    -- Icons for each indentation level
    icons = { '●', '○', '◆', '◇' },
    -- Highlight for bullets
    highlight = 'RenderMarkdownBullet',
  },
  -- Checkbox / todo list configuration
  checkbox = {
    enabled = true,
    -- Position of the checkbox: 'inline' or 'overlay'
    position = 'inline',
    unchecked = {
      icon = '󰄱 ',
      highlight = 'RenderMarkdownUnchecked',
    },
    checked = {
      icon = '󰱒 ',
      highlight = 'RenderMarkdownChecked',
    },
    -- Custom checkbox states
    custom = {
      todo = { raw = '[~]', rendered = '󰥔 ', highlight = 'RenderMarkdownTodo' },
    },
  },
  -- Quote configuration
  quote = {
    enabled = true,
    icon = '▋',
    highlight = 'RenderMarkdownQuote',
  },
  -- Pipe table configuration
  pipe_table = {
    enabled = true,
    -- Pre-filled borders for alignment
    preset = 'heavy',
    -- Style of the table: 'full', 'normal', 'none'
    style = 'full',
    -- Alignment icons
    alignment = {
      default = 'left',
      left = '󰅁 ',
      right = '󰅂 ',
      center = '󰅀 ',
    },
    -- Highlights
    head = 'RenderMarkdownTableHead',
    row = 'RenderMarkdownTableRow',
    filler = 'RenderMarkdownTableFill',
  },
  -- Link configuration
  link = {
    enabled = true,
    -- Render links with only an icon
    image = '󰥶 ',
    hyperlink = '󰌹 ',
    highlight = 'RenderMarkdownLink',
  },
  -- Sign configuration
  sign = {
    enabled = true,
    highlight = 'RenderMarkdownSign',
  },
  -- Inline highlight configuration (for ==highlighted text==)
  inline_highlight = {
    enabled = true,
    highlight = 'RenderMarkdownInlineHighlight',
  },
  -- Indent configuration for bullet points and checkboxes
  indent = {
    enabled = false,
  },
})

-- Toggle render markdown with <leader>md
vim.keymap.set('n', '<leader>md', ':RenderMarkdown toggle<CR>', { noremap = true, silent = true })
