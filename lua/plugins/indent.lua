-- local highlight = {
--     "RainbowRed",
--     "RainbowYellow",
--     "RainbowBlue",
--     "RainbowOrange",
--     "RainbowGreen",
--     "RainbowViolet",
--     "RainbowCyan",
-- }
--
-- local hooks = require "ibl.hooks"
-- -- create the highlight groups in the highlight setup hook, so they are reset
-- -- every time the colorscheme changes
-- hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
--     vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
--     vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
--     vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
--     vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
--     vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
--     vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
--     vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
-- end)
--
-- vim.g.rainbow_delimiters = { highlight = highlight }
-- require("ibl").setup { indent = { highlight = highlight } }
--
-- hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
--
--
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
  -- Additional common IBL options you might consider:
  -- scope = {
  --   enabled = true, -- Enable scope highlighting
  --   show_start = false, -- Don't show marker at the start of a scope
  --   show_end = false,   -- Don't show marker at the end of a scope
  -- },
  -- exclude = {
  --   filetypes = {
  --     "help",
  --     "terminal",
  --     "lazy",
  --     "mason",
  --     "NvimTree",
  --     "Trouble",
  --     "checkhealth",
  --     "man",
  --   },
  -- },
  -- char = "▏", -- The character used for indentation lines (defaults to '¦')
  -- show_first_indent_level = false, -- Don't show the first indent line
}

-- Register the hook for scope highlighting from extmarks.
-- This enhances scope visualization (e.g., highlighting the current block).
hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
