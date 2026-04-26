require("illuminate").configure({
  -- Providers: 'lsp', 'treesitter', 'regex'
  providers = {
    "lsp",
    "treesitter",
    "regex",
  },
  -- Delay in milliseconds
  delay = 100,
  -- Filetypes to disable
  filetypes_denylist = {
    "NvimTree",
    "oil",
    "lazy",
    "mason",
    "TelescopePrompt",
    "noice",
    "alpha",
  },
  -- Filetypes to allow (empty = all)
  filetypes_allowlist = {},
  -- Modes to deny: 'i' = insert, 'n' = normal, 'v' = visual
  modes_denylist = {},
  modes_allowlist = {},
  -- Underline the word
  under_cursor = true,
  -- Large file cutoff
  large_file_cutoff = 10000,
  -- Large file overrides
  large_file_overrides = nil,
  -- Minimum number of matches to highlight
  min_count_to_highlight = 1,
  -- Should illuminate case sensitive
  case_insensitive_regex = false,
})

-- Keymaps for navigating references
local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<leader>ir", require("illuminate").goto_next_reference, opts)
vim.keymap.set("n", "<leader>iR", require("illuminate").goto_prev_reference, opts)
