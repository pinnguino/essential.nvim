return {
	'saghen/blink.cmp',
	event = "InsertEnter",
	dependencies = { 'rafamadriz/friendly-snippets' },

	version = '1.*',
	---@module 'blink.cmp'
	---@type blink.cmp.Config
	opts = {
		keymap = {
			preset = 'default',
			['<C-k>'] = { 'select_prev', 'fallback' },
			['<C-j>'] = { 'select_next', 'fallback' },
			['<C-l>'] = { 'accept', 'fallback' },
			['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
			['<C-e>'] = { 'hide', 'fallback' },
			['<Tab>'] = {
				function(cmp)
					if cmp.snippet_active() then return cmp.accept()
					else return cmp.select_and_accept() end
				end,
				'snippet_forward',
				'fallback'
			},
			['<S-Tab>'] = { 'snippet_backward', 'fallback' },
		},

		appearance = {
			nerd_font_variant = 'mono'
		},
		completion = {
			documentation = {
				auto_show = false
			},
			menu = {
				border = "solid", -- or "solid"
				winhighlight = "Normal:BlinkCmpMenu,FloatBorder:BlinkCmpMenuBorder,CursorLine:PmenuSel,Search:None",
			}
		},
		sources = {
			default = { 'lsp', 'path', 'snippets', 'buffer' },
		},

		-- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
		-- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
		-- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
		--
		-- See the fuzzy documentation for more information
		fuzzy = { implementation = "prefer_rust_with_warning" }
	},
	opts_extend = { "sources.default" }
}
