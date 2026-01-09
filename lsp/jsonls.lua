return {
	cmd = { "vscode-json-languageserver", "--stdio" },
	filetypes = { "json", "jsonc" },
	dependencies = {
		"b0o/schemastore.nvim",
	},
	init_options = {
		provideFormatter = true,
	},
	root_markers = { ".git" },
}
