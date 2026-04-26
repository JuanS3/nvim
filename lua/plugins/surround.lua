require("nvim-surround").setup({
  -- Surround keymaps
  -- ys{motion}{char}  - Add surround
  -- ds{char}          - Delete surround
  -- cs{target}{replacement} - Change surround
  -- yS{motion}{char}  - Add surround on new lines
  -- yss{char}         - Add surround to entire line
  -- ySS{char}         - Add surround to entire line on new lines
  keymaps = {
    insert = "<C-g>s",
    insert_line = "<C-g>S",
    normal = "ys",
    normal_cur = "yss",
    normal_line = "yS",
    normal_cur_line = "ySS",
    visual = "S",
    visual_line = "gS",
    delete = "ds",
    change = "cs",
    change_line = "cS",
  },
  -- Aliases for common surrounds
  aliases = {
    ["a"] = "<",
    ["b"] = ")",
    ["B"] = "}",
    ["r"] = "]",
    ["q"] = { '"', "'", "`" },
    ["s"] = { "{", "[", "(", "<", '"', "'", "`" },
  },
  -- Highlight surrounding when adding/changing
  highlight = {
    duration = 0,
  },
  -- Move cursor to the beginning/end of the surrounding
  move_cursor = "begin",
  -- Indent lines when surrounding with brackets
  indent_lines = function(start, stop)
    local indent = require("nvim-surround.config").get_indent
    indent(start, stop)
  end,
})
