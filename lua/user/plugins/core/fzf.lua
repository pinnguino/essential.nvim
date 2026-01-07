return {
	"ibhagwan/fzf-lua",
	event = "VeryLazy",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = function()
		return {
			defaults = {
				actions = {
					["ctrl-l"] = require("fzf-lua").actions.file_edit,
				}
			}
		}
	end
}
