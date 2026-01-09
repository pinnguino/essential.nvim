-- Install lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- Remap space as leader key. Mapping the leader key before loading lazy is required.
vim.keymap.set("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Load plugins
require("lazy").setup({
	spec = {
		-- Load plugins from sections
		{ import = "user.colorschemes" },
		{ import = "user.plugins.core" },
		{ import = "user.plugins.markdown" },
		{ import = "user.plugins.ui" },
		{ import = "user.plugins.lsp" },
	},
	ui = {
		border = "rounded"
	},
	change_detection = {
		enabled = true,
		notify = true -- Recieve a notification when the configuration changes
	}
})
