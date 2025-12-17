return {
    "kylechui/nvim-surround",
    version = "^3.0.0",
    event = "InsertEnter",
	config = function()
		require("nvim-surround").setup({
			surrounds = {
				["i"] = {
					add = function()
						local delimiter = vim.fn.input({ prompt = "Enter the delimiter: " })
						-- local right_delimiter = left_delimiter and M.get_input("Enter the right delimiter: ")
						if delimiter then
							return { { delimiter }, { delimiter } }
						end
					end,
					find = function() end,
					delete = function() end,
				},
			}
		})
	end
}
