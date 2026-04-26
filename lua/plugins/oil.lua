local oil = require("oil")

oil.setup({
  -- Id de columna para iconos (requiere nvim-web-devicons)
  columns = {
    "icon",
    "size",
    "mtime",
  },
  -- Buffer options
  buf_options = {
    buflisted = false,
    bufhidden = "hide",
  },
  -- Window options
  win_options = {
    wrap = false,
    signcolumn = "no",
    cursorcolumn = false,
    foldcolumn = "0",
    spell = false,
    list = false,
    conceallevel = 3,
    concealcursor = "nvic",
  },
  -- Borrar al salir
  delete_to_trash = false,
  -- Skip la confirmación para operaciones simples
  skip_confirm_for_simple_edits = false,
  -- Mostrar archivos ocultos
  view_options = {
    show_hidden = true,
    is_hidden_file = function(name, bufnr)
      return vim.startswith(name, ".")
    end,
    is_always_hidden = function(name, bufnr)
      return false
    end,
  },
  -- Flotante
  float = {
    padding = 2,
    max_width = 0,
    max_height = 0,
    border = "rounded",
    win_options = {
      winblend = 0,
    },
    override = function(conf)
      return conf
    end,
  },
  -- Preview
  preview = {
    max_width = 0.9,
    min_width = { 40, 0.4 },
    width = nil,
    max_height = 0.9,
    min_height = { 5, 0.1 },
    height = nil,
    border = "rounded",
    win_options = {
      winblend = 0,
    },
  },
})

local opts = { noremap = true, silent = true }

-- Abrir oil en el directorio actual
vim.keymap.set("n", "<leader>e", "<cmd>Oil<cr>", opts)

-- Abrir oil en el directorio padre (sobre el buffer actual)
vim.keymap.set("n", "-", "<cmd>Oil<cr>", opts)
