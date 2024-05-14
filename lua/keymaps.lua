-- <space> bar leader key
vim.g.mapleader = " "

-- save, quit
vim.keymap.set("n", "<leader>w", ":w<cr>")
vim.keymap.set("n", "<leader>q", ":q<cr>")
vim.keymap.set("n", "<leader>qn", ":q!<cr>")
vim.keymap.set("n", "<leader>wq", ":wq<cr>")

-- ignore capitalization mistakes
vim.cmd("ca W w")
vim.cmd("ca Q q")
vim.cmd("ca WQ wq")
vim.cmd("ca Wq wq")

-- Center the screen on the next/prev search result with n/N
vim.keymap.set("n", "n", "nzzzv") -- next search result
vim.keymap.set("n", "N", "Nzzzv") -- previous search result

-- windows
vim.keymap.set("n", "<leader><left>", ":vertical resize +20<cr>")
vim.keymap.set("n", "<leader><right>", ":vertical resize -20<cr>")
vim.keymap.set("n", "<leader><up>", ":resize +10<cr>")
vim.keymap.set("n", "<leader><down>", ":resize -10<cr>")

-- buffers
vim.keymap.set("n", "<leader>n", ":bn<cr>") -- next buffer
vim.keymap.set("n", "<leader>p", ":bp<cr>") -- previous buffer
vim.keymap.set("n", "<leader>x", ":bd<cr>") -- close buffer
vim.keymap.set("n", "<leader>m", ":b#<cr>") -- switch to last buffer

-- unhilight
-- vim.keymap.set("n", "<leader>h", ":noh<cr>") -- unhilight on search results and cursor position highlight

-- move to beginning/end of line
vim.keymap.set({"n", "v"}, "H", "^")
vim.keymap.set({"n", "v"}, "L", "$")

-- move a blocks of text up/down with K/J in visual mode
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { silent = true })
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { silent = true })

-- Center the screen after scrolling up/down with Ctrl-u/d
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-d>", "<C-d>zz")

-- move to underscores with - and l (repeatable with ";")
vim.keymap.set({ "n", "v" }, "<leader>-", "f_", { silent = true })
vim.keymap.set({ "n", "v" }, "<leader>l", "F_", { silent = true })

-- Go to next/previous erro_nd ENTER
vim.keymap.set("n", "<leader>ne", vim.diagnostic.goto_next)
vim.keymap.set("n", "<leader>pe", vim.diagnostic.goto_prev)

-- Run python file
vim.keymap.set("n", "<F5>", function()
  -- Get the current buffer's filetype
  local filetype = vim.api.nvim_buf_get_option(0, "filetype")

  -- Determine the appropriate command based on filetype
  local command = ""
  if filetype == "python" then
    command = "python3 main.py"
  elseif filetype == "go" then
    command = "go run main.go"  -- Replace with your actual Go command
  elseif filetype == "rust" then
    command = "cargo run"  -- Replace with your actual Rust command
  end

  -- Check if a valid command was determined
  if command ~= "" then
    -- Open a new tmux pane and send the appropriate command
    vim.api.nvim_command(":silent !tmux split-window -h")
    vim.api.nvim_command(":!tmux send-keys 'cls && sca' ENTER")  -- Assuming this is still needed
    vim.api.nvim_command(":!tmux send-keys '" .. command .. "' ENTER")
  else
    -- Handle the case where the buffer type is not recognized
    vim.api.nvim_command(":echo 'Buffer type not supported: " .. filetype .. "'")
  end
end)

vim.keymap.set("n", "<F6>", function()
  vim.api.nvim_command(":silent !tmux split-window -h")
  vim.api.nvim_command(":!tmux send-keys 'cls && sca' ENTER")
  vim.api.nvim_command(":!tmux send-keys 'python3 -m unittest' ENTER")  -- (if needed)
end)



