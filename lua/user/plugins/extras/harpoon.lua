return {
	"ThePrimeagen/harpoon",
	event = "VeryLazy",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local harpoon = require('harpoon')

		function harpoon_add() -- Add a file to the harpoon list
			harpoon:list():add()
			local plugin = "Harpoon"
			vim.notify(" 󱡅  File marked", "info", {
				title = " " .. plugin,
			})
		end

		function harpoon_toggle() -- Toggle the harpoon list 
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end

		harpoon:setup({})
		vim.keymap.set("n", "<TAB>", harpoon_toggle, { noremap = true, silent = true })
		vim.keymap.set("n", "<leader>a", harpoon_add, { noremap = true, silent = true })
		harpoon:extend({
			UI_CREATE = function(cx)
				vim.keymap.set("n", "l", function()
					harpoon.ui:select_menu_item()
				end, { buffer = cx.bufnr })
			end,
		})
	end
}
