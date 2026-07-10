function load_session(opts)

	local path = vim.fn.expand(opts.args)
	vim.cmd("source " .. path)
	vim.notify("Session loaded successfully", "info", {
		title = "Sessions",
		icon = " ",
		timeout = 20
	})

end

vim.api.nvim_create_user_command('LoadSession', load_session, { nargs = 1, complete = "file" })

vim.o.sessionoptions="blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
vim.api.nvim_create_autocmd({ "VimLeave", "ExitPre" },
{
	pattern = '',
	command = ":mksession! " .. vim.fn.stdpath("config") .. "/lastsession.vim"
})
