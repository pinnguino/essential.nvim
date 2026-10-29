return {
    "nvimdev/indentmini.nvim",
    event = "BufReadPre",
    opts = {
        only_current = false,
        enabled = true,
        char = '▏',
        minlevel = 2,
        exclude = { 'markdown', 'help', 'text', 'rst' },
        exclude_nodetype = { 'string', 'comment' }
    }
}
