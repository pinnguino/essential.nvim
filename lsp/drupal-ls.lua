return {
	cmd = {'drupal-lsp'},
	filetypes = { 'php'},
	root_dir = function(fname)
		return lspconfig.util.root_pattern('composer.json', '.git')(fname)
	end
}
