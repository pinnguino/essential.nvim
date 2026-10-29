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
            lualine_x = { 'filetype' },
            lualine_y = {},
            lualine_z = { 'location' },
        },
    },
}
