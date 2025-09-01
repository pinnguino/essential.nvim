return {
	'nvim-treesitter/nvim-treesitter',
	lazy = false,
	build = ':TSUpdate', -- Automatically update parsers on plugin update
	config = function()
		require('nvim-treesitter.configs').setup {
			ensure_installed = { "lua", "powershell", "vimdoc", "markdown", "markdown_inline", "html" }, -- Languages to install parsers for
			highlight = {
				enable = true, -- Enable syntax highlighting
			},
			indent = {
				enable = true, -- Enable indentation
			},
		}
	end
}
