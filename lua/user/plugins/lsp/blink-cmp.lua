return {
    "saghen/blink.cmp",
    event = { "BufReadPre", "BufNewFile", "InsertEnter", "CmdlineEnter" },
    dependencies = { "rafamadriz/friendly-snippets" },
    version = "1.*",

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
        keymap = require("user.keymaps.completion"), -- Import keymaps
        appearance = { nerd_font_variant = "mono" },
        completion = {
            documentation = { auto_show = false },
            menu = {
                border = "solid",
                winhighlight = "Normal:BlinkCmpMenu,FloatBorder:BlinkCmpMenuBorder,CursorLine:PmenuSel,Search:None",
            },
        },
        sources = { default = { "lsp", "path", "snippets", "buffer" } },
        fuzzy = { implementation = "prefer_rust_with_warning" },
    },
    opts_extend = { "sources.default" },

    config = function(_, opts)
        require("blink.cmp").setup(opts)

        vim.lsp.config("*", {
            capabilities = require("blink.cmp").get_lsp_capabilities(),
        })
    end,
}
