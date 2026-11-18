local function get_current_lsp()
    local buffer = vim.api.nvim_get_current_buf()
    local lsps = vim.lsp.get_clients({ bufnr = buffer })
    if #lsps == 0 then
        return ""
    end
    return " " .. lsps[1].name
end


return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    event = 'VeryLazy',
    opts = {
        options = {
            icons_enabled = true,
            theme = 'auto',
            component_separators = { left = '│', right = '│' },
            section_separators = { left = '', right = '' },
            disabled_filetypes = {
                statusline = { 'NvimTree', 'dashboard' },
            },
            always_divide_middle = true,
            globalstatus = false,
            refresh = {
                statusline = 1000,
            },
        },
        sections = {
            lualine_a = { { 'mode', gui = 'bold' } },
            lualine_b = {
                { 'branch', icon = '' },
                'diff',
                'diagnostics',
            },
            lualine_c = { 'filename' },
            lualine_x = { get_current_lsp, 'filetype' },
            lualine_y = {},
            lualine_z = { 'location' },
        },
    },
}
