return {
	"nvimdev/indentmini.nvim",
	event = "BufReadPre",
	config = function()
		require("indentmini").setup({
			only_current = false,
			enabled = true,
			char = '▏',
			minlevel = 2,
			exclude = { 'markdown', 'help', 'text', 'rst' },
			exclude_nodetype = { 'string', 'comment' }
		})
	end
}
