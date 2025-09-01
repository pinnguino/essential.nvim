return {
    "kylechui/nvim-surround",
    version = "^3.0.0", -- Use for stability; omit to use 'main' branch for the latest features
    event = "InsertEnter",
	config = function()
		require("nvim-surround").setup({
			surrounds = {
				["i"] = { -- TODO: Add find/delete/change functions
					add = function()
						local delimiter = vim.fn.input({ prompt = "Enter the left delimiter: " })
						-- local right_delimiter = left_delimiter and M.get_input("Enter the right delimiter: ")
						if delimiter then
							return { { delimiter }, { delimiter } }
						end
					end,
					find = function() end,
					delete = function() end,
				},
			}
			-- Configuration here, or leave empty to use defaults
		})
	end
}
