local ibl = require("ibl")
local hooks = require("ibl.hooks")

-- Define your custom rainbow highlight groups.
-- These colors are designed to be visually distinct.
local highlight_groups = {
  "RainbowRed",
  "RainbowYellow",
  "RainbowBlue",
  "RainbowOrange",
  "RainbowGreen",
  "RainbowViolet",
  "RainbowCyan",
}

local hl = vim.api.nvim_set_hl

-- Register a hook to define the custom highlight groups whenever the colorscheme changes.
-- This ensures your indentation lines always have the correct colors.
hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
  hl(0, "RainbowRed", { fg = "#E06C75" })    -- Muted Red
  hl(0, "RainbowYellow", { fg = "#E5C07B" }) -- Muted Yellow
  hl(0, "RainbowBlue", { fg = "#61AFEF" })   -- Muted Blue
  hl(0, "RainbowOrange", { fg = "#D19A66" }) -- Muted Orange
  hl(0, "RainbowGreen", { fg = "#98C379" })  -- Muted Green
  hl(0, "RainbowViolet", { fg = "#C678DD" }) -- Muted Violet
  hl(0, "RainbowCyan", { fg = "#56B6C2" })   -- Muted Cyan
end)

-- If you are also using 'rainbow-delimiters.nvim', this line is correct for it.
-- Otherwise, you can remove it.
vim.g.rainbow_delimiters = { highlight = highlight_groups }

-- Setup indent-blankline.nvim with your custom highlight groups.
ibl.setup {
  indent = {
    highlight = highlight_groups, -- Use the defined rainbow colors for indentation lines
  },
}

-- Register the hook for scope highlighting from extmarks.
-- This enhances scope visualization (e.g., highlighting the current block).
hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
