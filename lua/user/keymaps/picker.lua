-- File picker

vim.keymap.set("n", "<leader>ff", ":FzfLua files<CR>", opts) -- Files
vim.keymap.set("n", "<leader>fb", ":FzfLua buffers<CR>", opts) -- Buffers
vim.keymap.set("n", "<leader>fg", ":FzfLua live_grep<CR>", opts) -- Text in files
vim.keymap.set("n", "<leader>fr", ":FzfLua oldfiles<CR>", opts) -- Recent files
vim.keymap.set("n", "<leader>fc", ":FzfLua colorschemes<CR>", opts) -- Colorschemes
vim.keymap.set("n", "<leader>fC", ":FzfLua commands<CR>", opts) -- Neovim commands
vim.keymap.set("n", "<leader>fd", ":FzfLua diagnostics_workspace<CR>", opts) -- Workspace diagnostics
vim.keymap.set("n", "<leader>fk", ":FzfLua keymaps<CR>", opts) -- Keymaps
