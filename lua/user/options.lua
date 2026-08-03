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
