return {
	'nvim-treesitter/nvim-treesitter',
	lazy = false,
	build = ':TSUpdate', -- Automatically update parsers on plugin update
	config = function()
		require('nvim-treesitter').setup ({
			ensure_installed = {
				"lua",
				"vimdoc",
				"markdown",
				"markdown_inline",
				"html",
				"css",
				"bash",
				"git_config",
				"gitignore",
				"json",

			}, -- Languages to install parsers for
			highlight = {
				enable = true, -- Enable syntax highlighting
			},
			indent = {
				enable = true, -- Enable indentation
			},
		})
	end
}
