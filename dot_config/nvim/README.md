# My Nvim Config

<!--toc:start-->

- [My Nvim Config](#my-nvim-config)
  - [Plugin List](#plugin-list)
    - [Core](#core)
    - [UI](#ui)
    - [Navigation](#navigation)
    - [Editing](#editing)
    - [Git](#git)
    - [Utilities](#utilities)
  - [Installation](#installation)
    - [Prerequisites](#prerequisites)
    - [Install](#install)
    - [Post-Install](#post-install)
  - [Key Bindings](#key-bindings) - [General](#general) - [LSP](#lsp) - [Editing](#editing-1) - [Completion](#completion) - [Navigation](#navigation-1)
  <!--toc:end-->

## Plugin List

### Core

- [lazy.nvim](https://github.com/folke/lazy.nvim) - Plugin manager
- [mason.nvim](https://github.com/williamboman/mason.nvim) - LSP/formatter installer
- [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) - LSP configuration
- [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) - Autocompletion
- [conform.nvim](https://github.com/stevearc/conform.nvim) - Formatting

### UI

- [rose-pine](https://github.com/rose-pine/neovim) - Colorscheme (custom black variant)
- [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) - Statusline
- [which-key.nvim](https://github.com/folke/which-key.nvim) - Keybind hints

### Navigation

- [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) - Fuzzy finder
- [trouble.nvim](https://github.com/folke/trouble.nvim) - Diagnostics list

### Editing

- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) - Syntax highlighting
- [Comment.nvim](https://github.com/numToStr/Comment.nvim) - Toggle comments
- [nvim-surround](https://github.com/kylechui/nvim-surround) - Surround text objects
- [nvim-autopairs](https://github.com/windwp/nvim-autopairs) - Auto-close brackets

### Git

- [vim-fugitive](https://github.com/tpope/vim-fugitive) - Git commands
- [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) - Git decorations

### Utilities

- [undotree](https://github.com/mbbill/undotree) - Undo history visualizer
- [zen-mode.nvim](https://github.com/folke/zen-mode.nvim) - Distraction-free writing
- [cloak.nvim](https://github.com/laytan/cloak.nvim) - Hide .env secrets
- [todo-comments.nvim](https://github.com/folke/todo-comments.nvim) - Highlight TODOs
- [auto-save.nvim](https://github.com/okuuva/auto-save.nvim) - Auto-save on changes

(Might forget some plugins)

## Installation

### Prerequisites

- Neovim >= 0.9.0
- Git
- A [Nerd Font](https://www.nerdfonts.com/) (for icons)
- ripgrep (for Telescope live grep)

### Install

```bash
# Backup your existing config
mv ~/.config/nvim ~/.config/nvim.backup

# Clone this config
git clone https://github.com/sp41414/nvim-config.git ~/.config/nvim

# Start Neovim (plugins will auto-install)
nvim
```

### Post-Install

1. Run `:MasonToolsInstall`

## Key Bindings

### General

| Key          | Action                     |
| ------------ | -------------------------- |
| `<leader>ff` | Find files                 |
| `<leader>fg` | Live grep                  |
| `<leader>fb` | Find buffers               |
| `<leader>f`  | Format buffer              |
| `<leader>pv` | Open file explorer (netrw) |
| `<leader>u`  | Toggle undotree            |
| `<leader>z`  | Toggle zen mode            |

### LSP

| Key           | Action              |
| ------------- | ------------------- |
| `gd`          | Go to definition    |
| `K`           | Hover documentation |
| `<leader>vd`  | Show diagnostics    |
| `<leader>vca` | Code actions        |
| `<leader>vrn` | Rename symbol       |
| `<leader>vrr` | Find references     |

### Editing

| Key       | Action                      |
| --------- | --------------------------- |
| `gc`      | Toggle comment (visual)     |
| `J` / `K` | Move lines up/down (visual) |

### Completion

| Key         | Action                          |
| ----------- | ------------------------------- |
| `<Tab>`     | Next completion / Jump snippet  |
| `<S-Tab>`   | Previous completion / Jump back |
| `<CR>`      | Confirm completion              |
| `<C-Space>` | Trigger completion              |

### Navigation

| Key               | Action                          |
| ----------------- | ------------------------------- |
| `<C-d>` / `<C-u>` | Scroll half-page (centered)     |
| `n` / `N`         | Next/previous search (centered) |
| `<C-j>` / `<C-k>` | Next/previous quickfix item     |

(Might forget some keybindings)
