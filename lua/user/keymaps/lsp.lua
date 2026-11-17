-- LSP

-- Shorten function name
local keymap = vim.keymap.set

-- Common options for almost every keymap
local opts = { noremap = true, silent = true }
keymap("n", "gR", "<cmd>FzfLua lsp_references<CR>", opts) -- Goto references
keymap("n", "gD", "<cmd>FzfLua lsp_declarations<CR>", opts ) -- Goto declarations
keymap("n", "gd", "<cmd>FzfLua lsp_definitions<CR>", opts) -- Goto definition
keymap("n", "gi", "<cmd>FzfLua lsp_implementations<CR>", opts) -- Goto implementation
keymap("n", "gt", "<cmd>FzfLua lsp_typedefs<CR>", opts)
keymap("n", "<leader>ca", function() require("fzf-lua").lsp_code_actions({}) end, opts) -- Code action
keymap("n", "<leader>rn", vim.lsp.buf.rename, opts) -- Rename
keymap("n", "<leader>dd",  "<cmd>FzfLua lsp_document_diagnostics<CR>", opts)
keymap("n", "gl", function() vim.diagnostic.open_float({ border = "rounded" }) end, opts) -- Open floating diagnostics
keymap("n", "[d", function() vim.diagnostic.jump({ count = -1, float = true }) end, opts) -- Jump to previous diagnostic
keymap("n", "]d", function() vim.diagnostic.jump({ count = 1, float = true }) end, opts) -- Jump to next diagnostic
keymap("n", "K", function() vim.lsp.buf.hover({ border = "rounded" }) end, opts) -- Hover on cursor
