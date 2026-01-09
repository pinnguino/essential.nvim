return {
  "luukvbaal/statuscol.nvim",
	event = "VeryLazy",
	config = function()
		require("statuscol").setup({
			relculright = true,
		})
	end
	}
