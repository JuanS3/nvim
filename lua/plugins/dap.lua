local dap = require("dap")
local dapui = require("dapui")
local dap_python = require("dap-python")

-- ===================================================================
-- DAP-PYTHON SETUP
-- ===================================================================
-- Automatically detects debugpy in the active virtualenv or system Python
-- Uses `python3` by default (debugpy was installed globally via pip)
dap_python.setup("python3")

-- Enable test method/class debugging for Python
dap_python.test_runner = "pytest"

-- ===================================================================
-- DAP-UI SETUP
-- ===================================================================
dapui.setup({
  icons = {
    expanded = "▾",
    collapsed = "▸",
    current_frame = "▸",
  },
  mappings = {
    expand = { "<CR>", "<2-LeftMouse>" },
    open = "o",
    remove = "d",
    edit = "e",
    repl = "r",
    toggle = "t",
  },
  expand_lines = vim.fn.has("nvim-0.7") == 1,
  layouts = {
    {
      elements = {
        -- Left panel: scopes, breakpoints, stacks
        { id = "scopes", size = 0.25 },
        { id = "breakpoints", size = 0.25 },
        { id = "stacks", size = 0.25 },
        { id = "watches", size = 0.25 },
      },
      size = 40,
      position = "left",
    },
    {
      elements = {
        -- Bottom panel: REPL, console
        { id = "repl", size = 0.5 },
        { id = "console", size = 0.5 },
      },
      size = 0.25,
      position = "bottom",
    },
  },
  controls = {
    enabled = true,
    element = "repl",
    icons = {
      pause = "",
      play = "",
      step_into = "",
      step_over = "",
      step_out = "",
      step_back = "",
      run_last = "",
      terminate = "",
    },
  },
  floating = {
    max_height = nil,
    max_width = nil,
    border = "rounded",
    mappings = {
      close = { "q", "<Esc>" },
    },
  },
  windows = { indent = 1 },
  render = {
    max_type_length = nil,
    max_value_lines = 100,
  },
})

-- ===================================================================
-- DAP-VIRTUAL-TEXT SETUP
-- ===================================================================
require("nvim-dap-virtual-text").setup({
  enabled = true,
  enabled_commands = true,
  highlight_changed_variables = true,
  highlight_new_as_changed = false,
  show_stop_reason = true,
  commented = false,
  only_first_definition = true,
  all_references = false,
  clear_on_continue = false,
  display_callback = function(variable, buf, stackframe, node, options)
    if options.virt_text_pos == "inline" then
      return " = " .. variable.value
    else
      return variable.name .. " = " .. variable.value
    end
  end,
  virt_text_pos = vim.fn.has("nvim-0.10") == 1 and "inline" or "eol",
  all_frames = false,
  virt_lines = false,
  virt_text_win_col = nil,
})

-- ===================================================================
-- AUTO-OPEN/CLOSE DAP-UI
-- ===================================================================
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

-- ===================================================================
-- KEYMAPS
-- ===================================================================
local opts = { noremap = true, silent = true }

-- Core debugging (F-keys match VS Code convention)
vim.keymap.set("n", "<F5>", dap.continue, opts)
vim.keymap.set("n", "<F10>", dap.step_over, opts)
vim.keymap.set("n", "<F11>", dap.step_into, opts)
vim.keymap.set("n", "<F12>", dap.step_out, opts)
vim.keymap.set("n", "<F9>", dap.toggle_breakpoint, opts)

-- Conditional breakpoint
vim.keymap.set("n", "<leader>dB", function()
  dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
end, opts)

-- Logpoint
vim.keymap.set("n", "<leader>dl", function()
  dap.set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
end, opts)

-- DAP-UI toggles
vim.keymap.set("n", "<leader>du", dapui.toggle, opts)
vim.keymap.set("n", "<leader>de", dapui.eval, opts)
vim.keymap.set("v", "<leader>de", dapui.eval, opts)

-- Run last debug configuration
vim.keymap.set("n", "<leader>dr", dap.run_last, opts)

-- Python-specific: debug test method/class
vim.keymap.set("n", "<leader>dpm", dap_python.test_method, opts)
vim.keymap.set("n", "<leader>dpc", dap_python.test_class, opts)
