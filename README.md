![banner](banner.png)

<div align="center"><p>
	<a href="https://neovim.io">
      <img alt="Neovim 0.12+" src="https://img.shields.io/badge/Neovim-0.12+-32948.svg?style=for-the-badge&logo=neovim" />
    </a>
</div>

---
This is a minimal neovim config that includes the *essential* configurations and plugins. It's focused on being minimal, so it will include some basic things that I think every neovim configuration should have.
It can be boring to set up the base for a new config, so the goal of this configuration is to save you some time.
This configuration is inspired by the well known repo [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim), but with my way of structuring the configuration.
My personal daily drive configuration of neovim was built using this base setup. You can see it [here](https://github.com/pinnguino/pinguivim).

---

# ✨ Features

## Quality of Life settings ⚙️
The default behavior of neovim may not be comfortable for some users. That's why some settings have been changed in the `lua/user/options.lua` file.
You can test the behavior, and remove an option if you don't like it.
Test it until you find something that works for you.

```lua
-- lua/user/options.lua

local o = vim.opt

-- Disable native netrw explorer (to use external plugins)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Hybrid line numbers
o.number = true
o.relativenumber = true
o.numberwidth = 5

-- Tabulation and indentation (4 spaces)
o.expandtab = true
o.shiftwidth = 4
o.tabstop = 4
o.smartindent = true

-- Smart search
o.ignorecase = true
o.smartcase = true

-- Use system clipboard
o.clipboard = "unnamedplus"

-- Windows and UI behavior
o.splitbelow = true
o.splitright = true
o.cursorline = true
o.signcolumn = "yes"
o.pumheight = 10
o.cmdheight = 1
o.showmode = false
o.wrap = false

-- Completion settings and timings
o.completeopt = { "menuone", "noselect" }
o.updatetime = 300
o.timeoutlen = 1000

-- Files and backups
o.swapfile = false
o.writebackup = false

-- Folding
o.foldmethod = "indent"
o.foldlevel = 99

-- Movement across lines with arrows / h / l
o.whichwrap:append("<,>,[,],h,l")
```

## Keymaps ⌨️
The leader key is `Space`. I included some of my personal favourite keymaps for my Neovim workflow. Change anything to make this config match your own style.
Keymaps are defined in the `lua/user/keymaps/` folder.

### Core keymaps (`keymaps/core.lua`)

#### Normal mode

| **Keymap** | **Description** |
|:------:|:-----------:|
| `Ctrl+h` | Move to left split |
| `Ctrl+j` | Move to the bottom split |
| `Ctrl+k` | Move to the top split |
| `Ctrl+l` | Move to the right split |
| `Alt+h` | Previous buffer |
| `Alt+l` | Next buffer |
| `Space+Q` | Close buffer (changes not saved are lost!) |
| `Space+w` | Write the current file |
| `Space+vs` | Make a vertical split |
| `Space+sp` | Make a horizontal split |
| `Space+on` | Close all splits (focus on current file) |
| `Space+L` | Open lazy.nvim |
| `Esc` | Hide matching occurrences on search |
| `Ctrl+Up` | Increase horizontal size of split |
| `Ctrl+Down` | Decrease horizontal size of split |
| `Ctrl+Left` | Increase vertical size of split |
| `Ctrl+Right` | Decrease vertical size of split |

#### Insert mode

| **Keymap** | **Description** |
|:------:|:-----------:|
| `Ctrl+h` | Left arrow key |
| `Ctrl+l` | Right arrow key |

#### Visual mode

| **Keymap** | **Description** |
|:------:|:-----------:|
| `<` | Indent 1 tab to the left (keeps selection) |
| `>` | Indent 1 tab to the right (keeps selection) |
| `p` | Paste without overwriting the clipboard |

### File tree (`keymaps/nvim-tree.lua`)

| **Keymap** | **Description** |
|:------:|:-----------:|
| `Space+e` | Toggle file tree |

Inside the tree:

| **Keymap** | **Description** |
|:------:|:-----------:|
| `l` | Open file or directory |
| `h` | Close parent directory |
| `v` | Open in vertical split |
| `cd` | Change root to node |
| `a` | Create file |
| `r` | Rename |
| `d` | Delete |
| `x` / `y` / `p` | Cut / copy / paste |
| `Y` | Copy relative path |

### Picker (`keymaps/picker.lua`, fzf-lua)

| **Keymap** | **Description** |
|:------:|:-----------:|
| `Space+ff` | Find files |
| `Space+fg` | Live grep in files |
| `Space+fb` | Buffers |
| `Space+fr` | Recent files |
| `Space+fc` | Colorschemes |
| `Space+fC` | Neovim commands |
| `Space+fd` | Workspace diagnostics |
| `Space+fk` | Keymaps |

### LSP (`keymaps/lsp.lua`)

These keymaps are active when a language server is attached.

| **Keymap** | **Description** |
|:------:|:-----------:|
| `gd` | Go to definition |
| `gD` | Go to declaration |
| `gi` | Go to implementation |
| `gt` | Go to type definition |
| `gR` | Show references |
| `K` | Hover documentation |
| `Space+ca` | Code action |
| `Space+rn` | Rename symbol |
| `Space+dd` | Document diagnostics |
| `gl` | Open floating diagnostic |
| `[d` / `]d` | Previous / next diagnostic |

### Completion (`keymaps/completion.lua`, blink.cmp)

| **Keymap** | **Description** |
|:------:|:-----------:|
| `Ctrl+j` / `Ctrl+k` | Next / previous item |
| `Ctrl+l` | Accept suggestion |
| `Ctrl+Space` | Show completion / documentation |
| `Ctrl+e` | Hide completion |
| `Tab` / `Shift+Tab` | Snippet forward / backward |

## Native LSP
Since Neovim 0.11, the configuration for LSP can be achieved in an easy way without installing [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig).

Each language server has its own file in `lsp/`, which returns a table with its configuration:
```
lsp/
├── bashls.lua
└── lua_ls.lua
```

Servers are enabled in `lua/user/lsp.lua`:
```lua
vim.lsp.enable({
    "lua_ls",
    "bashls"
})
```

To add a language server, create a new file in `lsp/` with the server name and add it to the `vim.lsp.enable` list.

The servers need to be installed on your system:
- `lua-language-server` for `lua_ls`
- `bash-language-server` for `bashls`

You can also install them with [mason.nvim](https://github.com/mason-org/mason.nvim) using the `:Mason` command.

## Plugin manager 💤
I think that the best plugin manager to use right now is [lazy.nvim 💤](https://github.com/folke/lazy.nvim) by [folke](https://github.com/folke). It supports lazy-loading, nice UI and good performance.
You can find the installation of lazy in `lua/user/lazy.lua`, taken from the official lazy repo.

## Plugin structure 🔌

You can find all the plugins in `lua/user/plugins`. The plugins are separated by categories, avoiding one single `plugins` folder with dozens of files.
You can change this structure or add new categories in `lua/user/lazy.lua`, editing the `import` settings.

```
lua/user/plugins/
├── colorschemes
│   └── ...
├── core
│   └── ...
├── lsp
│   └── ...
└── ui
    └── ...
```

---

# Plugins list
The following are the plugins included in this config, to make the neovim experience more comfortable.

- **[tokyonight.nvim](https://github.com/folke/tokyonight.nvim)**: The (best) colorscheme used by default.
- **[nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)**: Syntax highlighting and indentation. Parsers are installed automatically for the languages listed in `core/treesitter.lua`.
- **[nvim-surround](https://github.com/kylechui/nvim-surround)**: Surround text with any character.
- **[nvim-tree](https://github.com/nvim-tree/nvim-tree.lua)**: A tree file explorer.
- **[rainbow-delimiters.nvim](https://github.com/HiPhish/rainbow-delimiters.nvim)**: Add colors for your (), [], {}.
- **[indentmini.nvim](https://github.com/nvimdev/indentmini.nvim)**: Show indentation guides.
- **[lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)**: A blazing fast statusline.
- **[nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons)**: File icons used by other plugins.
- **[fzf-lua](https://github.com/ibhagwan/fzf-lua)**: The fuzzy way of searching files inside Neovim.
- **[blink.cmp](https://github.com/saghen/blink.cmp)**: An easy-to-config and blazing fast completion plugin.
- **[friendly-snippets](https://github.com/rafamadriz/friendly-snippets)**: A collection of snippets that integrates with blink.cmp.
- **[mason.nvim](https://github.com/mason-org/mason.nvim)**: A portable package manager for installing LSPs, Linter, etc.
- **[nvim-notify](https://github.com/rcarriga/nvim-notify)**: Fancy notifications for neovim.

## Custom modules 🛠️
These modules are written by me and live in `lua/user/my_plugins/`. They are not plugins, just small pieces of Lua loaded from `init.lua`.

- **Autopairs** (`autopairs.lua`): Inserts and removes pairs of `()`, `[]`, `{}` and quotes, skips closing characters that are already present, and expands brackets onto separate lines when you press Enter.
- **Last session** (`last-session.lua`): Saves the session to `lastsession.vim` when you exit Neovim. Load it again with `:LoadSession ~/.config/nvim/lastsession.vim`.
- **Colorscheme persist** (`colorscheme-persist.lua`): Saves the colorscheme you pick to `lua/user/colorscheme.lua`, so it is restored on the next start.
