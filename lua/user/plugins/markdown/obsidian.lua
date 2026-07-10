return 	{
	"epwalsh/obsidian.nvim",
	enabled = true,
	-- event = "VeryLazy",
	ft = "markdown",
	version = "*",  -- recommended, use latest release instead of latest commit
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		require("obsidian").setup({
			ui = {
				enable = false,
				highlight_text = { hl_group = "ObsidianHighlightText" },
			},
			workspaces = {
				{
					name = "second-brain",
					path = "~/second-brain",
				},
			}
		})
	end
}
