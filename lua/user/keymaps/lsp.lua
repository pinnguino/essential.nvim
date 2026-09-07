-- LSP

vim.keymap.set("n", "gR", "<cmd>FzfLua lsp_references<CR>", opts) -- Goto references
vim.keymap.set("n", "gD", "<cmd>FzfLua lsp_declarations<CR>", opts ) -- Goto declarations
vim.keymap.set("n", "gd", "<cmd>FzfLua lsp_definitions<CR>", opts) -- Goto definition
vim.keymap.set("n", "gi", "<cmd>FzfLua lsp_implementations<CR>", opts) -- Goto implementation
vim.keymap.set("n", "gt", "<cmd>FzfLua lsp_typedefs<CR>", opts)
vim.keymap.set("n", "<leader>ca", function() require("fzf-lua").lsp_code_actions({}) end, opts) -- Code action
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- Rename
vim.keymap.set("n", "<leader>dd",  "<cmd>FzfLua lsp_document_diagnostics<CR>", opts)
vim.keymap.set("n", "gl", function() vim.diagnostic.open_float({ border = "rounded" }) end, opts) -- Open floating diagnostics
vim.keymap.set("n", "[d", function() vim.diagnostic.jump({ count = -1, float = true }) end, opts) -- Jump to previous diagnostic
vim.keymap.set("n", "]d", function() vim.diagnostic.jump({ count = 1, float = true }) end, opts) -- Jump to next diagnostic
vim.keymap.set("n", "K", function() vim.lsp.buf.hover({ border = "rounded" }) end, opts) -- Hover on cursor
