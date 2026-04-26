local diffview = require("diffview")

diffview.setup({
  diff_binaries = false,
  enhanced_diff_hl = false,
  git_cmd = { "git" },
  hg_cmd = { "hg" },
  use_icons = true,
  show_help_hints = true,
  watch_index = true,
  icons = {
    folder_closed = "",
    folder_open = "",
  },
  signs = {
    fold_closed = "",
    fold_open = "",
    done = "✓",
  },
  view = {
    default = {
      layout = "diff2_horizontal",
      winbar_info = false,
    },
    merge_tool = {
      layout = "diff3_horizontal",
      disable_diagnostics = true,
      winbar_info = true,
    },
    file_history = {
      layout = "diff2_horizontal",
      winbar_info = false,
    },
  },
  file_panel = {
    listing_style = "tree",
    tree_options = {
      flatten_dirs = true,
      folder_statuses = "only_folded",
    },
    win_config = {
      position = "left",
      width = 35,
      win_opts = {},
    },
  },
  file_history_panel = {
    log_options = {
      git = {
        single_file = {
          diff_merges = "combined",
        },
        multi_file = {
          diff_merges = "first-parent",
        },
      },
    },
    win_config = {
      position = "bottom",
      height = 16,
      win_opts = {},
    },
  },
  commit_log_panel = {
    win_config = {},
  },
  default_args = {
    DiffviewOpen = {},
    DiffviewFileHistory = {},
  },
  hooks = {},
  keymaps = {
    disable_defaults = false,
    view = {
      ["<tab>"] = function()
        diffview:toggle_files()
      end,
      ["q"] = function()
        diffview:close()
      end,
    },
    file_panel = {
      ["j"] = function()
        diffview:next_item()
      end,
      ["k"] = function()
        diffview:prev_item()
      end,
      ["o"] = function()
        diffview:toggle_fold()
      end,
      ["za"] = function()
        diffview:toggle_fold()
      end,
    },
    file_history_panel = {
      ["j"] = function()
        diffview:next_item()
      end,
      ["k"] = function()
        diffview:prev_item()
      end,
    },
  },
})

local opts = { noremap = true, silent = true }

-- Open diffview for the whole repo
vim.keymap.set("n", "<leader>dv", ":DiffviewOpen<CR>", opts)
-- Close diffview
vim.keymap.set("n", "<leader>dc", ":DiffviewClose<CR>", opts)
-- File history for current file
vim.keymap.set("n", "<leader>dh", ":DiffviewFileHistory %<CR>", opts)
-- File history for the whole repo
vim.keymap.set("n", "<leader>dH", ":DiffviewFileHistory<CR>", opts)
-- Toggle the file panel
vim.keymap.set("n", "<leader>dt", ":DiffviewToggleFiles<CR>", opts)
-- Refresh diffview
vim.keymap.set("n", "<leader>dr", ":DiffviewRefresh<CR>", opts)
