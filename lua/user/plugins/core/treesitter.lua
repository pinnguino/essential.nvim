return {
	'nvim-treesitter/nvim-treesitter',
	lazy = false,
	build = ':TSUpdate', -- Automatically update parsers on plugin update
	commit = '7caec27', -- Commit that still has 0.11 support
	config = function()
		require('nvim-treesitter').setup ({
			ensure_installed = { -- Languages to install parsers for
				"lua",
				"vimdoc",
				"markdown",
				"markdown_inline",
				"html",
				"css",
				"javascript",
				"bash",
				"git_config",
				"gitignore",
				"json"
			},
			highlight = {
				enable = true, -- Enable syntax highlighting
			},
			indent = {
				enable = true, -- Enable indentation
			},
		})
	end
}
