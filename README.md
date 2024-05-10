# Neovim Configuration (Beta β)

Welcome to my Neovim configuration repository! This repository contains my personalized configuration files and plugins for Neovim, meticulously crafted to optimize my coding workflow and productivity.
This configuration is designed to enhance my editing experience, offering a seamless experience for both code and text editing.

## Table of Contents

- [Overview](#overview)
- [Features](#features)
- [Installation](#installation)
- [Usage](#usage)
- [Plugins](#plugins)
- [Customization](#customization)
- [Key Mappings](#key-mappings)
- [Contributing](#contributing)
- [Acknowledgements](#acknowledgements)

---

## Overview <a name="overview"></a>

Neovim is a highly extensible text editor based on Vim, designed to provide a modern and efficient editing experience. My Neovim configuration builds upon its powerful features, offering a customized environment optimized for coding and text editing tasks.

## Features <a name="features"></a>

- **Enhanced Editing**: Streamlined editing workflows with custom key mappings, macros, and text objects.
- **Syntax Highlighting**: Rich syntax highlighting for various programming languages and file types, improving code readability and comprehension.
- **Plugin Management**: Seamless integration of plugins for additional functionality and productivity enhancements, managed via Lazy, a Lua-based lazy-loading plugin manager.
- **Custom Themes**: Thoughtfully selected color schemes and UI enhancements to create a visually appealing and comfortable editing environment, reducing eye strain during extended coding sessions.
- **Language Support**: Specialized configurations and plugins for popular programming languages and frameworks, including code completion, linting, and formatting tools.

## Installation <a name="installation"></a>

To use my Neovim configuration, follow these steps:

1. **Clone the Repository**: Clone this repository to your local machine.

    ```bash
    git clone https://github.com/JuanS3/nvim.git ~/.config/nvim
    ```

2. **Enjoy**: Start using Neovim with my customized configuration!

## Usage <a name="usage"></a>

To make the most of my Neovim configuration, explore its features and customization options. Familiarize yourself with key mappings, plugin commands, and additional functionality provided by installed plugins. Refer to the extensive comments and documentation within the Lua configuration files (`init.lua` and Lua modules) for detailed information.

## Plugins <a name="plugins"></a>

My Neovim configuration includes a curated selection of plugins to extend its capabilities. Lazy loading is employed to ensure fast startup times and efficient resource usage. Some of the key plugins featured in this configuration are:

- **[lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)**: A fast and customizable statusline written in Lua, providing essential information about the editing session.
- **[codeium.nvim](https://github.com/Exafunction/codeium.vim)**: A code completion plugin for Neovim.
- **[MarkdownPreview](https://github.com/iamcco/markdown-preview.nvim)**: A live preview plugin for Markdown files in Neovim.
- **[telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)**: A highly extensible fuzzy finder plugin implemented in Lua for efficient file and buffer navigation.
- **[nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua)**: A file explorer plugin implemented in Lua for easy project navigation.
- **[nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)**: A powerful and extensible syntax highlighting plugin for Neovim.
- **[nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)**: A plugin for configuring and managing language servers in Neovim.
- **[mason.nvim](https://github.com/williamboman/mason.nvim)**: A plugin for managing and installing language servers and other tools in Neovim.
- **[mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim)**: A plugin for configuring and managing language servers in Neovim.
- **[lspsaga.nvim](https://github.com/glepnir/lspsaga.nvim)**: A plugin for displaying LSP diagnostics and code actions in Neovim.
- **[null-ls.nvim](https://github.com/jose-elias-alvarez/null-ls.nvim)**: A plugin for managing and installing language servers in Neovim.
- **[lspkind.nvim](https://github.com/onsails/lspkind-nvim)**: A plugin for displaying LSP icons in Neovim.
- **[nvim-cmp](https://github.com/hrsh7th/nvim-cmp)**: A plugin for displaying LSP diagnostics and code actions in Neovim.
- **[cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp)**: A plugin for displaying LSP diagnostics and code actions in Neovim.
- **[cmp_luasnip](https://github.com/saadparwaiz1/cmp_luasnip)**: A plugin for displaying LSP diagnostics and code actions in Neovim.
- **[LuaSnip](https://github.com/L3MON4D3/LuaSnip)**: A plugin for displaying LSP diagnostics and code actions in Neovim.
- **[lsp-zero.nvim](https://github.com/VonHeikemen/lsp-zero.nvim)**: A plugin for displaying LSP diagnostics and code actions in Neovim.
- **[nvim-autopairs](https://github.com/windwp/nvim-autopairs)**: A super powerful autopair plugin for Neovim that supports multiple characters.
- **[nvim-comment](https://github.com/terrortylor/nvim-comment)**: Toggle comments in Neovim, using built in `commentstring` filetype option; written in Lua.
- **[gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)**: Super fast git decorations implemented purely in Lua.
- **[wich-key.nvim](https://github.com/folke/which-key.nvim)**: WhichKey is a lua plugin that displays a popup with possible key bindings of the command you started typing.
- **[auto-save.nvim](https://github.com/Pocco81/auto-save.nvim)**: A plugin for automatically saving files in Neovim.
- **[vim-python-pep8-indent](https://github.com/Vimjas/vim-python-pep8-indent)**: Neovim plugin for PEP8 indentation.
- **[emmet-vim](https://github.com/mattn/emmet-vim)**: A plugin for super fast HTML and CSS coding in Neovim.
- **[vim-tmux-navigator](https://github.com/christoomey/vim-tmux-navigator)**: A plugin for navigating between Vim and Tmux panes in Neovim.
- **[codesnap.nvim](https://github.com/mistricky/codesnap.nvim)**: This plugin provides snapshots of code in Neovim.
- **[indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim)**: A plugin for displaying indentation guides in Neovim.
- **[nvim-highlight-colors](https://github.com/brenoprata10/nvim-highlight-colors)**: A plugin for highlighting colors in Neovim.


Explore the `init.lua` file and corresponding Lua modules for a comprehensive list of installed plugins and their settings.

## Customization <a name="customization"></a>

Feel free to customize my Neovim configuration according to your preferences and workflow. Modify key mappings, tweak plugin settings, or add/remove plugins to tailor the environment to your specific needs. Lua-based configuration allows for flexible and powerful customization, enabling you to create a personalized editing experience.

## Key Mappings <a name="key-mappings"></a>

The `init.lua` file contains detailed key mappings and configurations to enhance your editing experience. Familiarize yourself with these mappings to efficiently navigate, edit, and manipulate text within Neovim. Additionally, explore Lua modules for plugin-specific mappings and configurations.

## Contributing <a name="contributing"></a>

Contributions, suggestions, and feedback are welcome! If you have ideas for improving my Neovim configuration or encounter any issues, please open an issue or submit a pull request. Let's collaborate to make Neovim even better for everyone.

## Acknowledgements <a name="acknowledgements"></a>

I would like to express my gratitude to the developers of Neovim and the creators of the plugins used in this configuration. Their dedication and contributions have significantly enriched the Neovim ecosystem and transformed the way we edit text and code.

