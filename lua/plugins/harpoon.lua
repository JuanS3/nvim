local harpoon = require("harpoon")

harpoon:setup()

local opts = { noremap = true, silent = true }

-- Añadir archivo actual a harpoon
vim.keymap.set("n", "<leader>ha", function()
  harpoon:list():append()
  vim.notify("Harpoon: file added", vim.log.levels.INFO)
end, opts)

-- Abrir menú de harpoon
vim.keymap.set("n", "<leader>hh", function()
  harpoon.ui:toggle_quick_menu(harpoon:list())
end, opts)

-- Saltar a archivos 1-5
for i = 1, 5 do
  vim.keymap.set("n", "<leader>h" .. i, function()
    harpoon:list():select(i)
  end, opts)
end
