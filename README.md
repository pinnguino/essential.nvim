![banner](/banner.png)

<div align="center"><p>
	<a href="https://neovim.io">
      <img alt="Neovim 0.11+" src="https://img.shields.io/badge/Neovim-0.11+-32948.svg?style=for-the-badge&logo=neovim" />
    </a>
</div>

---
This is a minimal neovim config that includes the *essential* configurations and plugins. It's focused on being minimal, so it will include some basic things that I think every neovim configuration should have.
It can be boring to set up the base for a new config, so the goal of this configuration is to save you some time.
This configuration is inspired on the well known repo [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim), but with my way of structuring the configuration.
My personal daily drive configuration of neovim was built using this base setup. You can see it [here](https://github.com/pinnguino/pinguivim).

---

# ✨ Features

## Quality of Life settings ⚙️
The default behavior of neovim may not be comfortable for some users. That's why some settings have been changed in the `lua/user/options.lua` file.
You can test the behavior, and remove an option if you don't like it.
Test it until you find something that works for you.

```lua
-- lua/user/options.lua

local opt = vim.opt

opt.backup = false                          -- creates a backup file
opt.clipboard = "unnamedplus"               -- allows neovim to access the system clipboard
opt.cmdheight = 1                           -- more space in the neovim command line for displaying messages
opt.completeopt = { "menuone", "noselect" } -- mostly just for cmp
opt.conceallevel = 0                        -- so that `` is visible in markdown files
opt.fileencoding = "utf-8"                  -- the encoding written to a file
opt.hlsearch = true                         -- highlight all matches on previous search pattern
opt.ignorecase = true                       -- ignore case in search patterns
opt.mouse = "a"                             -- allow the mouse to be used in neovim
opt.pumheight = 10                          -- pop up menu height
opt.showmode = false						-- show the neovim mode (disable when using a statusline)
opt.showtabline = 1                         -- always show tabs
opt.smartcase = true                        -- smart case
opt.smartindent = true                      -- make indenting smarter again
opt.splitbelow = true                       -- force all horizontal splits to go below current window
opt.splitright = true                       -- force all vertical splits to go to the right of current window
opt.swapfile = false                        -- creates a swapfile
opt.termguicolors = true                    -- set term gui colors (most terminals support this)
opt.timeoutlen = 1000                       -- time to wait for a mapped sequence to complete (in milliseconds)
opt.undofile = true                         -- enable persistent undo
opt.updatetime = 300                        -- faster completion (4000ms default)
opt.writebackup = false                     -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
opt.shiftwidth = 4                          -- the number of spaces inserted for each indentation
opt.tabstop = 4                             -- insert 4 spaces for a tab
opt.cursorline = true                       -- highlight the current line
opt.number = true
opt.relativenumber = true                   -- set relative numbered lines
opt.numberwidth = 5                         -- set number column width {default 4}
opt.signcolumn = "yes"                      -- always show the sign column, otherwise it would shift the text each time
opt.foldmethod = "indent"                   -- fold text based on the indentation
opt.foldlevel = 99                          -- every fold is open when opening a file
opt.wrap = false                            -- display lines as one long line
opt.shortmess:append 'c'					-- Discrete messages
vim.cmd "set whichwrap+=<,>,[,],h,l"			-- Improve the way you move (more intuitive) 
vim.g.loaded_netrw = 1							-- disable netrw
vim.g.loaded_netrwPlugin = 1					-- disable netrw, use a tree-explorer plugin instead
```

## Basic Keymaps ⌨️
I included some of my personal favourite keymaps for my neovim workflow. Change anything to make this config match your own style.
There are some great bindings that make some behaviors more intuitive marked with `!` in the `lua/user/keymaps.lua` file. I recommend trying those keymaps.

### Normal mode bindings

| **Keymap** | **Description** | 
|:------:|:-----------:|
| `Ctrl+h` | Move to right split |
| `Ctrl+j` | Move to the bottom split |
| `Ctrl+k` | Move to the top split |
| `Ctrl+l` | Move to the right split |
| `Alt+h` | Previous buffer |
| `Alt+l` | Next buffer |
| `Space+Q` | Close buffer (Make sure you save before!) |
| `Space+w` | Write the current file |
| `Space+vs` | Make a vertical split |
| `Space+sp` | Make a horizontal split |
| `Space+on` | Close all splits (focus on current file) |
| `Esc` | Hide matching ocurrences on search |
| `Ctrl+Up` | Increase horizontal size of split |
| `Ctrl+Down` | Decrease horizontal size of split |
| `Ctrl+Left` | Increase vertical size of split |
| `Ctrl+Right` | Decrease vertical size of split |

### Insert mode bindings

| **Keymap** | **Description** | 
|:------:|:-----------:|
| `Ctrl+h` | Left arrow key |
| `Ctrl+l` | Right arrow key |

### Visual mode bindings

| **Keymap** | **Description** | 
|:------:|:-----------:|
| `<` | Indent 1 tab to the left |
| `>` | Indent 1 tab to the right |

## Native LSP
Since Neovim 0.11, the configuration for LSP can be achieved in a easy way without installing [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig).

When you want to add more languages servers simply add a new file with the name of the LSP in /lsp and return a table with the LSP configuration.
```
lsp/
├── jsonls.lua
└── lua_ls.lua
```

Enabling the servers in the `lua/user/lsp.lua`:
```lua
vim.lsp.enable({
	"jsonls",
	"lua_ls",
})

```

## Plugin manager 💤
I think that the best plugin manager to use right now is [lazy.nvim 💤](https://github.com/folke/lazy.nvim) by [folke](https://github.com/folke). It supports lazy-loading, nice UI and good performance.
You can found the installation of lazy in `lua/user/lazy.lua` from the lazy official repo.

## Plugin stucture 🔌

You can find all the plugins in `lua/user/plugins`. You will see that the plugins are separated by categories, avoiding one single `plugins` folder with dozens of files.
You can change this structure or add new categories in the `lua/user/lazy.lua` and edit the `import` setting. With this structure you can make a more modular and elegant config.

```
lua/user/plugins/
├── core
│   └── ...
├── lsp
│   └── ...
├── markdown
│   └── ...
└── ui
    └── ...
```

---

# Plugins list
The following are standard plugins to make neovim experience more confortable.

- **[nvim-autopairs](https://github.com/windwp/nvim-autopairs)**: Smart pair management.
- **[nvim-surround](https://github.com/kylechui/nvim-surround)**: Surround text with any character.
- **[nvim-tree](https://github.com/nvim-tree/nvim-tree.lua)**: A tree file explorer.
- **[rainbow-delimiters.nvim](https://github.com/HiPhish/rainbow-delimiters.nvim)**: Add colors for your (), [], {}.
- **[lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)**: A blazing fast statusline.
- **[markview.nvim](https://github.com/OXY2DEV/markview.nvim)** and **[obsidian.nvim](https://github.com/epwalsh/obsidian.nvim)**: My note-taking combo for markdown.
- **[fzf-lua](https://github.com/ibhagwan/fzf-lua)**: The fuzzy way of searching files inside Neovim.
- **[blink.cmp](https://github.com/saghen/blink.cmp)**: An easy and blazing fast completion plugin.
- **[mason.nvim](https://github.com/mason-org/mason.nvim)**: A portable package manager for installing LSPs, Linter, etc.
- **[statuscol.nvim](https://github.com/luukvbaal/statuscol.nvim)**: A statuscol plugin for show the relative line numbers in one column.
- **[harpoon](https://github.com/ThePrimeagen/harpoon/tree/harpoon2)**: Getting you where you want with the fewest keystrokes.
- **[nvim-notify](https://github.com/rcarriga/nvim-notify)**: Fancy notifications for neovim.
