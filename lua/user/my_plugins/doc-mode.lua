function DocumentMode()
	local status = "disabled"
	if vim.o.wrap == false or vim.o.linebreak == false then
		-- Enable line wrapping
		vim.o.wrap = true
		vim.o.linebreak = true
		-- Better motions for moving in wrapped text
		vim.keymap.set("n", "j", "gj", { noremap = true, silent=true })
		vim.keymap.set("n", "k", "gk", { noremap = true, silent=true })
		status = "enabled"
	else
		vim.o.wrap = false
		vim.o.linebreak = false
		status = "disabled"
	end
	vim.notify(" Doc mode " .. status, info, {
		render = "compact",
		timeout = 10
	})
end

vim.api.nvim_create_user_command('DocMode', DocumentMode, {})
vim.keymap.set("n", "<leader>D", ":DocMode<CR>", {noremap = true, silent = true})
