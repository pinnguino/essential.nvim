-- Tree file explorer
  
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", opts) -- Opens the file tree

local function on_attach(bufnr) -- This function will be called in nvim-tree plugin config
    local api = require('nvim-tree.api')
    local function opts(desc)
        return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end
    -- Setting personal keymaps
    vim.keymap.set('n', 'l', api.node.open.edit, opts('Open'))
    vim.keymap.set('n', 'cd', api.tree.change_root_to_node, opts('CD'))
    vim.keymap.set('n', 'h', api.node.navigate.parent_close, opts('Close'))
    vim.keymap.set('n', 'v', api.node.open.vertical, opts('OpenInVsplit'))
    vim.keymap.set('n', 'r', api.fs.rename, opts('Rename'))
    vim.keymap.set('n', 'a', api.fs.create, opts('CreateFile'))
    vim.keymap.set('n', 'd', api.fs.remove, opts('Delete'))
    vim.keymap.set('n', 'y', api.fs.copy.node, opts('Copy'))
    vim.keymap.set('n', 'x', api.fs.cut, opts('Cut'))
    vim.keymap.set('n', 'p', api.fs.paste, opts('Paste'))
    vim.keymap.set('n', 'Y', api.fs.copy.relative_path, opts('CopyRelativePath'))
end

return on_attach
