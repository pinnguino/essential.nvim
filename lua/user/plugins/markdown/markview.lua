return {
	"OXY2DEV/markview.nvim",
	event = "VeryLazy",
	-- ft = "markdown",
	enabled = true,
	dependencies = {
		-- "nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons"
	},
	config = function()
		local presets = require("markview.presets")
		require("markview").setup({
			html = {
				enable = true
			},
			latex = {},
			markdown = {
				block_quotes = {
					enable = true
				},
				code_blocks = {
					enable = true
				},
				headings = {
					enable = true
				},
				horizontal_rules = presets.horizontal_rules.thick,
				list_items = {
					enable = true
				},
				tables = {
					enable = true
				},
			},
			markdown_inline = {
				enable = true
			},
			preview = {
				callbacks = {},
				debounce = 50,
				enable = true,
				filetypes = { "markdown" },
				hybrid_modes = { "n", "v", "i" },
				ignore_buftypes = { "nofile" },
				modes = { "n", "no", "c", "i" },
				splitview_winopts = {}
			}
		})
	end
}
