-- local npairs = require('nvim-autopairs')
-- local Rule = require('nvim-autopairs.rule')
-- local ts_conds = require('nvim-autopairs.ts-conds')
--
-- npairs.setup({
--   check_ts = true,
--   ts_config = {
--     lua = { 'string' }, -- it will not add a pair on that treesitter node
--     javascript = { 'template_string' },
--     java = false, -- don't check treesitter on java
--   },
--   disable_filetype = { 'TelescopePrompt', 'spectre_panel' },
--   disable_in_macro = false, -- disable when recording or executing a macro
--   disable_in_visualblock = false, -- disable when insert after visual block mode
--   ignored_next_char = [=[[%w%%%'%[%"%.]]=],
--   enable_moveright = true,
--   enable_afterquote = true, -- add bracket pairs after quote
--   enable_check_bracket_line = true, -- check bracket in same line
--   map_cr = true,
--   map_bs = true, -- map the <BS> key
--   map_c_h = false, -- map the <C-h> key to delete a pair
--   map_c_w = false, -- map <c-w> to delete a pair if possible
--   fast_wrap = {
--     map = '<M-e>',
--     chars = { '{', '[', '(', '"', "'" },
--     pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], '%s+', ''),
--     offset = 0, -- Offset from pattern match
--     end_key = '$',
--     keys = 'qwertyuiopzxcvbnmasdfghjkl',
--     check_comma = true,
--     highlight = 'Search',
--     highlight_grey = 'Comment',
--   },
-- })
--
--
-- -- press % => %% is only inside comment or string
-- npairs.add_rules({
--   Rule("%", "%", "lua"):with_pair(ts_conds.is_ts_node({ "string", "comment" })),
--   Rule("$", "$", "lua"):with_pair(ts_conds.is_not_ts_node({ "function", "method", "for" })),
-- })



local npairs = require('nvim-autopairs')
local Rule = require('nvim-autopairs.rule')
local ts_conds = require('nvim-autopairs.ts-conds')

npairs.setup({
  -- Enable Tree-sitter integration for better context-aware pairing.
  check_ts = true,
  ts_config = {
    -- 'string' node will not add a pair (e.g., typing '`' inside a string won't add another backtick).
    -- For Lua, 'comment' is also a good addition to prevent unwanted pairs in comments.
    lua = { 'string', 'comment' },
    -- 'template_string' prevents adding quotes/brackets inside JS template literals (` `).
    javascript = { 'template_string' },
    -- Completely disable Tree-sitter checks for Java files.
    java = false,
  },
  -- Disable autopairs in specific filetypes or buffers.
  disable_filetype = { 'TelescopePrompt', 'spectre_panel' },
  disable_in_macro = false,     -- Keep autopairs enabled when recording or executing a macro.
  disable_in_visualblock = false, -- Keep autopairs enabled when inserting after visual block mode.

  -- Characters that, if immediately following the cursor, will prevent autopairs from inserting a closing pair.
  -- This prevents `(` becoming `()` if you're typing `(call)` and `c` is the next char.
  -- `[%w%%%'%[%"%.]` means: word characters, %, ', [, ", .
  -- `string.gsub([[...]], '%s+', '')` effectively removes all whitespace from the string.
  ignored_next_char = [=[[%w%%%'%[%"%.]]=],

  enable_moveright = true,      -- Allows moving the closing pair to the right when typing an opening one.
  enable_afterquote = true,     -- Add bracket pairs after a quote (e.g., `'foo'(` -> `'foo'()`).
  enable_check_bracket_line = true, -- Check for existing brackets on the same line to avoid duplicates.

  map_cr = true,                -- Map <CR> (Enter) to balance/insert new line within a pair.
  map_bs = true,                -- Map <BS> (Backspace) to delete a pair.
  map_c_h = false,              -- Don't map <C-h> to delete a pair (often used for navigating).
  map_c_w = false,              -- Don't map <C-w> to delete a pair (often used for deleting words).

  -- Fast wrap settings for quickly wrapping text with pairs.
  fast_wrap = {
    map = '<M-e>',               -- Your mapping for initiating fast wrap (Alt+e).
    chars = { '{', '[', '(', '"', "'", '<' }, -- Characters that can be used for wrapping.
    -- Pattern to match the boundaries for wrapping.
    -- This regex looks for whitespace, quotes, parentheses, brackets, commas.
    pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], '%s+', ''),
    offset = 0,                  -- Offset from pattern match (usually 0).
    end_key = '$',               -- Key to press to jump to the end of the wrapped content.
    keys = 'qwertyuiopzxcvbnmasdfghjkl', -- Keys to use for "smart" wrapping (e.g., surrounding a word).
    check_comma = true,          -- Check for commas when wrapping, can adjust behavior.
    highlight = 'Search',        -- Highlight group for matched text during wrapping.
    highlight_grey = 'Comment',  -- Highlight group for less important visual cues.
  },
})

-- --- Custom Rules ---

-- Rule 1: '%` autopairing only inside comments or strings for Lua.
-- Example: typing '%' will only insert '%%' if the cursor is within a string or comment.
-- This prevents `%` from autopairing in code, which is usually not desired.
npairs.add_rules({
  Rule("%", "%", "lua"):with_pair(ts_conds.is_ts_node({ "string", "comment" })),
})

-- Rule 2: '$` autopairing in Lua, but NOT within function/method/for definitions.
-- This is useful for LaTeX/Markdown where '$' is used for math,
-- but avoids conflicts in Lua code where '$' might be part of variable names or similar.
npairs.add_rules({ -- Note: It's good practice to call add_rules separately for distinct rules, or combine into one table.
  Rule("$", "$", "lua"):with_pair(ts_conds.is_not_ts_node({ "function", "method", "for" })),
})

-- Consider a rule for single quotes, to avoid `'` creating `''` if you're typing contractions, e.g., "don't"
-- Rule("'", "'"):with_pair(ts_conds.is_ts_node({"string"})), -- This would ensure it only pairs in a string context
