return {
	"nvim-tree/nvim-tree.lua",
	event = "VeryLazy",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local icons = require "user.icons"
		-- All this mess to set custom keymaps :(
		local function my_on_attach(bufnr)
			local api = require('nvim-tree.api')
			local function opts(desc)
				return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
			end
			-- Setting personal keymaps
			vim.keymap.set('n', 'l', api.node.open.edit, opts('Open'))
			vim.keymap.set('n', 'cd', api.tree.change_root_to_node, opts('CD'))
			vim.keymap.set('n', 'h', api.node.navigate.parent_close, opts('Close'))
			vim.keymap.set('n', 'v', api.node.open.vertical, opts('OpenInVsplit'))
			vim.keymap.set('n', 'r', api.fs.rename, opts('Rename'))
			vim.keymap.set('n', 'a', api.fs.create, opts('CreateFile'))
			vim.keymap.set('n', 'd', api.fs.remove, opts('Delete'))
			vim.keymap.set('n', 'y', api.fs.copy.node, opts('Copy'))
			vim.keymap.set('n', 'x', api.fs.cut, opts('Cut'))
			vim.keymap.set('n', 'p', api.fs.paste, opts('Paste'))
			vim.keymap.set('n', 'Y', api.fs.copy.relative_path, opts('CopyRelativePath'))
		end
		require("nvim-tree").setup({
			on_attach = my_on_attach,
			view = {
				relativenumber = false,
				width = 35,
			},
			renderer = {
				indent_width = 2,
				indent_markers = {
					enable = false,
					inline_arrows = true,
					icons = {
						corner = "└",
						edge = "│",
						item = "│",
						none = " ",
					},
				},
				icons = {
					glyphs = {
						git = {
							unstaged = icons.git.FileUnstaged,
							staged = icons.git.FileStaged,
							unmerged = icons.git.FileUnmerged,
							renamed = icons.git.FileRenamed,
							untracked = icons.git.FileUntracked,
							deleted = icons.git.FileDeleted,
							ignored = icons.git.FileIgnored,
						},
					},
				},
				special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md" },
				symlink_destination = true,
			},
			git = {
				ignore = false -- Show ignored files by git
			},
			diagnostics = {
				enable = true,
				show_on_dirs = false,
				show_on_open_dirs = true,
				debounce_delay = 50,
				severity = {
					min = vim.diagnostic.severity.HINT,
					max = vim.diagnostic.severity.ERROR,
				},
				icons = {
					hint = icons.diagnostics.BoldHint,
					info = icons.diagnostics.BoldInformation,
					warning = icons.diagnostics.BoldWarning,
					error = icons.diagnostics.BoldError,
				},
			},
		})
		vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { silent = true, noremap = true }) -- Opens the file tree
	end
}
