local neotest = require("neotest")

neotest.setup({
  adapters = {
    require("neotest-python")({
      -- Extra arguments for pytest
      args = { "-v" },
      -- Runner to use: pytest or unittest
      runner = "pytest",
      -- Python path to use (uses virtualenv if available)
      python = vim.fn.exepath("python3"),
    }),
    require("neotest-go")({
      -- Extra arguments for go test
      args = { "-v", "-race", "-count=1" },
    }),
  },
  -- UI configuration
  icons = {
    child_indent = "│",
    child_prefix = "├",
    collapsed = "─",
    expanded = "╮",
    failed = "",
    final_child_indent = " ",
    final_child_prefix = "╰",
    non_collapsible = "─",
    passed = "",
    running = "",
    running_animated = { "◜", "◠", "◝", "◞", "◡", "◟" },
    skipped = "",
    unknown = "",
  },
  -- Floating panel settings
  floating = {
    border = "rounded",
    max_height = 0.9,
    max_width = 0.9,
    options = {},
  },
  -- Output panel
  output = {
    enabled = true,
    open_on_run = false,
  },
  -- Summary panel
  summary = {
    enabled = true,
    expand_errors = true,
    follow = true,
    mappings = {
      attach = "a",
      clear_marked = "M",
      clear_target = "T",
      debug = "d",
      debug_marked = "D",
      expand = { "<CR>", "<2-LeftMouse>" },
      expand_all = "e",
      jumpto = "i",
      mark = "m",
      next_failed = "J",
      output = "o",
      prev_failed = "K",
      run = "r",
      run_marked = "R",
      short = "O",
      stop = "u",
      target = "t",
    },
  },
})

local opts = { noremap = true, silent = true }

-- Run nearest test
vim.keymap.set("n", "<leader>tn", function() neotest.run.run() end, opts)
-- Run current file
vim.keymap.set("n", "<leader>tf", function() neotest.run.run(vim.fn.expand("%")) end, opts)
-- Debug nearest test (requires nvim-dap configured)
vim.keymap.set("n", "<leader>td", function() neotest.run.run({ strategy = "dap" }) end, opts)
-- Toggle summary panel
vim.keymap.set("n", "<leader>ts", function() neotest.summary.toggle() end, opts)
-- Toggle output panel
vim.keymap.set("n", "<leader>to", function() neotest.output_panel.toggle() end, opts)
-- Show output for nearest test
vim.keymap.set("n", "<leader>tp", function() neotest.output.open({ enter = true }) end, opts)
-- Stop running tests
vim.keymap.set("n", "<leader>tS", function() neotest.run.stop() end, opts)
