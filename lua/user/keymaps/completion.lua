-- blink.cmp keymaps (consumed by the plugin spec, not by keymaps/init.lua)
return {
	preset = "default",
	["<C-k>"] = { "select_prev", "fallback" }, -- Previous item
	["<C-j>"] = { "select_next", "fallback" }, -- Next item
	["<C-l>"] = { "accept", "fallback" }, -- Accept suggestion
	["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
	["<C-e>"] = { "hide", "fallback" },
	["<Tab>"] = {
		function(cmp)
			if cmp.snippet_active() then
				return cmp.accept()
			else
				return cmp.select_and_accept()
			end
		end,
		"snippet_forward",
		"fallback",
	},
	["<S-Tab>"] = { "snippet_backward", "fallback" },
}
