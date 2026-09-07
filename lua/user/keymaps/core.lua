-- Shorten function name
local keymap = vim.keymap.set

-- Common options for almost every keymap
local opts = { noremap = true, silent = true }

------------------------------------------------------------------------------------------------
-- Keymap syntax:                                                                             --
-- keymap('m', "keybind", "keymap", opts)                                                     --
-- m: Vim mode which will apply the keymap (See modes)                                        --
-- keybind: Bind that you want to set                                                         --
-- keymap: The keymap you want to replace (Note: the previous keymap will remain untouched).  --
------------------------------------------------------------------------------------------------

-- Neovim modes --
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- NORMAL MODE --
-- Better navigation between splits
keymap("n", "<C-h>", "<C-w>h", opts) -- Move to right split
keymap("n", "<C-j>", "<C-w>j", opts) -- Move to the bottom split
keymap("n", "<C-k>", "<C-w>k", opts) -- Move to the top split
keymap("n", "<C-l>", "<C-w>l", opts) -- Move to the right split

-- Buffer navigation
keymap("n", "<A-h>", ":bprevious<CR>", opts) -- Move to previous buffer
keymap("n", "<A-l>", ":bnext<CR>", opts) -- Move to next buffer

-- Save/close buffers
keymap("n", "<leader>Q", ":bdelete!<CR>", opts) -- Close current file (Note: If you close a buffer without saving, you'll lose the changes)
keymap("n", "<leader>w", ":w<CR>", { noremap = true, silent = false }) -- Save current file

-- Split management
keymap("n", "<leader>vs", ":vsplit<CR>", opts) -- Vertical split
keymap("n", "<leader>sp", ":split<CR>", opts) -- Horizontal split
keymap("n", "<leader>on", ":only<CR>", opts) -- Exit split (without closing the buffer)

-- Search
keymap("n", "<Esc>", ":noh<CR>", opts) -- Hide matching ocurrences on search

-- Resize splits with arrow keys
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize +2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize -2<CR>", opts)

-- INSERT MODE --
-- Moving left, right, up and down in insert mode with hjkl (too lazy to look for arrow keys)
keymap("i", "<C-h>", "<Left>", opts)
keymap("i", "<C-l>", "<Right>", opts)

-- VISUAL MODE --
-- Stay in indent mode when using > or < keys to indent pieces of text
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

keymap("v", "p", '"_dP', opts) -- Mantains the clipboard after highlighting something and pasting.

keymap("n", "<leader>L", ":Lazy<CR>", opts) -- Open lazy.nvim
