# essential.nvim 🐧
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
opt.showmode = true                         -- show the neovim mode (disable when using a statusline)
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
opt.number = true                           -- set numbered lines
opt.relativenumber = true                   -- set relative numbered lines
opt.numberwidth = 5                         -- set number column width {default 4}
opt.foldmethod = "indent"                   -- fold text based on the indentation
opt.foldlevel = 99                          -- every fold is open when opening a file
opt.signcolumn = "yes"                      -- always show the sign column, otherwise it would shift the text each time
opt.wrap = false                            -- display lines as one long line
opt.shortmess:append 'c'                    -- discrete messages
vim.cmd "set whichwrap+=<,>,[,],h,l"        -- improve the way you move (more intuitive) 
vim.g.loaded_netrw = 1                      -- disable netrw
vim.g.loaded_netrwPlugin = 1                -- disable netrw, use a tree-explorer plugin instead
```

## Keymaps ⌨️
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

## Plugin manager 💤
I think that the best plugin manager to use right now is [lazy.nvim 💤](https://github.com/folke/lazy.nvim) by [folke](https://github.com/folke). It supports lazy-loading, nice UI and good performance.
You can found the installation of lazy in `lua/user/lazy.lua` from the lazy official repo.

## Plugin stucture 🔌

You can find all the plugins in `lua/user/plugins`. You will see that the plugins are separated by categories, avoiding one single `plugins` folder with dozens of files.
You can change this structure or add new categories in the `lua/user/lazy.lua` and edit the `import` setting. With this structure you can make a more modular and elegant config.

---

# Plugins list
The following are standard plugins to make neovim experience more confortable.

**[nvim-autopairs](https://github.com/windwp/nvim-autopairs)**: Smart pair management.
