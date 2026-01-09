local function check_pair(char)
	-- Check next char
	if string.sub(vim.fn.getline('.'), vim.fn.col('.'), vim.fn.col('.')) == char then
		return '<Right>'
	else
		return char
	end
end

-- Intelligent autopairs
local function setup_autopairs()
	-- Round brackets ()
	vim.keymap.set('i', '(', '()<Left>', { noremap = true, silent = true })
	vim.keymap.set('i', ')',
	function()
		return check_pair(')')
	end,
	{ noremap = true, silent = true, expr = true})

	-- Curly brackets {}
	vim.keymap.set('i', '{', '{}<Left>', { noremap = true, silent = true })
	vim.keymap.set('i', '}',
	function()
		return check_pair('}')
	end,
	{ noremap = true, silent = true, expr = true })

	-- Square brackets []
	vim.keymap.set('i', '[', '[]<Left>', { noremap = true, silent = true })
	vim.keymap.set('i', ']',
	function()
		return check_pair(']')
	end,
	{ noremap = true, silent = true, expr = true })

	-- Double quotes ""
	vim.keymap.set('i', '"',
	function()
		if string.sub(vim.fn.getline('.'), vim.fn.col('.'), vim.fn.col('.')) == '"' then
			return "<Right>"
		else
			local char_before = string.sub(vim.fn.getline('.'), vim.fn.col('.') - 2, vim.fn.col('.') - 2)
			if char_before == "\\" then
				return "\"" -- It was an escaped quote, just insert one
			else
				return "\"\"<Left>" -- Insert pair and move inside
			end
		end
	end,
	{ noremap = true, silent = true, expr = true })

	-- Simple quotes ''
	vim.keymap.set('i', "'",
	function()
		if string.sub(vim.fn.getline('.'), vim.fn.col('.'), vim.fn.col('.')) == "'" then
			return "<Right>"
		else
			local char_before = string.sub(vim.fn.getline('.'), vim.fn.col('.') - 2, vim.fn.col('.') - 2)
			if char_before == "\\" then
				return "\'" -- It was an escaped quote, just insert one
			else
				return "\'\'<Left>" -- Insert pair and move inside
			end
		end
	end,	
	{ noremap = true, silent = true, expr = true })

	vim.keymap.set("i", "<BS>",
	function()
		-- Get the character at the left of the cursor
		local next_char = string.sub(vim.fn.getline('.'), vim.fn.col('.'), vim.fn.col('.')) -- El carácter 'delante' del cursor
		local prev_char = string.sub(vim.fn.getline('.'), vim.fn.col('.') - 1, vim.fn.col('.') - 1) -- El carácter 'detrás' del cursor
		local pairs = {
			['('] = ')',
			['{'] = '}',
			['['] = ']',
			['"'] = '"',
			["'"] = "'",
		}

		-- Check if the characters make an empty pair
		-- If the character before the cursor is a opening pair
		-- And the character after the cursor is the closing pair
		if pairs[prev_char] and pairs[prev_char] == next_char then
			-- If is a empty pair, delete both chars
			return "<Del><BS>"
		else
			-- If not, just normal behaviour
			return "<BS>"
		end

	end,
	{ noremap = true, silent = true, expr = true })

	-- Smart indent for pairs
	vim.keymap.set("i", "<CR>",
	function()
		local next_char = string.sub(vim.fn.getline('.'), vim.fn.col('.'), vim.fn.col('.')) -- El carácter 'delante' del cursor
		local prev_char = string.sub(vim.fn.getline('.'), vim.fn.col('.') - 1, vim.fn.col('.') - 1) -- El carácter 'detrás' del cursor
		local pairs = {
			['('] = ')',
			['{'] = '}',
			['['] = ']',
			['"'] = '"',
			["'"] = "'",
		}

		if pairs[prev_char] and pairs[prev_char] == next_char then
			return "<CR><Tab><CR><Up><Right>"
		else
			return "<CR>"
		end
	end,
	{ noremap = true, silent = true, expr = true })
end

-- Lazy load autopairs when entering insert mode
vim.api.nvim_create_autocmd(
	"InsertEnter",
	{ callback = setup_autopairs }
)
