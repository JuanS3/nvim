require('mason').setup {
  -- You can customize Mason's UI, install directory, etc. here.
  -- Example:
  ui = {
    border = "rounded",
    icons = {
      package_installed = "",
      package_pending = "",
      package_uninstalled = "",
    },
  },
  install_root_dir = vim.fn.stdpath("data") .. "/mason", -- Default, but good to know
}

local lsp_defaults = require('plugins.lsp.init') -- Path to this file

require('mason-lspconfig').setup {
  -- List of LSP servers that Mason should ensure are installed.
  ensure_installed = {
    "bashls",        -- Bash Language Server
    "clangd",        -- C/C++/Objective-C Language Server
    "cssls",         -- CSS Language Server
    "dockerls",      -- Dockerfile Language Server
    "html",          -- HTML Language Server
    "jsonls",        -- JSON Language Server
    "ltex",          -- LanguageTool Extension (grammar/spell checker)
    "lua_ls",        -- Lua Language Server (for Neovim config too!)
    "marksman",      -- Markdown Language Server
    "pyright",       -- Microsoft's Python Language Server
    "ruff",          -- Ruff (Python linter/formatter)
    "rust_analyzer", -- Rust Language Server
    "sqlls",         -- SQL Language Server
    "sqlfluff",      -- SQL Linter
    "ts_ls",         -- TypeScript Language Server
    "yamlls",        -- YAML Language Server
    "tailwindcss",   -- Tailwind CSS Language Server
    -- Consider adding:
    -- "gopls",         -- Go Language Server (if you do Go development)
    -- "denols",        -- Deno Language Server (if you use Deno)
    -- "svelteserver",  -- Svelte Language Server (if you do Svelte)
  },
  automatic_installation = true,

  setup_handlers = {
    function(server_name)
      local server_settings = {
        on_attach = lsp_defaults.on_attach,
        capabilities = lsp_defaults.capabilities,
      }

      -- Apply server-specific settings here
      if server_name == "pyright" then
        vim.tbl_deep_extend("force", server_settings, {
          settings = {
            python = {
              analysis = {
                -- This 'ignore' might be too broad; it ignores all files.
                -- Consider being more specific, or removing if not truly needed.
                -- E.g., `ignore = {'./.venv/**'}` for virtual environments
                ignore = { './.venv/**' },
                useLibraryCodeForTypes = true, -- Usually recommended
                autoSearchPaths = true,        -- Usually recommended
              },
            },
          },
        })
      elseif server_name == "lua_ls" then
         vim.tbl_deep_extend("force", server_settings, {
            settings = {
               Lua = {
                  runtime = {
                     version = "LuaJIT",
                  },
                  workspace = {
                     checkThirdParty = false,
                     library = vim.api.nvim_get_runtime_file("", true),
                  },
                  diagnostics = {
                     globals = { 'vim' },
                  },
                  completion = {
                     callSnippet = "Replace",
                  },
               },
            },
         })
      -- Add more `elseif server_name == "..." then` blocks for other servers if needed
      end

      require("lspconfig")[server_name].setup(server_settings)
    end,
  },
}

-- It's highly recommended to UNCOMMENT and use `automatic_setup = true`
-- or your `setup_handlers` block. Without it, Mason will install the LSPs,
-- but `lspconfig` won't know how to *attach* them to your buffers.
--
-- If you have a separate `lspconfig.lua` file where you explicitly
-- `require("lspconfig").<server_name>.setup({})` for each server,
-- then `automatic_setup` might cause conflicts or be redundant.
-- However, for a streamlined setup where Mason handles the installation
-- *and* the basic configuration for `lspconfig`, it's recommended.

local ok, mason_null_ls = pcall(require, "mason-null-ls")
if not ok then
  return -- Safely exit if mason-null-ls is not available
end

mason_null_ls.setup({
  -- List of Null-LS sources that Mason should ensure are installed.
  ensure_installed = {
    -- Formatters (e.g., for `vim.lsp.buf.format()`)
    "stylua",        -- Lua formatter
    "ruff",
    "black",         -- Python formatter
    "isort",         -- Python import sorter
    "prettier",      -- JS/TS/CSS/HTML formatter
    "rustfmt",       -- Rust formatter
    -- Linters (e.g., for `vim.diagnostic.show_line_diagnostics()`)
    "flake8",        -- Python linter
    "eslint_d",      -- JavaScript/TypeScript linter
    "shellcheck",    -- Shell script linter
    -- Consider adding more based on your needs:
    "gofumpt",       -- Go formatter
    -- "jq",            -- JSON formatter
    -- "pylint",        -- Another Python linter
  },
  -- Automatically sets up installed Null-LS sources with default configurations.
  automatic_setup = true,
  setup_handlers = {
    -- Similar to mason-lspconfig, you can define a handler for null-ls sources.
    function(source_name)
      require("null-ls.builtins")[source_name].setup({})
    end,
  },
})
