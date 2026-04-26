# 📘 Neovim Configuration Manual

**A complete guide to using this optimized Neovim setup.**

---

## Table of Contents

1. [Overview](#overview)
2. [Prerequisites](#prerequisites)
3. [First Launch](#first-launch)
4. [Keybindings Reference](#keybindings-reference)
5. [Plugins Guide](#plugins-guide)
6. [LSP & Development](#lsp--development)
7. [Git Integration](#git-integration)
8. [File Explorer](#file-explorer)
9. [Fuzzy Finding](#fuzzy-finding)
10. [Debugging](#debugging)
11. [Custom Commands](#custom-commands)
12. [Troubleshooting](#troubleshooting)

---

## Overview

This is a **modern, performance-optimized Neovim configuration** built entirely in **Lua** and managed by [lazy.nvim](https://github.com/folke/lazy.nvim). It is designed for developers who want a fast, visually appealing, and feature-rich editing experience out of the box.

### What's Included

- 🎨 **Tokyo Night** theme with custom highlights
- 🚀 **Lazy-loaded plugins** for instant startup
- 🧠 **Full LSP stack** (Mason, LspConfig, nvim-cmp, lspsaga)
- 🔍 **Telescope** for fuzzy finding everything
- 🌳 **NvimTree** file explorer with Git integration
- 📊 **Bufferline** tabs and **Lualine** status bar
- 📝 **Treesitter** powered syntax highlighting & text objects
- 🤖 **Codeium** AI autocompletion
- 📸 **CodeSnap** for beautiful code screenshots
- 🔧 **Auto-formatting** on save via conform.nvim
- 🐛 **DAP** debugging support
- 🌐 **Live Server** for web development
- 📓 **Note-taking** system
- 📝 **render-markdown.nvim** — beautiful Markdown rendering inside Neovim
- 🧪 **neotest** — universal test runner (Python, Go, etc.)
- 💡 **vim-illuminate** — highlight all occurrences of word under cursor
- 🎯 **dropbar.nvim** — breadcrumbs in winbar
- 🔗 **nvim-surround** — manipulate surroundings (ys, ds, cs)
- 🔀 **diffview.nvim** — advanced Git diffs and merge conflicts
- 🤖 **avante.nvim** — AI assistant (Cursor-like experience)
- ⚡ **conform.nvim** — modern async formatting (black, prettier, stylua, rustfmt)
- 🔥 **trouble.nvim** — elegant diagnostics and quickfix list
- 🎯 **harpoon** — lightning-fast file bookmarks
- ✅ **todo-comments** — highlight and search TODO/FIXME/HACK
- 🗂️ **oil.nvim** — edit your filesystem like a buffer

---

## Prerequisites

Before using this configuration, ensure you have:

| Requirement                | Purpose                                                                    |
| -------------------------- | -------------------------------------------------------------------------- |
| **Neovim 0.11+**           | This config uses modern APIs (`vim.lsp.config`, `vim.lsp.enable`)          |
| **Git**                    | Cloning plugins and LSP servers                                            |
| **Nerd Font**              | Icons in file explorer, statusline, and UI (e.g., JetBrainsMono Nerd Font) |
| **Node.js & npm**          | Several LSP servers and tools depend on it                                 |
| **Bun**                    | Required by `live-server.nvim` build step                                  |
| **C Compiler** (gcc/clang) | For Treesitter parser compilation                                          |
| **Python 3 + uv**          | For running Python files and tools                                         |
| **Rust (cargo)**           | For `cargo run` support                                                    |

---

## First Launch

1. **Start Neovim:**

   ```bash
   nvim
   ```

2. **Lazy.nvim** will automatically clone itself and install all plugins on the first run.

3. **Install LSP Servers:**
   Once inside Neovim, run:

   ```vim
   :MasonInstallAll
   ```

   This queues installation for all configured language servers.

4. **Install Formatters/Linters:**

   ```vim
   :MasonInstallTools
   ```

   This installs formatters like `black`, `prettier`, `stylua`, `rustfmt`, etc.

5. **Install Treesitter Parsers:**
   Run:
   ```vim
   :TSUpdate
   ```
   To ensure all language parsers are installed.

---

## Keybindings Reference

> **Leader Key:** `<Space>`

### 🏠 Basics

| Key          | Mode | Action                |
| ------------ | ---- | --------------------- |
| `<leader>w`  | n    | Save file (`:w`)      |
| `<leader>q`  | n    | Quit (`:q`)           |
| `<leader>qn` | n    | Force quit (`:q!`)    |
| `<leader>wq` | n    | Save and quit (`:wq`) |
| `W`          | c    | Alias for `:write`    |
| `Q`          | c    | Alias for `:quit`     |
| `WQ` / `Wq`  | c    | Alias for `:wq`       |

### 🪟 Window Management

| Key               | Mode | Action                    |
| ----------------- | ---- | ------------------------- |
| `<leader>sh`      | n    | Split window horizontally |
| `<leader>sv`      | n    | Split window vertically   |
| `<leader><left>`  | n    | Decrease window width     |
| `<leader><right>` | n    | Increase window width     |
| `<leader><up>`    | n    | Increase window height    |
| `<leader><down>`  | n    | Decrease window height    |

### 🔍 Navigation & Search

| Key                           | Mode    | Action                                                   |
| ----------------------------- | ------- | -------------------------------------------------------- |
| `n` / `N`                     | n       | Next/previous search result (centered + specs animation) |
| `<leader>h`                   | n       | Clear search highlights (`:noh`)                         |
| `H` / `L`                     | n, v    | Jump to start/end of line (`^` / `$`)                    |
| `<C-u>` / `<C-d>`             | n       | Scroll up/down (centered)                                |
| `s`                           | n, x, o | **Flash Jump** — jump to any character                   |
| `S`                           | n, x, o | **Flash Treesitter** — select Treesitter nodes           |
| `<leader>f_`                  | n, v    | Jump to next underscore                                  |
| `<leader>F_`                  | n, v    | Jump to previous underscore                              |
| `<leader>f,`                  | n, v    | Jump to next comma                                       |
| `<leader>F,`                  | n, v    | Jump to previous comma                                   |
| `<leader>f(` ... `<leader>f}` | n, v    | Jump to next bracket/parenthesis                         |
| `<leader>F(` ... `<leader>F}` | n, v    | Jump to previous bracket/parenthesis                     |

### 📋 Buffer Management

| Key                         | Mode | Action                            |
| --------------------------- | ---- | --------------------------------- |
| `<left>` / `<right>`        | n    | Previous/next buffer (BufferLine) |
| `<leader>1` ... `<leader>9` | n    | Go to buffer 1-9                  |
| `<leader>0`                 | n    | Go to last buffer                 |
| `<leader>x`                 | n    | Close current buffer              |
| `<leader>m`                 | n    | Switch to last buffer (`:b#`)     |
| `<leader>bs`                | n    | Sort buffers by directory         |

### 📁 File Explorer (NvimTree)

| Key      | Mode | Action                               |
| -------- | ---- | ------------------------------------ |
| `<C-b>`  | n    | Toggle NvimTree                      |
| `<C-b>f` | n    | Find and reveal current file in tree |
| `<C-b>r` | n    | Refresh NvimTree                     |

### 🔭 Telescope (Fuzzy Finder)

| Key           | Mode | Action                           |
| ------------- | ---- | -------------------------------- |
| `<C-p>`       | n    | Find files                       |
| `<leader>fg`  | n    | Live grep (search text in files) |
| `<leader>fb`  | n    | List open buffers                |
| `<leader>fh`  | n    | Search help tags                 |
| `<leader>fk`  | n    | List all keymaps                 |
| `<leader>fd`  | n    | List LSP diagnostics             |
| `<leader>fc`  | n    | Search Vim commands              |
| `<leader>gs`  | n    | Git status                       |
| `<leader>gcm` | n    | Git commits (global)             |
| `<leader>gb`  | n    | Git branches                     |
| `<leader>gl`  | n    | Git commits for current buffer   |
| `<leader>gt`  | n    | Git stashes                      |
| `<leader>ld`  | n    | LSP definitions                  |
| `<leader>lr`  | n    | LSP references                   |
| `<leader>li`  | n    | LSP implementations              |
| `<leader>lh`  | n    | LSP type definitions             |
| `<leader>ls`  | n    | Document symbols                 |
| `<leader>lw`  | n    | Workspace symbols                |
| `<leader>ms`  | n    | Telescope symbols picker         |

### 🧠 LSP (Language Server Protocol)

| Key          | Mode | Action                            |
| ------------ | ---- | --------------------------------- |
| `gd`         | n    | Go to definition (Lspsaga)        |
| `gD`         | n    | Go to declaration                 |
| `K`          | n    | Hover documentation (Lspsaga)     |
| `gi`         | n    | Go to implementation              |
| `gr`         | n    | Show references (Lspsaga)         |
| `<leader>D`  | n    | Type definition                   |
| `<leader>rn` | n    | Rename symbol (Lspsaga)           |
| `<leader>ca` | n    | Code action (Lspsaga)             |
| `<leader>f`  | n    | Format buffer (async)             |
| `<leader>ne` | n    | Next diagnostic                   |
| `<leader>pe` | n    | Previous diagnostic               |
| `<leader>d`  | n    | Show line diagnostics (Lspsaga)   |
| `<leader>D`  | n    | Show buffer diagnostics (Lspsaga) |
| `<leader>o`  | n    | Toggle outline (symbols)          |
| `<leader>t`  | n    | Toggle Lspsaga terminal           |
| `<leader>wa` | n    | Add workspace folder              |
| `<leader>wr` | n    | Remove workspace folder           |
| `<leader>wl` | n    | List workspace folders            |
| `<leader>ws` | n    | Search workspace symbols          |

### 🔧 Code Editing

| Key         | Mode | Action                        |
| ----------- | ---- | ----------------------------- |
| `J` / `K`   | v    | Move selected lines down/up   |
| `<leader>/` | n, v | Toggle comment (nvim-comment) |
| `<M-e>`     | i    | Fast wrap with autopairs      |
| `<CR>`      | i    | Confirm completion selection  |
| `<C-Space>` | i    | Trigger completion manually   |
| `<C-e>`     | i    | Abort completion              |
| `<leader>v` | n    | Show specs cursor animation   |

### 🌳 Treesitter Text Objects (Visual Mode)

| Key         | Target                     |
| ----------- | -------------------------- |
| `af` / `if` | Around / Inside function   |
| `ac` / `ic` | Around / Inside class      |
| `al` / `il` | Around / Inside loop       |
| `ab` / `ib` | Around / Inside block      |
| `ap` / `ip` | Around / Inside parameter  |
| `a/` / `i/` | Around / Inside comment    |
| `as` / `is` | Around / Inside statement  |
| `aq` / `iq` | Around / Inside quotes     |
| `a=` / `i=` | Around / Inside assignment |

### 🌳 Treesitter Movement

| Key         | Action                         |
| ----------- | ------------------------------ |
| `]m` / `[m` | Next / previous function start |
| `]M` / `[M` | Next / previous function end   |
| `]]` / `[[` | Next / previous class start    |
| `][` / `[]` | Next / previous class end      |
| `<leader>a` | Swap parameter with next       |
| `<leader>A` | Swap parameter with previous   |

### 🐛 Debugging (DAP)

| Key     | Mode | Action                     |
| ------- | ---- | -------------------------- |
| `<F9>`  | n    | Toggle breakpoint          |
| `<F10>` | n    | Continue / start debugging |

### 🚀 Productivity & Navigation

| Key                          | Mode | Action                         |
| ---------------------------- | ---- | ------------------------------ |
| `<leader>cf`                 | n, v | Format with conform.nvim       |
| `<leader>xx`                 | n    | Trouble: workspace diagnostics |
| `<leader>xX`                 | n    | Trouble: document diagnostics  |
| `<leader>xq`                 | n    | Trouble: quickfix list         |
| `<leader>xl`                 | n    | Trouble: location list         |
| `<leader>cs`                 | n    | Trouble: document symbols      |
| `<leader>cl`                 | n    | Trouble: LSP references        |
| `<leader>ha`                 | n    | Harpoon: add current file      |
| `<leader>hh`                 | n    | Harpoon: toggle quick menu     |
| `<leader>h1` .. `<leader>h5` | n    | Harpoon: jump to file 1-5      |
| `<leader>td`                 | n    | Search TODOs with Telescope    |
| `<leader>tq`                 | n    | Open TODOs in Trouble          |
| `<leader>e`                  | n    | Open oil.nvim (current dir)    |
| `-`                          | n    | Open oil.nvim (parent dir)     |

### ⚡ Run Code

| Key    | Mode | Action                                                               |
| ------ | ---- | -------------------------------------------------------------------- |
| `<F5>` | n    | Run current file (Python: `uv run`, Go: `go run`, Rust: `cargo run`) |
| `<F6>` | n    | Run unit tests (Python: `unittest`, Go: `go test`)                   |

### 📝 Markdown & Notes

| Key          | Mode | Action                             |
| ------------ | ---- | ---------------------------------- |
| `<leader>md` | n    | Toggle Markdown preview in browser |
| `<leader>nn` | n    | Open note prompt (`:Note `)        |

### 🌐 Web Development

| Key          | Mode | Action                         |
| ------------ | ---- | ------------------------------ |
| `<leader>lc` | n    | Toggle Live Server (port 5000) |

### 📸 CodeSnap

| Key          | Mode | Action                             |
| ------------ | ---- | ---------------------------------- |
| `<leader>ca` | x    | Copy code snapshot to clipboard    |
| `<leader>cs` | x    | Save code snapshot to `~/Pictures` |

---

## Plugins Guide

### 🎨 UI & Theme

#### Tokyo Night

The colorscheme is **Tokyo Night** with a custom dark palette optimized for long coding sessions.

#### Alpha (Dashboard)

On startup, you'll see a **Datolytix** branded dashboard with quick actions:

- `e` — New file
- `f` — Find file
- `g` — Live grep
- `r` — Recent files
- `c` — Edit config (`init.lua`)
- `l` — Open Lazy plugin manager
- `m` — Open Mason LSP manager
- `q` — Quit

#### Noice

Replaces the default command-line and messages UI with a modern floating interface:

- Command palette style for `:` commands
- Rounded borders on popups
- Bottom search bar for `/` and `?`

#### Lualine

A fast statusline showing:

- **Mode** → **Git branch/diff/diagnostics** → **Filename** → **Encoding/format/type** → **Progress** → **Location**

#### Bufferline

Elegant buffer tabs at the top:

- **Slant** style separators
- LSP diagnostics indicators (errors/warnings)
- Buffer numbers with Powerline symbols
- `<left>` / `<right>` to cycle buffers

#### Indent Blankline

Rainbow-colored indentation guides that help you visually track code blocks.

#### Specs

A visual cursor indicator that animates when you jump (search results, etc.).

#### Render Markdown

Beautiful Markdown rendering directly inside Neovim — no browser, no Node.js required.

- **Headings** with icons and background highlights (6 levels)
- **Code blocks** with language icons and background
- **Checkboxes** — `-[ ]` and `-[x]` render as elegant icons
- **Tables** with aligned borders
- **Quotes**, **bullet lists**, **horizontal rules**, **links**, **images**
- Toggle rendering anytime with `<leader>md`

---

### 🔍 Fuzzy Finding (Telescope)

Telescope is your universal search tool. Key features:

- **Find files** (`<C-p>`) — ignores `node_modules`, `__pycache__`, `.git`, build dirs
- **Live grep** (`<leader>fg`) — search text across all files
- **Git integration** — status, commits, branches, stashes
- **LSP integration** — definitions, references, symbols, diagnostics

**Inside Telescope:**

- `<CR>` — Select/open item
- `<C-c>` — Close Telescope
- Navigate with `<Up>` / `<Down>`

---

### 🌳 File Explorer (NvimTree)

A sidebar file tree with:

- **Git status** icons (staged, modified, untracked, deleted)
- **LSP diagnostics** indicators
- **Custom icons** for folders and files (requires Nerd Font)
- **Adaptive sizing** and line numbers
- **Auto-close** when it's the last window

**Tree Filters:**

- Dotfiles are shown
- Git-ignored files are hidden
- Excludes: `.pyc`, `.DS_Store`, `__pycache__`, `.vscode`, `.idea`

---

### 🧠 LSP & Development

#### Supported Languages

The following LSP servers are pre-configured:

| Language        | Server             | Features                            |
| --------------- | ------------------ | ----------------------------------- |
| Lua             | `lua_ls`           | Full Lua support with `vim` globals |
| Python          | `pyright` + `ruff` | Type checking + linting/formatting  |
| TypeScript / JS | `ts_ls`            | IntelliSense, diagnostics           |
| Rust            | `rust_analyzer`    | Full Rust IDE experience            |
| JSON            | `jsonls`           | Schema validation                   |
| YAML            | `yamlls`           | Validation, Kubernetes schemas      |
| Docker          | `dockerls`         | Dockerfile validation               |
| C/C++           | `clangd`           | Code completion, diagnostics        |
| Bash            | `bashls`           | Shell script analysis               |
| HTML            | `html`             | Tag validation                      |
| CSS             | `cssls`            | Style linting                       |
| Markdown        | `marksman`         | Document navigation                 |
| LaTeX           | `ltex`             | Grammar/spelling                    |
| SQL             | `sqlls`            | Query analysis                      |
| Tailwind        | `tailwindcss`      | Utility class IntelliSense          |

#### Autocompletion (nvim-cmp)

Completion sources (in priority order):

1. **LuaSnip** — Code snippets
2. **Codeium** — AI-powered suggestions
3. **nvim_lsp** — Language server suggestions
4. **Path** — File paths
5. **Buffer** — Words from open buffers

**Completion UI:**

- Color-coded by type (Function, Variable, Class, etc.)
- Custom **Codeium** icon (󱐋)
- Documentation popup with rounded borders
- Command-line completion for `/`, `?`, and `:`

#### Auto-formatting

Files are automatically formatted on save via LSP (`async = true` for no UI blocking).

---

### 🤖 AI Completion (Codeium)

Codeium provides free AI-powered code suggestions:

- Appears inline in the completion menu with a 󱐋 icon
- Works across all configured languages
- Zero configuration required after installation

---

### 📝 Treesitter

Advanced syntax highlighting and code manipulation:

**Parsers installed:**
`bash`, `c`, `cpp`, `css`, `dockerfile`, `go`, `html`, `java`, `javascript`, `json`, `lua`, `make`, `python`, `rust`, `toml`, `typescript`, `yaml`, `markdown`, `vimdoc`, `regex`

**Features:**

- Incremental selection (`<CR>` to expand, `<BS>` to shrink)
- Smart text objects (`af`, `if`, `ac`, `ic`, etc.)
- Context-aware commenting
- Rainbow indentation guides
- Auto-tag closing for HTML/XML

---

### 🔧 Formatting (conform.nvim)

Modern async formatting with fallback to LSP:

- **Lua**: `stylua`
- **Python**: `isort` → `black`
- **JS/TS/JSON/YAML/HTML/CSS/Markdown**: `prettier`
- **Rust**: `rustfmt`
- **Shell**: `shfmt`
- **Go**: `gofmt` + `goimports`

Formats on save automatically. If no formatter is configured for the filetype, it falls back to LSP formatting.

---

### 🔥 Trouble

A beautiful diagnostics and quickfix list:

- `<leader>xx` — All workspace diagnostics
- `<leader>xX` — Current buffer diagnostics only
- `<leader>xq` — Quickfix list
- `<leader>xl` — Location list
- `<leader>cs` — Document symbols
- `<leader>cl` — LSP references

Navigate with `j/k`, press `<CR>` to jump, `q` to close.

---

### 🎯 Harpoon

Mark files and jump between them instantly:

- `<leader>ha` — Add current file to the list
- `<leader>hh` — Open the harpoon menu
- `<leader>h1` .. `<leader>h5` — Jump directly to file 1-5

Perfect when you're working across 3-5 files and don't want to cycle through all buffers.

---

### ✅ Todo Comments

Automatically highlights these keywords in comments:

- `TODO:` — Blue
- `FIX:` / `FIXME:` / `BUG:` — Red
- `HACK:` — Yellow
- `WARN:` / `WARNING:` / `XXX:` — Yellow
- `PERF:` / `OPTIMIZE:` — Purple
- `NOTE:` / `INFO:` — Green
- `TEST:` — Magenta

Search them with `<leader>td` (Telescope) or `<leader>tq` (Trouble).

---

### 🗂️ Oil

Edit your filesystem as if it were a normal buffer:

- `leader>e` — Open oil in the current directory
- `-` — Open oil in the parent directory

Inside oil:

- `dd` — Delete file/directory
- `cw` — Rename
- `yy` — Copy
- `p` — Paste
- `<CR>` — Open file / Enter directory
- `q` — Close oil

Shows hidden files by default.

---

### 🧪 Testing (Neotest)

Universal test runner with inline results:
- Run individual tests or whole files
- See ✅/❌ results inline in the buffer
- Debug tests via DAP
- Summary panel with tree view of all tests

Supported adapters configured:
- **Python** — pytest
- **Go** — go test

---

### 💡 vim-illuminate

Automatically highlights all occurrences of the word under your cursor (like VS Code). Works with LSP, Treesitter, and regex fallback.

Navigate between references with `<leader>ir` and `<leader>iR`.

---

### 🎯 Dropbar

Breadcrumbs in the winbar showing your current location:
```
file.py > MyClass > my_method > if block
```
- Clickable (if your terminal supports it)
- Press `<leader>dp` to pick a symbol via keyboard

---

### 🔗 nvim-surround

Manipulate "surroundings" (quotes, brackets, tags) with ease:
- `ysiw"` — surround inner word with quotes
- `cs"'` — change double quotes to single quotes
- `ds(` — delete surrounding parentheses
- `yss[` — surround entire line with brackets

---

### 🔀 Diffview

Professional Git diff interface:
- Compare current changes against HEAD
- Compare two branches
- View full file history
- Resolve merge conflicts visually

---

### 🤖 Avante.nvim

AI assistant that brings the **Cursor IDE** experience inside Neovim:
- Select code and ask for changes, explanations, or refactoring
- Avante proposes the diff — you choose what to apply
- Can create new files, rewrite functions, add tests
- Supports Claude (default), OpenAI, Moonshot (Kimi), and Copilot

**To set up your provider:**
1. Get an API key (Anthropic, OpenAI, or Moonshot)
2. Export it in your shell: `export ANTHROPIC_API_KEY="..."`
3. Edit `lua/plugins/avante.lua` to switch provider if desired

---

## Git Integration

### Gitsigns

Real-time Git diff indicators in the sign column:

- **Additions** (󰌴), **changes** (󰑌), **deletions** (󰗨), **untracked** (⟴)
- **Line number highlighting** for changed lines
- **Current line blame** (shows author, date, commit message at end of line)
- **Max file length:** 40,000 lines (prevents lag on huge files)

---

## Debugging

Basic DAP (Debug Adapter Protocol) support is included:

- `<F9>` — Toggle breakpoint
- `<F10>` — Continue / start debugging

For full debugging setup, install language-specific DAP adapters via Mason or manually.

---

## Custom Commands

| Command                  | Description                            |
| ------------------------ | -------------------------------------- |
| `:Mason`                 | Open Mason UI to manage LSPs/tools     |
| `:MasonInstallAll`       | Install all pre-configured LSP servers |
| `:MasonInstallTools`     | Install all formatters/linters         |
| `:Lazy`                  | Open Lazy.nvim plugin manager          |
| `:TSUpdate`              | Update Treesitter parsers              |
| `:NvimTreeToggle`        | Toggle file explorer                   |
| `:LiveServerStart`       | Start live server on port 5000         |
| `:LiveServerStop`        | Stop live server                       |
| `:LiveServerToggle`      | Toggle live server                     |
| `:RenderMarkdown toggle` | Toggle Markdown rendering              |
| `:DiffviewOpen`          | Open advanced Git diff view            |
| `:DiffviewFileHistory`   | Open file history                      |
| `:AvanteAsk`             | Ask the AI assistant                   |
| `:Note`                  | Open note manager                      |
| `:CodeSnap`              | Capture code snapshot (visual mode)    |
| `:CodeSnapSave`          | Save code snapshot to file             |

---

## File Structure

```
~/.config/nvim/
├── init.lua                 # Entry point
├── lua/
│   ├── options.lua          # Editor settings & autocommands
│   ├── keymaps.lua          # All keybindings
│   └── plugins/
│       ├── lazy.lua         # Plugin declarations (Lazy.nvim)
│       ├── theme.lua        # Colorscheme config
│       ├── lualine.lua      # Statusline
│       ├── bufferline.lua   # Buffer tabs
│       ├── noice.lua        # UI enhancements
│       ├── indent.lua       # Indent guides
│       ├── dashboard.lua    # Startup screen
│       ├── telescope.lua    # Fuzzy finder config
│       ├── nvtree.lua       # File explorer
│       ├── gitsigns.lua     # Git integration
│       ├── treesitter.lua   # Syntax highlighting
│       ├── autopairs.lua    # Auto-close brackets
│       ├── markdown.lua     # Render-markdown config and toggle keymap
│       ├── notes.lua        # Note-taking config
│       ├── liveserver.lua   # Live server config
│       ├── specs.lua        # Cursor animation
│       └── lsp/
│           ├── init.lua     # LSP defaults (on_attach, capabilities)
│           ├── mason.lua    # LSP installer config
│           ├── lspconfig.lua# Server configurations
│           ├── cmp.lua      # Autocompletion config
│           ├── cmp_nvim_lsp.lua # LSP capabilities
│           ├── null-ls.lua  # Formatters/linters bridge
│           └── lspsaga.lua  # LSP UI enhancements
└── backup_20260425_144217/  # Previous config backup
```

---

## Troubleshooting

### "attempt to yield across C-call boundary" error

This was fixed by disabling `automatic_installation` in Mason and wrapping `mason-null-ls` setup in `vim.defer_fn`. If you see this, ensure your Neovim is **0.11+**.

### Icons not showing

Install a **Nerd Font** and configure your terminal to use it.

### LSP not attaching

Run `:Mason` and ensure the server is installed. Then restart Neovim.

### Slow startup

Run `:Lazy profile` to see which plugins take the most time. Most plugins here are lazy-loaded.

### Python formatting not working

Ensure `black`, `isort`, and `ruff` are installed via `:MasonInstallTools`.

---

## Tips & Tricks

1. **Press `<Space>`** in Normal mode to trigger `which-key` and discover available shortcuts.
2. **Use `s`** for lightning-fast navigation with Flash — type `s` followed by the character you want to jump to.
3. **`<F5>`** runs your current file instantly for Python, Go, and Rust.
4. **Treesitter text objects** like `vif` (visual inside function) make selecting code blocks effortless.
5. **`<leader>ca`** in visual mode triggers CodeSnap for sharing beautiful code screenshots.
6. **Live Server** (`<leader>lc`) auto-refreshes your browser on HTML/CSS/JS changes.
7. **Auto-save** is enabled by default — you rarely need to press `:w`.

---

_Happy coding! 🚀_
