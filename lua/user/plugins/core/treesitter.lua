return {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",

    config = function()
        local parsers_list = {
            "lua",
            "vimdoc",
            "c",
            "cpp",
            "markdown",
            "markdown_inline",
            "html",
            "css",
            "javascript",
            "typescript",
            "sql",
            "python",
            "bash",
            "zsh",
            "git_config",
            "gitignore",
            "json"
        }

        require("nvim-treesitter").setup()
        require("nvim-treesitter").install(parsers_list)

        vim.api.nvim_create_autocmd("FileType", {
            pattern = parsers_list,
            callback = function(args)
                -- Enable syntax highlighting
                vim.treesitter.start(args.buf)

                -- Enable indentation from tree-sitter
                vim.bo[args.buf].indentexpr =
                [[v:lua.require'nvim-treesitter'.indentexpr()]]
            end,
        })
    end,
}
