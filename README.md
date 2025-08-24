<div align="center">

# Sebastian's Neovim Config

**A custom, modern, and blazing-fast Neovim configuration, built in Lua and managed with [Lazy.nvim](https://github.com/folke/lazy.nvim).**

*Crafted to provide a seamless, intuitive, and visually pleasing development experience.*

</div>

---

## ✨ Key Features

- **🚀 Superior Performance:** Optimized for a nearly instant startup and a fluid response.
- **🎨 Modern Interface:** A clean and functional UI with `lualine`, `bufferline`, and `noice`.
- **🧠 Smart LSP:** Top-tier autocompletion, diagnostics, and code navigation with `mason` and `nvim-lspconfig`.
- ** seamlessly Git:** Perfect Git integration directly in the editor thanks to `gitsigns`.
- **🔍 Fuzzy Search:** Find files, buffers, and more in seconds with the power of `telescope.nvim`.
- **🌳 Treesitter:** Advanced and accurate syntax highlighting for better code comprehension.

---

## 📸 In Action!

*(This is the perfect spot to add a screenshot of your setup!)*

---

## 📋 Prerequisites

- **[Neovim](https://github.com/neovim/neovim/releases/)** (v0.9.0+ recommended).
- **`git`** for cloning and managing plugins.
- A **[Nerd Font](https://www.nerdfonts.com/)** for icons to display correctly (e.g., Fira Code, JetBrains Mono).
- **C Compiler and Node.js** (required for `telescope` and other plugins).

---

## 💾 Installation

1.  **Make a backup (Important!):**
    If you have an existing configuration, save it first.
    ```bash
    mv ~/.config/nvim ~/.config/nvim.bak
    ```

2.  **Clone the repository:**
    ```bash
    git clone https://github.com/JuanS3/nvim.git ~/.config/nvim
    ```

3.  **Start Neovim:**
    Open Neovim. [Lazy.nvim](https://github.com/folke/lazy.nvim) will handle installing all the plugins automatically on the first launch.
    ```bash
    nvim
    ```

---

## 🔌 Featured Plugins

This plugin ecosystem is organized to enhance every aspect of development.

<details>
<summary><strong>🎨 UI & Visual Experience</strong></summary>

- **[lualine.nvim](https://github.com/nvim-lualine/lualine.nvim):** A fast and customizable statusline.
- **[bufferline.nvim](https://github.com/akinsho/bufferline.nvim):** Elegant and functional buffer tabs.
- **[noice.nvim](https://github.com/folke/noice.nvim):** A modern interface for notifications and the command line.
- **[which-key.nvim](https://github.com/folke/which-key.nvim):** Displays available key bindings.
- **[nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua):** A tree-style file explorer.
- **[indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim):** Visual indentation guides.

</details>

<details>
<summary><strong>🧠 LSP & Development</strong></summary>

- **[nvim-lspconfig](https://github.com/neovim/nvim-lspconfig):** Configurations for Neovim's native LSP.
- **[mason.nvim](https://github.com/williamboman/mason.nvim):** Easily manage and install LSPs, linters, and formatters.
- **[nvim-cmp](https://github.com/hrsh7th/nvim-cmp):** The most complete autocompletion engine.
- **[nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter):** Advanced syntax highlighting and much more.
- **[telescope.nvim](https://github.com/nvim-telescope/telescope.nvim):** The ultimate fuzzy finder for Neovim.
- **[gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim):** Git decorations and actions in the buffer.
- **[Comment.nvim](https://github.com/numToStr/Comment.nvim):** Smart, context-aware comments.

</details>

<details>
<summary><strong>🛠️ Utilities & Quality of Life</strong></summary>

- **[lazy.nvim](https://github.com/folke/lazy.nvim):** The lazy plugin manager that makes it all possible.
- **[nvim-autopairs](https://github.com/windwp/nvim-autopairs):** Automatic closing of parentheses, quotes, etc.
- **[codesnap.nvim](https://github.com/mistricky/codesnap.nvim):** Create beautiful snapshots of your code.
- **[markdown-preview.nvim](https://github.com/iamcco/markdown-preview.nvim):** Preview Markdown files in your browser.

</details>

> *To see the full list and their configurations, explore the files in `lua/plugins/`.*

---

## ⌨️ Key Mappings

The main leader key is set to `Space`.

- **`<Space>`:** Press the spacebar in Normal mode to activate `which-key` and see all available shortcuts.
- **`<Space>ff`:** Find files with Telescope.
- **`<Space>fg`:** Search file contents (Live Grep).

For a complete list of keymaps, check the `lua/keymaps.lua` file.

---

## 🤝 Contributions

Suggestions and contributions are always welcome! If you have ideas for improving this configuration, open an *issue* or submit a *pull request*.

## 🙏 Acknowledgements

A special thanks to the Neovim community and all the developers of the plugins that make this incredible editing experience possible.
